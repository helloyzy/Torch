//
//  TCOrderObject.h
//  Torch
//
//  Created by bo hu on 9/5/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCOrderObject : NSObject

@property (nonatomic,copy) NSString *storeName;
@property (nonatomic,copy) NSString *orderID;
@property (nonatomic,copy) NSString *orderAmount;
@property (nonatomic,copy) NSDate   *orderDate;
@property (nonatomic,copy) NSString *orderStatus;

@property (nonatomic,copy) NSMutableArray *orderItems;

@end
