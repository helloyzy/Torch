//
//  TCSvcUtils.m
//  Torch
//
//  Created by Yang Whitman on 13-9-16.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCSvcUtils.h"
#import <RestKit/RestKit.h>
#import "IBFunctions.h"
#import "NSManagedObject+InnerBand.h"

#import "SalesRep.h"
#import "Order.h"
#import "OrderCredit.h"
#import "Priority.h"
#import "Promotion.h"
#import "Survey.h"
#import "TCRKObjectMapping.h"
#import "TCLoginCredential.h"
#import "Product.h"
#import "SurveyResponse.h"

// #define TC_SVC_BASE_URL [NSURL URLWithString:TC_SVC_BASE]
// #define TC_SVC_LOGIN [TC_SVC_BASE stringByAppendingPathComponent:@"fetchData"]
#define TC_SVC_SUCCESS_CODE RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)
#define TC_SVC_BASE @"https://hmuled01.hersheys.com:10040/torch/v3"
#define TC_SVC_FETCH @"https://hmuled01.hersheys.com:10040/torch/v3/rsr"
#define TC_SVC_FETCHMEXICO @"https://hmuled01.hersheys.com:10040/torch/v3/mx/fetchmexico"
#define TC_SVC_PRODUCTS @"https://hmuled01.hersheys.com:10040/torch/v3/mx/pull/products"
#define TC_SVC_ORDER @"https://hmuled01.hersheys.com:10040/torch/v3/mx/ordercredit"
#define TC_SVC_ORDER_PATH @"mx/ordercredit"
#define TC_SVC_SURVEY_PATH @"mx/surveys"

@implementation TCSvcUtils

+ (void)syncDataService:(TC_SVC_BLOCK_SUCCESS)success
                failure:(TC_SVC_BLOCK_FAILURE)failure {
    // RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    RKEntityMapping * salesRepMapping = [SalesRep objectMapping];
    
    RKResponseDescriptor * responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:salesRepMapping method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:TC_SVC_SUCCESS_CODE];
    
    [self sendRequest:TC_SVC_FETCH responseDescriptors:@[responseDescriptor] success:success failure:failure];
    
//    NSURLRequest * request = [NSURLRequest requestWithURL:IB_URL(TC_SVC_LOGIN)];
//    RKManagedObjectRequestOperation * operation = [[RKManagedObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
//    [operation.HTTPRequestOperation setWillSendRequestForAuthenticationChallengeBlock:^(NSURLConnection * conn, NSURLAuthenticationChallenge * challenge) {
//        NSLog(@"Sync data service receive credential challege.");
//        if ([challenge previousFailureCount] == 0) {
//            TCLoginCredential *credential = [TCLoginCredential sharedInstance];
//            NSURLCredential * newCred = [NSURLCredential credentialWithUser:credential.username password:credential.password persistence:NSURLCredentialPersistenceForSession];
//            [[challenge sender] useCredential:newCred forAuthenticationChallenge:challenge];
//        } else {
//            [[challenge sender] cancelAuthenticationChallenge:challenge];
//        }
//    }];
//    
//    RKManagedObjectStore * managedObjectStore = [RKManagedObjectStore defaultStore];
//    operation.managedObjectContext = managedObjectStore.mainQueueManagedObjectContext;
//    operation.managedObjectCache = managedObjectStore.managedObjectCache;
//    [operation setCompletionBlockWithSuccess:success failure:failure];
//    NSOperationQueue * operationQueue = [NSOperationQueue new];
//    [operationQueue addOperation:operation];
}

