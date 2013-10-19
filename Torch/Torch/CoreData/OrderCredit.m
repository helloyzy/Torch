#import "OrderCredit.h"
#import <RestKit/RestKit.h>

#import "OrderCreditItem.h"
#import "Account.h"
#import "Contact.h"
#import "Store.h"
#import "StoreCall.h"
#import "SalesRep.h"
#import "SurveyResponse.h"
#import "Note.h"
#import "NoteResponse.h"
#import <IBFunctions.h>
#import <NSManagedObject+InnerBand.h>

#define ORDER_STATUS_INITIAL @"CREATED"
#define ORDER_STATUS_NEW @"NEW"
#define ORDER_STATUS_DELIVERED @"DELIVERED"

@interface OrderCredit ()

// Private interface goes here.

@end


@implementation OrderCredit

+ (RKEntityMapping *)objectMapping
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"OrderCredit" inManagedObjectStore:[RKManagedObjectStore defaultStore]];
//    [mapping addAttributeMappingsFromArray:@[
//     OrderCreditAttributes.approvalRequiredReason,
//     OrderCreditAttributes.paymentMethod,
//     OrderCreditAttributes.callTimeAdjustment,
//     OrderCreditAttributes.plannedEndDate,
//     OrderCreditAttributes.actualEndDate,
//     OrderCreditAttributes.plannedStartDate
//     ]];
    [mapping addAttributeMappingsFromArray:@[OrderCreditAttributes.paymentAmount,
     OrderCreditAttributes.reasonCode,
     OrderCreditAttributes.orderCreditId,
     OrderCreditAttributes.confirmationType,
     OrderCreditAttributes.creditType,
     OrderCreditAttributes.paymentType,
     OrderCreditAttributes.signature,
     OrderCreditAttributes.recordType,
     OrderCreditAttributes.customerReferenceNumber,
     OrderCreditAttributes.hersheyReferenceNumber,
     OrderCreditAttributes.status,
     OrderCreditAttributes.discountPercent,
     OrderCreditAttributes.totalDiscountAmount,
     OrderCreditAttributes.callId,
     OrderCreditAttributes.latitude,
     OrderCreditAttributes.longitude
    ]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"orderCreditItems" toKeyPath:@"orderCreditItems" withMapping:[OrderCreditItem objectMapping]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"contact" toKeyPath:@"contact" withMapping:[Contact objectMappingForOrder]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"account" toKeyPath:@"account" withMapping:[Account objectMapping]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"notes" toKeyPath:@"notes" withMapping:[NoteResponse objectMapping]]];
    // [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"surveyResponse" toKeyPath:@"surveyResponse" withMapping:[SurveyResponse objectMapping]]];
    return mapping;
}

/**
 * Contruct order info from store and call
 * From store: account and contacts
 * From call: call notes and GPS info when starting call
 */
- (void)fillInfoFromCall:(StoreCall *)call{
    // GPS info from call
    self.latitudeValue = call.latitudeValue;
    self.longitudeValue = call.longitudeValue;
    // call notes - only add these added in this app
    for (Note *callNote in call.notes) {
        if ([callNote isNoteNew]) {
            [self addNotesObject:[NoteResponse fromNote:callNote]];
        }
    }
//    // survey responses binding to the call
//    for (SurveyResponse *survey in call.surveyResponses) {
//        [self addSurveyResponseObject:survey];
//    }
    
    // account
    Store *store = call.store;
    Account *account = [Account newInstance];
    if ([store isStoreNew]) {
        account.remoteKey = nil;
    } else {
        account.remoteKey = store.remoteKey;
    }
    account.name = store.name;
    account.phone = store.phone; 
    account.accountRecordType = store.accountRecordType; 
    account.street = store.street;
    account.city = store.city;
    account.state = store.state;
    account.postalcode = store.postalCode;
    account.currency = store.currency;
    account.repId = [SalesRep getRepId];
    account.coachId = [SalesRep getCoachId];
    account.longitude = IB_STRINGIFY_DOUBLE(store.longitudeValue);
    account.latitude = IB_STRINGIFY_DOUBLE(store.latitudeValue);
    account.invoiceValue = store.isSendInvoiceValue;
    self.account = account;
    // contacts, only add the new created or the last one if no new contact is created
    for (Contact *contact in store.contacts) {
        self.contact = contact;
        if ([contact isContactNew]) {
            break;
        }
    }    
}

+ (OrderCredit *)newInstance:(StoreCall *)call {
    OrderCredit *result = [self newInstance];
    result.callId = call.remoteKey;
    result.paymentType = @"Deduction";
    result.recordType = @"MX Orders";
    result.hersheyReferenceNumber = [self generateReferenceNumber];
    result.status = ORDER_STATUS_INITIAL;
    call.associatedOrder = result.hersheyReferenceNumber;
    [result save];
    return result;
}

- (void)completeOrder:(StoreCall *)call {
    self.status = ORDER_STATUS_NEW;
    [self fillInfoFromCall:call];
    [self save];
}

- (void)orderDelivered {
    self.status = ORDER_STATUS_DELIVERED;
    [self save];
}

- (BOOL)isOrderCreated {
    return self.orderCreditItems && self.orderCreditItems.count > 0;
}

+ (OrderCredit *)nextOrderToDeliver {
    NSArray *ordersToDeliver = [self ordersToDeliver];
    return [ordersToDeliver objectAtIndex:0];
}

+ (NSSet *)storeNamesForOrdersToDeliver {
    NSArray *ordersToDeliver = [self ordersToDeliver];
    NSMutableSet *result = [[NSMutableSet alloc]init];
    for (OrderCredit *order in ordersToDeliver) {
        [result addObject:order.account.name];
    }
    return result;
}

+ (NSArray *)ordersToDeliver {
    NSString *predicate = [NSString stringWithFormat:@"%@ = '%@'", OrderCreditAttributes.status, ORDER_STATUS_NEW];
    NSArray *ordersToDeliver = [self allForPredicate:[NSPredicate predicateWithFormat:predicate] inStore:[self dataStore]];
    return ordersToDeliver;
}

#pragma mark - helper methods

/* DATE + REPID + RANDOM 5 DIGITS */
+ (NSString *)generateReferenceNumber {
    NSString *repId = [SalesRep getRepId];
    NSDate *date = [NSDate date];
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"yyyyMMdd"];
    NSString *dateString = [dateformat stringFromDate:date];
    
    int randomNumber = (arc4random()%(99999-1))+1;
    return [NSString stringWithFormat:@"%@%@%d",dateString,repId,randomNumber];
}

@end
