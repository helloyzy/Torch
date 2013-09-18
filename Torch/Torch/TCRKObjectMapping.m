//
//  TCRKObjectMapping.m
//  Torch
//
//  Created by Whitman Yang on 9/18/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCRKObjectMapping.h"
#import <RestKit/RestKit.h>

@implementation TCRKObjectMapping

-(id) defaultValueForAttribute:(NSString *)attributeName {
    return [NSNull null];
}

-(void) tcCopyPropertiesFromMapping:(RKObjectMapping *)mapping {
    self.setDefaultValueForMissingAttributes = mapping.setDefaultValueForMissingAttributes;
    self.setNilForMissingRelationships = mapping.setNilForMissingRelationships;
    self.forceCollectionMapping = mapping.forceCollectionMapping;
    self.performKeyValueValidation = mapping.performKeyValueValidation;
    self.dateFormatters = mapping.dateFormatters;
    self.preferredDateFormatter = mapping.preferredDateFormatter;
}

-(void) tcSetInverseMappingProp {
    self.setDefaultValueForMissingAttributes = YES;
    self.setNilForMissingRelationships = YES;
}

+(TCRKObjectMapping *)tcInverseMapping:(RKObjectMapping *)mapping
{
    TCRKObjectMapping * result = [TCRKObjectMapping mappingForClass:[NSMutableDictionary class]];
    // [result tcCopyPropertiesFromMapping:mapping];
    [result tcSetInverseMappingProp];
    for (RKAttributeMapping *attributeMapping in mapping.attributeMappings) {
        [result addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:attributeMapping.destinationKeyPath toKeyPath:attributeMapping.sourceKeyPath]];
    }
    for (RKRelationshipMapping *relationshipMapping in mapping.relationshipMappings) {
        RKObjectMapping *tmp = (RKObjectMapping *) relationshipMapping.mapping;
        if (! [tmp isKindOfClass:[RKObjectMapping class]]) {
            RKLogWarning(@"Unable to generate inverse mapping for relationship '%@': %@ relationships cannot be inversed.", relationshipMapping.sourceKeyPath, NSStringFromClass([tmp class]));
            continue;
        }
        TCRKObjectMapping *inverseRelationshipMapping = [TCRKObjectMapping tcInverseMapping:tmp];
        if (inverseRelationshipMapping) [result addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:relationshipMapping.destinationKeyPath toKeyPath:relationshipMapping.sourceKeyPath withMapping:inverseRelationshipMapping]];
    }
    return result;
}

@end
