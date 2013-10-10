//
//  HersheySSOUtils.m
//  HersheySSO
//
//  Created by Daniel Miller on 2/29/12.
//  Copyright (c) 2012 The Hershey Company. All rights reserved.
//

#import "HersheySSOUtils.h"
#import "DateUtils.h"
#import <Security/Security.h>
#define kHersheySSOKeychainGroup @"25H2K2H8ZJ.hersheySSO"  //<--------YOU NEED TO SET THIS CORRECTLY!!!
#define kAuthenticationServiceName @"com.hersheys.plugin.security"
#define kCredentialToken @"HersheySSOAuthenticationToken"
#define kCredentialUsername @"HersheySSOUsernameToken"
#define kCredentialPassword @"HersheySSOPasswordToken"
#define kCredentialExpiration @"HersheySSOCredentialsExpirationDate"
#define kExpirationTimeout 43200    // 30 days timeout

NSString* const CREDENTIALS_SAVED = @"CREDENTIALS_SAVED";
NSString* const CREDENTIALS_ERROR = @"CREDENTIALS_ERROR";
NSString* const DID_LOGOUT = @"DID_LOGOUT";

// *** PRIVATE METHODS DEF *** //
@interface HersheySSOUtils (Private)
+ (NSMutableDictionary *) keychainSearch:(NSString *)identifier;
+ (NSString *) getValueForIdentifier:(NSString *)identifer;
+ (BOOL) setValue:(NSString *)value forIdentifier:(NSString *)identifier;
+ (void) deleteValueForIdentifier:(NSString *)identifier;
@end

@implementation HersheySSOUtils

+ (BOOL) setKeychainWithUsername:(NSString *)username andPassword:(NSString *)password {
    // for testing purposes, each call to this method authenticates successfully
    
    BOOL usernameWasSet = [self setValue:username forIdentifier:kCredentialUsername];
    BOOL passwordWasSet = [self setValue:password forIdentifier:kCredentialPassword];
    
    // set the token - app specific
    if (usernameWasSet && passwordWasSet) {
        // token set, now set the credential expiration
        [self extendCredentials];
        [[NSNotificationCenter defaultCenter] postNotificationName:CREDENTIALS_SAVED object:nil];
    } else {
        NSLog(@"Unable to set username, password, or both.");
        [[NSNotificationCenter defaultCenter] postNotificationName:CREDENTIALS_ERROR object:nil];
    }
    
    return YES;
}

+ (void) logout {
    // destroy token AND expiration date
    [self deleteValueForIdentifier:kCredentialToken];
    [self deleteValueForIdentifier:kCredentialUsername];
    [self deleteValueForIdentifier:kCredentialPassword];
    [self deleteValueForIdentifier:kCredentialExpiration];
    [[NSNotificationCenter defaultCenter] postNotificationName:DID_LOGOUT object:nil];
}

// credential management
+ (void) extendCredentials {
    NSDate *newExpireDate = [DateUtils dateWithTimeout:kExpirationTimeout];
    NSString *newExpireString = [DateUtils stringFromDate:newExpireDate withFormat:kDateFormat];
    BOOL success = [self setValue:newExpireString forIdentifier:kCredentialExpiration];
    if (!success) {
        NSLog(@"Unable to extend credentials.");
    }
}

+ (BOOL) needsCredentials {
    
    //fix for REXPRODUCTIVITY-162 - only prompt if a username is not set
    NSDate *expireDate = [self credentialExpirationDate];
    NSDate *now = [NSDate date];
    BOOL credentialExpired = NO;
    
    if ([now compare:expireDate] == NSOrderedDescending) {
        credentialExpired = YES;
    }
    
    if ([self fetchUsername] == nil || credentialExpired) {
        return YES;
    }
    
    return NO;
}


// sign the request with current credentials - we'll add the token as an HTTP header field
+ (NSMutableURLRequest *) signRequest:(NSMutableURLRequest *)request {
    NSString *token = [self credentialToken];
    if (token) {
        [request addValue:token forHTTPHeaderField:@"auth-token"];
    }
    return request;
}

// methods to retrieve credential information
+ (NSString *) credentialToken {
    NSString *token = [self getValueForIdentifier:kCredentialToken];
    return token;
}

// methods to retrieve credential information
+ (NSString *) fetchUsername {
    NSString *token = [self getValueForIdentifier:kCredentialUsername];
    //TIMEENTRY-445:  Enforce that all login ID's are sent back as uppercase
    return [token uppercaseString];
}

