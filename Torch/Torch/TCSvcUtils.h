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
+ (void)orderRequestService;

@end