+ (void)fetchMexicoDataService:(TC_SVC_BLOCK_SUCCESS)success
                failure:(TC_SVC_BLOCK_FAILURE)failure {
    RKEntityMapping *priorityMapping = [Priority objectMapping];
    RKResponseDescriptor *priorityResponse = [RKResponseDescriptor responseDescriptorWithMapping:priorityMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"priorities" statusCodes:TC_SVC_SUCCESS_CODE];
    
    RKEntityMapping *promotionMapping = [Promotion objectMapping];
    RKResponseDescriptor *promotionResponse = [RKResponseDescriptor responseDescriptorWithMapping:promotionMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"promotions" statusCodes:TC_SVC_SUCCESS_CODE];
    
    RKEntityMapping *surveyMapping = [Survey objectMapping];
    RKResponseDescriptor *surveyResponse = [RKResponseDescriptor responseDescriptorWithMapping:surveyMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"survey" statusCodes:TC_SVC_SUCCESS_CODE];
    
    [self sendRequest:TC_SVC_FETCHMEXICO responseDescriptors:@[priorityResponse, promotionResponse, surveyResponse] success:success failure:failure];
    
    
//    NSURLRequest * request = [NSURLRequest requestWithURL:IB_URL(TC_SVC_FETCHMEXICO)];
//    RKManagedObjectRequestOperation * operation = [[RKManagedObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[priorityResponse, promotionResponse, surveyResponse]];
//    [operation.HTTPRequestOperation setWillSendRequestForAuthenticationChallengeBlock:^(NSURLConnection * conn, NSURLAuthenticationChallenge * challenge) {
//        NSLog(@"Sync data service receive credential challege.");
//        if ([challenge previousFailureCount] == 0) {
//            TCLoginCredential *credential = [TCLoginCredential sharedInstance];
//            NSURLCredential * newCred = [NSURLCredential credentialWithUser:credential.username password:credential.password persistence:NSURLCredentialPersistenceForSession];
//            [[challenge sender] useCredential:newCred forAuthenticationChallenge:challenge];
//        } else {
//            [[challenge sender] cancelAuthenticationChallenge:challenge];
//        }
//    }];
//    
//    RKManagedObjectStore * managedObjectStore = [RKManagedObjectStore defaultStore];
//    operation.managedObjectContext = managedObjectStore.mainQueueManagedObjectContext;
//    operation.managedObjectCache = managedObjectStore.managedObjectCache;
//    [operation setCompletionBlockWithSuccess:success failure:failure];
//    NSOperationQueue * operationQueue = [NSOperationQueue new];
//    [operationQueue addOperation:operation];
}

//This attempts to follow the same model for conncetions as the other two service calls.
+ (void)syncProductData:(TC_SVC_BLOCK_SUCCESS)success failure:(TC_SVC_BLOCK_FAILURE)failure{
    RKEntityMapping * productMapping = [Product objectMapping];
    
    RKResponseDescriptor * responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:productMapping method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:TC_SVC_SUCCESS_CODE];
    
    [self sendRequest:TC_SVC_PRODUCTS responseDescriptors:@[responseDescriptor] success:success failure:failure];
    
//    NSURLRequest * request = [NSURLRequest requestWithURL:IB_URL(TC_SVC_PRODUCTS)];
//    RKManagedObjectRequestOperation * operation = [[RKManagedObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
//    [operation.HTTPRequestOperation setWillSendRequestForAuthenticationChallengeBlock:^(NSURLConnection * conn, NSURLAuthenticationChallenge * challenge) {
//        NSLog(@"Sync data service receive credential challege.");
//        if ([challenge previousFailureCount] == 0) {
//            TCLoginCredential *credential = [TCLoginCredential sharedInstance];
//            NSURLCredential * newCred = [NSURLCredential credentialWithUser:credential.username password:credential.password persistence:NSURLCredentialPersistenceForSession];
//            [[challenge sender] useCredential:newCred forAuthenticationChallenge:challenge];
//        } else {
//            [[challenge sender] cancelAuthenticationChallenge:challenge];
//        }
//    }];
//    
//    RKManagedObjectStore * managedObjectStore = [RKManagedObjectStore defaultStore];
//    operation.managedObjectContext = managedObjectStore.mainQueueManagedObjectContext;
//    operation.managedObjectCache = managedObjectStore.managedObjectCache;
//    [operation setCompletionBlockWithSuccess:success failure:failure];
//    
//    NSOperationQueue * operationQueue = [NSOperationQueue new];
//    [operationQueue addOperation:operation];
}

