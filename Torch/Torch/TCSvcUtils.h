//
//  TCSvcUtils.h
//  Torch
//
//  Created by Yang Whitman on 13-9-16.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RKObjectRequestOperation, RKMappingResult;

typedef void (^TC_SVC_BLOCK_SUCCESS)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult);
typedef void (^TC_SVC_BLOCK_FAILURE)(RKObjectRequestOperation * operation, NSError * error);

@interface TCSvcUtils : NSObject

+ (void)syncDataService:(TC_SVC_BLOCK_SUCCESS)success
                failure:(TC_SVC_BLOCK_FAILURE)failure;
+ (void)fetchMexicoDataService:(TC_SVC_BLOCK_SUCCESS)success
                       failure:(TC_SVC_BLOCK_FAILURE)failure;

//Adding success and failure blocks to this service because I want it to hit my failure block in TCLoginViewController if it should fail
//That failure block handles the UI for informing the user of service issues and allowing them to retry the service calls.
+ (void)orderRequestService:(TC_SVC_BLOCK_SUCCESS)success
                    failure:(TC_SVC_BLOCK_FAILURE)failure;

@end
