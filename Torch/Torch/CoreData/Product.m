#import "Product.h"
#import <RestKit/RestKit.h>


@interface Product ()

// Private interface goes here.

@end


@implementation Product

@synthesize productPrice;

// Custom logic goes here.

- (CGFloat)productPrice {
    return self.priceValue;
}

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Product" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    [mapping addAttributeMappingsFromArray:@[
     ProductAttributes.spanishDescription,
     ProductAttributes.productNumber,
     ProductAttributes.packtypeDescription,
     ProductAttributes.price,
     ProductAttributes.upc,
     ProductAttributes.name
     ]];
    /**
    [mapping addAttributeMappingsFromArray:@[
     ProductAttributes.product_division,
     ProductAttributes.dimension_unit,
     ProductAttributes.weight_unit_of_Measure,
     ProductAttributes.product_code,
     ProductAttributes.packtype_Description,
     ProductAttributes.sales_org,
     ProductAttributes.subpacktype_description,
     ProductAttributes.item_height,
     ProductAttributes.short_material_number,
     ProductAttributes.product_division_description,
     ProductAttributes.version,
     ProductAttributes.overbrand_description,
     ProductAttributes.item_Width,
     ProductAttributes.item_length
     ]];
    NSArray *attrNeedToMapping = @[
                                   ProductAttributes.season_Description,
                                   ProductAttributes.overbrand_Cd,
                                   ProductAttributes.season_Cd,
                                   ProductAttributes.brand_Cd,
                                   ProductAttributes.combined_Packtype_Cd,
                                   ProductAttributes.uPC_GROUP_PRODUCT_UOM_maybe,
                                   ProductAttributes.subPacktype_Cd,
                                   
                                   ProductAttributes.uPC_maybe,
                                   ProductAttributes.item_Status_code,
                                   ProductAttributes.item_Weight,
                                   ProductAttributes.packtype_Cd,
                                   ProductAttributes.combined_Packtype_Description,
                                   ProductAttributes.brand_Description,
                                   ProductAttributes.sAP_Material_Type_FERT,
                                   ProductAttributes.item_Status_Description,
                                   ProductAttributes.product_Number,
                                   ProductAttributes.item_Id
                                   ];
    [mapping addAttributeMappingsFromDictionary:[self _productAttributeMappingFromArray:attrNeedToMapping]];
    [mapping addAttributeMappingsFromDictionary:@{@"Description" : ProductAttributes.desp}];
     */
    return mapping;
}

+ (NSDictionary *)_productAttributeMappingFromArray:(NSArray *)array {
    // just modify the first letter to uppercase
    NSMutableDictionary * result = [[NSMutableDictionary alloc] initWithCapacity:[array count]];
    for (NSString *attr in array) {
        NSString *firstChar = [[attr substringToIndex:1] uppercaseString];
        NSMutableString *temp = [[NSMutableString alloc]initWithString:attr];
        [temp replaceCharactersInRange:NSMakeRange(0, 1) withString:firstChar];
        [result setValue:attr forKey:temp];
    }
    return result;
}

@end