+ (void)orderPostService:(OrderCredit *)order
{
    RKObjectMapping * mapping = [TCRKObjectMapping tcInverseMapping:[OrderCredit objectMapping]];
    RKRequestDescriptor * requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:mapping objectClass:[OrderCredit class] rootKeyPath:nil method:RKRequestMethodAny];
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:IB_URL(TC_SVC_BASE)];
    [manager addRequestDescriptor:requestDescriptor];
    manager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    TCLoginCredential *credential = [TCLoginCredential sharedInstance];
    [manager.HTTPClient setAuthorizationHeaderWithUsername:credential.username password:credential.password];
//    NSURLCredential * newCred = [NSURLCredential credentialWithUser:credential.username password:credential.password persistence:NSURLCredentialPersistenceForSession];
//    [manager.HTTPClient setDefaultCredential:newCred];
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    
    [manager postObject:order path:TC_SVC_ORDER_PATH parameters:nil success:^(RKObjectRequestOperation * operation, RKMappingResult * result) {
        NSLog(@"Order post succeed!");
    } failure:^(RKObjectRequestOperation * operation, NSError * error) {
        NSLog(@"Failed with error: %@", [error localizedDescription]);
    }];

}

+ (void)surveyPostService:(NSArray *)surveys
{
    RKObjectMapping * mapping = [TCRKObjectMapping tcInverseMapping:[SurveyResponse objectMapping]];
    RKRequestDescriptor * requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:mapping objectClass:[SurveyResponse class] rootKeyPath:nil method:RKRequestMethodAny];
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:IB_URL(TC_SVC_BASE)];
    [manager addRequestDescriptor:requestDescriptor];
    manager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    TCLoginCredential *credential = [TCLoginCredential sharedInstance];
    [manager.HTTPClient setAuthorizationHeaderWithUsername:credential.username password:credential.password];
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    [manager postObject:surveys path:TC_SVC_SURVEY_PATH parameters:nil success:^(RKObjectRequestOperation * operation, RKMappingResult * result) {
        NSLog(@"Survey post succeed!");
    } failure:^(RKObjectRequestOperation * operation, NSError * error) {
        NSLog(@"Failed with error: %@", [error localizedDescription]);
    }];
    
}

#pragma mark - helper methods

+ (RKManagedObjectRequestOperation *)createRequestOperation:(NSString *)url
                                        responseDescriptors:(NSArray *)responseDescriptors {
    NSURLRequest * request = [NSURLRequest requestWithURL:IB_URL(url)];
    RKManagedObjectRequestOperation * operation = [[RKManagedObjectRequestOperation alloc] initWithRequest:request responseDescriptors:responseDescriptors];
    [operation.HTTPRequestOperation setWillSendRequestForAuthenticationChallengeBlock:^(NSURLConnection * conn, NSURLAuthenticationChallenge * challenge) {
        NSLog(@"Sync data service:(%@) receives credential challege.", [conn currentRequest].URL);
        if ([challenge previousFailureCount] == 0) {
            TCLoginCredential *credential = [TCLoginCredential sharedInstance];
            NSURLCredential * newCred = [NSURLCredential credentialWithUser:credential.username password:credential.password persistence:NSURLCredentialPersistenceForSession];
            [[challenge sender] useCredential:newCred forAuthenticationChallenge:challenge];
        } else {
            [[challenge sender] cancelAuthenticationChallenge:challenge];
        }
    }];
    return operation;
}

+ (void)sendRequest:(NSString *)url
responseDescriptors:(NSArray *)responseDescriptors
            success:(TC_SVC_BLOCK_SUCCESS)success
            failure:(TC_SVC_BLOCK_FAILURE)failure {
    RKManagedObjectRequestOperation *operation = [self createRequestOperation:url responseDescriptors:responseDescriptors];
    
    RKManagedObjectStore * managedObjectStore = [RKManagedObjectStore defaultStore];
    operation.managedObjectContext = managedObjectStore.mainQueueManagedObjectContext;
    operation.managedObjectCache = managedObjectStore.managedObjectCache;
    [operation setCompletionBlockWithSuccess:success failure:failure];
    
    NSOperationQueue * operationQueue = [NSOperationQueue new];
    [operationQueue addOperation:operation];
}

@end