// methods to retrieve credential information
+ (NSString *) fetchPassword {
    NSString *token = [self getValueForIdentifier:kCredentialPassword];
    return token;
}

+ (NSDate *) credentialExpirationDate {
    NSString *expirationDateString = [self getValueForIdentifier:kCredentialExpiration];
    if (expirationDateString) {
        // convert to date
        return [DateUtils dateFromString:expirationDateString withFormat:kDateFormat];
    }
    return nil;
}


#pragma mark -
#pragma mark PRIVATE METHODS
+ (NSMutableDictionary *) keychainSearch:(NSString *)identifier {
    NSMutableDictionary *keychainSearch = [[[NSMutableDictionary alloc] init] autorelease];
    
#if TARGET_IPHONE_SIMULATOR
    NSLog(@"Running on simulator - no keychain group will be set for group");
#else
    [keychainSearch setObject:kHersheySSOKeychainGroup forKey:(id)kSecAttrAccessGroup];   // inform the search that we're using the shared keychain
#endif
    [keychainSearch setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];   // set the type to generic password - other options are certification, internet password, etc
	
    NSData *encodedIdentifier = [identifier dataUsingEncoding:NSUTF8StringEncoding];
    [keychainSearch setObject:encodedIdentifier forKey:(id)kSecAttrGeneric];
    [keychainSearch setObject:encodedIdentifier forKey:(id)kSecAttrAccount];
    [keychainSearch setObject:kAuthenticationServiceName forKey:(id)kSecAttrService];
    
    //dpm 8/20/2012 -
    // set this so that passwords are not capable of being migrated to other devices, and are encrypted
    // in the event of a jailbreak of the device.
    //    [keychainSearch setObject:(id)kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly forKey:(id)kSecAttrAccessible];
	
    return keychainSearch;
}

+ (NSString *) getValueForIdentifier:(NSString *)identifier {
    @try {
        NSMutableDictionary *search = [self keychainSearch:identifier];
        
        [search setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit]; // limit it to the first result
        [search setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];    // return data vs a dictionary of attributes
        
        NSData *value = nil;
        OSStatus status = SecItemCopyMatching((CFDictionaryRef)search,
                                              (CFTypeRef *)&value);
        
        if (status == noErr) {
            return [NSString stringWithUTF8String:[value bytes]];;
        }
        
        return nil;
    }
    @catch (NSException *exception) {
        [self deleteValueForIdentifier:identifier];
        return @"";
    }
}

+ (BOOL) setValue:(NSString *)value forIdentifier:(NSString *)identifier {
    
    @try {
        // check if value exists
        NSString *existingValue = [self getValueForIdentifier:identifier];
        if (existingValue) {
            
            if (![existingValue isEqualToString:value]) {
                // update value
                NSMutableDictionary *search = [self keychainSearch:identifier];
                
                NSData *valueData = [value dataUsingEncoding:NSUTF8StringEncoding];
                NSMutableDictionary *update = [NSMutableDictionary dictionaryWithObjectsAndKeys:valueData, (id)kSecValueData, nil];
                
                OSStatus status = SecItemUpdate((CFDictionaryRef)search,
                                                (CFDictionaryRef)update);
                
                if (status == errSecSuccess) {
                    return YES;
                }
                return NO;
            }
            
        } else {
            // create new entry
            NSMutableDictionary *add = [self keychainSearch:identifier];
            
            NSData *valueData = [value dataUsingEncoding:NSUTF8StringEncoding];
            [add setObject:valueData forKey:(id)kSecValueData];
            
            OSStatus status = SecItemAdd((CFDictionaryRef)add,NULL);
            if (status == errSecSuccess) {
                return YES;
            }
            return NO;
            
        }
        
        return YES;
    }
    @catch (NSException *exception) {
        //bad stuff happened, remove the key from the keychain
        [self deleteValueForIdentifier:identifier];
    }
    
}

+ (void) deleteValueForIdentifier:(NSString *)identifier {
    NSMutableDictionary *search = [self keychainSearch:identifier];
    SecItemDelete((CFDictionaryRef)search);
}

+ (NSString *) getCredsEnteredQueueName {
    return CREDENTIALS_SAVED;
}

+ (NSString *) getCredsErrorQueueName {
    return CREDENTIALS_ERROR;
}

+ (NSString *) getDidLogoutQueueName {
    return DID_LOGOUT;
}

@end
