//
//  HersheySSOUtils.h
//  HersheySSO
//
//  Created by Daniel Miller on 2/29/12.
//  Copyright (c) 2012 The Hershey Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;

@interface HersheySSOUtils : NSObject

+ (BOOL) setKeychainWithUsername:(NSString *)username andPassword:(NSString *)password;
+ (void) logout;

// credential management
+ (void) extendCredentials;
+ (BOOL) needsCredentials;

// sign the request with current credentials
// request signing will likely be different for each service - some may be SOAP, REST header values, etc
+ (NSMutableURLRequest *) signRequest:(NSMutableURLRequest *)request;

// methods to retrieve credential information
+ (NSString *) credentialToken;
+ (NSString *) fetchUsername;
+ (NSString *) fetchPassword;
+ (NSString *) getCredsEnteredQueueName;
+ (NSString *) getCredsErrorQueueName;
+ (NSString *) getDidLogoutQueueName;
+ (NSDate *) credentialExpirationDate;

+ (void) displayAuthenticateView:(UIViewController *)vc;

@end
