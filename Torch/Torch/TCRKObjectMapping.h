//
//  TCRKObjectMapping.h
//  Torch
//
//  Created by Whitman Yang on 9/18/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "RKObjectMapping.h"

@interface TCRKObjectMapping : RKObjectMapping

+(TCRKObjectMapping *)tcInverseMapping:(RKObjectMapping *)mapping;

@end
