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
#import "Priority.h"
#import "Promotion.h"
#import "Survey.h"
#import "TCRKObjectMapping.h"
#import "TCLoginCredential.h"

#define TC_SVC_BASE @"https://hmuled01.hersheys.com:10040/torch/v1"
#define TC_SVC_BASE_URL [NSURL URLWithString:TC_SVC_BASE]
#define TC_SVC_LOGIN [TC_SVC_BASE stringByAppendingPathComponent:@"fetchData"]
#define TC_SVC_SUCCESS_CODE RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)
#define TC_SVC_FETCHMEXICO @"https://hmuled01.hersheys.com:10040/torch/v3/mx/fetchmexico"

@implementation TCSvcUtils

+ (void)syncDataService:(TC_SVC_BLOCK_SUCCESS)success
                failure:(TC_SVC_BLOCK_FAILURE)failure {
    RKEntityMapping * salesRepMapping = [SalesRep objectMapping];
    
    RKResponseDescriptor * responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:salesRepMapping method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:TC_SVC_SUCCESS_CODE];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:IB_URL(TC_SVC_LOGIN)];
    RKManagedObjectRequestOperation * operation = [[RKManagedObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
    [operation.HTTPRequestOperation setWillSendRequestForAuthenticationChallengeBlock:^(NSURLConnection * conn, NSURLAuthenticationChallenge * challenge) {
        NSLog(@"Sync data service receive credential challege.");
        if ([challenge previousFailureCount] == 0) {
            TCLoginCredential *credential = [TCLoginCredential sharedInstance];
            NSURLCredential * newCred = [NSURLCredential credentialWithUser:credential.username password:credential.password persistence:NSURLCredentialPersistenceForSession];
            [[challenge sender] useCredential:newCred forAuthenticationChallenge:challenge];
        } else {
            [[challenge sender] cancelAuthenticationChallenge:challenge];
        }
    }];
    
    RKManagedObjectStore * managedObjectStore = [RKManagedObjectStore defaultStore];
    operation.managedObjectContext = managedObjectStore.mainQueueManagedObjectContext;
    operation.managedObjectCache = managedObjectStore.managedObjectCache;
    [operation setCompletionBlockWithSuccess:success failure:failure];
//    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation * operation, RKMappingResult * result) {
//        SalesRep * salesRep = [result firstObject];
//        NSLog(@"SalesRep networkId %@", salesRep.networkId);
//    } failure:^(RKObjectRequestOperation * operation, NSError * error) {
//        NSLog(@"Failed with error: %@", [error localizedDescription]);
//    }];
    NSOperationQueue * operationQueue = [NSOperationQueue new];
    [operationQueue addOperation:operation];
    
    //    RKObjectManager * objectManager = [RKObjectManager managerWithBaseURL:IB_URL(@"https://hmuled01.hersheys.com:10040")];
    //    objectManager.managedObjectStore = managedObjectStore;
    //    [objectManager.HTTPClient setAuthorizationHeaderWithUsername:@"HCTMM300" password:@"Welcome1"];
    //    [RKObjectManager setSharedManager:objectManager];
    //    [objectManager addResponseDescriptor:responseDescriptor];
    //    [objectManager getObjectsAtPath:@"/torch/v1/fetchData" parameters:nil success:nil failure:nil];
}

+ (void)fetchMexicoDataService:(TC_SVC_BLOCK_SUCCESS)success
                failure:(TC_SVC_BLOCK_FAILURE)failure {
    RKEntityMapping *priorityMapping = [Priority objectMapping];
    RKResponseDescriptor *priorityResponse = [RKResponseDescriptor responseDescriptorWithMapping:priorityMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"priorities" statusCodes:TC_SVC_SUCCESS_CODE];
    
    RKEntityMapping *promotionMapping = [Promotion objectMapping];
    RKResponseDescriptor *promotionResponse = [RKResponseDescriptor responseDescriptorWithMapping:promotionMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"promotions" statusCodes:TC_SVC_SUCCESS_CODE];
    
    RKEntityMapping *surveyMapping = [Survey objectMapping];
    RKResponseDescriptor *surveyResponse = [RKResponseDescriptor responseDescriptorWithMapping:surveyMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"survey" statusCodes:TC_SVC_SUCCESS_CODE];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:IB_URL(TC_SVC_FETCHMEXICO)];
    RKManagedObjectRequestOperation * operation = [[RKManagedObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[priorityResponse, promotionResponse, surveyResponse]];
    [operation.HTTPRequestOperation setWillSendRequestForAuthenticationChallengeBlock:^(NSURLConnection * conn, NSURLAuthenticationChallenge * challenge) {
        NSLog(@"Sync data service receive credential challege.");
        if ([challenge previousFailureCount] == 0) {
            TCLoginCredential *credential = [TCLoginCredential sharedInstance];
            NSURLCredential * newCred = [NSURLCredential credentialWithUser:credential.username password:credential.password persistence:NSURLCredentialPersistenceForSession];
            [[challenge sender] useCredential:newCred forAuthenticationChallenge:challenge];
        } else {
            [[challenge sender] cancelAuthenticationChallenge:challenge];
        }
    }];
    
    RKManagedObjectStore * managedObjectStore = [RKManagedObjectStore defaultStore];
    operation.managedObjectContext = managedObjectStore.mainQueueManagedObjectContext;
    operation.managedObjectCache = managedObjectStore.managedObjectCache;
    [operation setCompletionBlockWithSuccess:success failure:failure];
    NSOperationQueue * operationQueue = [NSOperationQueue new];
    [operationQueue addOperation:operation];
}

+ (void)orderRequestService {
    RKObjectMapping * mapping = [TCRKObjectMapping tcInverseMapping:[Order objectMapping]];    
    RKRequestDescriptor * requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:mapping objectClass:[Order class] rootKeyPath:nil method:RKRequestMethodAny];
    
    Order * order = [[Order all] objectAtIndex:0];
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:TC_SVC_BASE_URL];
    [manager addRequestDescriptor:requestDescriptor];
    manager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    // RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    [[RKObjectManager sharedManager] postObject:order path:@"order" parameters:nil success:^(RKObjectRequestOperation * operation, RKMappingResult * result) {
        NSLog(@"Order request succeed!");
    } failure:^(RKObjectRequestOperation * operation, NSError * error) {
        NSLog(@"Failed with error: %@", [error localizedDescription]);
    }];

}

@end
