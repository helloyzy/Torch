//
//  TCSvcUtils.h
//  Torch
//
//  Created by Yang Whitman on 13-9-16.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RKObjectRequestOperation, RKMappingResult, OrderCredit;

typedef void (^TC_SVC_BLOCK_SUCCESS)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult);
typedef void (^TC_SVC_BLOCK_FAILURE)(RKObjectRequestOperation * operation, NSError * error);

@interface TCSvcUtils : NSObject

+ (void)syncDataService:(TC_SVC_BLOCK_SUCCESS)success
                failure:(TC_SVC_BLOCK_FAILURE)failure;
+ (void)fetchMexicoDataService:(TC_SVC_BLOCK_SUCCESS)success
                       failure:(TC_SVC_BLOCK_FAILURE)failure;

//Added to call darby's product service and pull the data in from it. This is the third service call made in the sequence on the login screen
+ (void)syncProductData:(TC_SVC_BLOCK_SUCCESS)success
                failure:(TC_SVC_BLOCK_FAILURE)failure;


//Removing the success and failure blocks, as this call is not part of the initial batch
+ (void)orderPostService:(OrderCredit *)order;

+ (void)surveyPostService:(NSArray *)surveys;

@end
