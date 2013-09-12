//
//  TCCustomer.h
//  Torch
//
//  Created by Whitman Yang on 9/9/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCCustomer : NSObject

@property(nonatomic, copy) NSString * storeName;
@property(nonatomic, copy) NSString * streetName;
@property(nonatomic, copy) NSString * city;
@property(nonatomic, copy) NSString * state;
@property(nonatomic, copy) NSString * postcode;
@property(nonatomic, copy) NSString * municipality;
@property(nonatomic, copy) NSString * country;
@property(nonatomic, copy) NSString * streetRef1;
@property(nonatomic, copy) NSString * streetRef2;
@property(nonatomic, copy) NSString * storePhoneNum;
@property(nonatomic, copy) NSString * rfc;
@property(nonatomic, copy) NSString * customerType;
@property(nonatomic, copy) NSString * visitDay;

@end
