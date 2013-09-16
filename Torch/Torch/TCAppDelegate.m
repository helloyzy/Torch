//
//  TCAppDelegate.m
//  Torch
//
//  Created by Yuan Mai on 8/19/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCAppDelegate.h"

#import "TCViewController.h"
#import "IIViewDeckController.h"
#import "TCRouteMapViewController.h"
#import "TCMyDayController.h"
#import "TCLoginViewController.h"
#import "TCDisclaimerVwCtl.h"
#import "UIViewController+Torch.h"
#import "TCPriorityViewController.h"
#import "TCStoreHomeView.h"
#import "TCSummaryViewController.h"
#import "TCPromotionVwCtl.h"
#import "TCPromotionDetailVwCtl.h"
#import "TCOrderViewController.h"
#import "TCPrinterCtl.h"
#import "TCSurveyController.h"
#import "TCAddNewCustomerVwCtl.h"
#import "TCOrderHistory.h"
#import "HersheySSOUtils.h"

#import "TCDBUtils.h"
#import "TCSvcUtils.h"
#import "IBFunctions.h"
#import "DateUtils.h"

@implementation TCAppDelegate

- (UIViewController *)newDeckController
{
    UIViewController* left = [[TCRouteMapViewController alloc] initWithNibName:@"TCRouteMapView" bundle:nil];
    TCMyDayController* center = [[TCMyDayController alloc] initWithNibName:@"TCRouteTableView" bundle:nil];

    IIViewDeckController* controller = [[IIViewDeckController alloc] initWithCenterViewController:center leftViewController:left rightViewController:nil];
    return controller;
}

- (UIViewController *)rootDeckCtrl {
    UIViewController * ctl = [[TCStoreHomeView alloc] init];
    return [UIViewController rootDeckView:ctl];
}

- (UIViewController *)controllerWithinNavCtr {
    // UIViewController * viewController = [[TCViewController alloc] init];
   // UIViewController *viewController = [[TCPromotionVwCtl alloc] init];
    // UIViewController * viewController = [[TCStoreHomeView alloc] init];
    UIViewController *viewController = [[TCOrderHistory alloc] init];
    UINavigationController * navCtr = [UIViewController customNavCtr:viewController];
    return navCtr;
}

- (UIViewController *)loginController {
    return [[TCLoginViewController alloc] init];
}

- (BOOL)isLoginRequired {

    return [HersheySSOUtils needsCredentials];
    
}

- (void) initDB {
    [TCDBUtils copySeed];
    [TCDBUtils initDB];
    // [TCDBUtils seed];
}

- (void) login {
    [TCSvcUtils loginService];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initDB];
    // [self login];
    // NSLog(@"Documents dir %@", IB_DOCUMENTS_DIR());
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    // self.viewController = [[TCViewController alloc] initWithNibName:@"TCViewController" bundle:nil];
    // self.viewController = [self newDeckController];
    // self.viewController = [[TCDisclaimerVwCtl alloc] init];
    // self.viewController = [[TCStoreHomeView alloc] init];
    // self.viewController = [self rootDeckCtrl];
    // self.viewController = [self controllerWithinNavCtr];
    // self.viewController = [[TCPrinterCtl alloc] init];
    self.viewController = [self loginController];
    
    // self.viewController = [self isLoginRequired] ? [self loginController] : [UIViewController myDayDeckAsRoot];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    if ([self isLoginRequired]) {
        self.viewController = [self loginController];
        self.window.rootViewController = self.viewController;
        [self.window makeKeyAndVisible];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//- (void)initDB {
    /**
    BOOL hasDB = [[NSFileManager defaultManager] fileExistsAtPath: [IB_DOCUMENTS_DIR() stringByAppendingPathComponent:@"CoreDataStore.sqlite"]];
    NSLog(@"Documents dir %@ has DB %i", IB_DOCUMENTS_DIR(), hasDB);
    
    // NSArray * salesReps = [SalesRep all];
    // NSLog(@"Count of salesRep is %i", [salesReps count]);
    
    //    RKObjectManager * objectManager = [RKObjectManager managerWithBaseURL:IB_URL(@"https://hmuled01.hersheys.com:10040/torch/v1/fetchData")];
    //    objectManager.managedObjectStore = [RKManagedObjectStore o:@"CoreDataStore.sqlite"];
    
    NSManagedObjectModel * managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    RKManagedObjectStore * managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    [RKManagedObjectStore setDefaultStore:managedObjectStore];
    NSError * error = nil;
    BOOL success = RKEnsureDirectoryExistsAtPath(RKApplicationDataDirectory(), &error);
    if (!success) {
        RKLogError(@"Failed to create Application Data Directory at path '%@' : %@", RKApplicationDataDirectory(), error);
    }
    
    NSString * path = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"CoreDataStore.sqlite"];
    NSPersistentStore * persistentStore = [managedObjectStore addSQLitePersistentStoreAtPath:path fromSeedDatabaseAtPath:nil withConfiguration:nil options:nil error:&error];
    if (!persistentStore) {
        RKLogError(@"Failed adding persistent store at path '%@' : %@", path, error);
    }
    [managedObjectStore createManagedObjectContexts];
    
    RKEntityMapping * salesRepMapping = [SalesRep objectMapping]; // [RKEntityMapping mappingForEntityForName:@"SalesRep" inManagedObjectStore:managedObjectStore];
    
    NSIndexSet * statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);
    RKResponseDescriptor * responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:salesRepMapping method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:statusCodes];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:IB_URL(@"https://hmuled01.hersheys.com:10040/torch/v1/fetchData")];
    // NSMutableURLRequest * request = [NSURLRequest requestWithURL:IB_URL(@"https://hmuled01.hersheys.com:10040/torch/v1/fetchData")];
    RKManagedObjectRequestOperation * operation = [[RKManagedObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
    [operation.HTTPRequestOperation setWillSendRequestForAuthenticationChallengeBlock:^(NSURLConnection * conn, NSURLAuthenticationChallenge * challenge) {
        NSLog(@"Receive challenge");
        if ([challenge previousFailureCount] == 0) {
            NSURLCredential * newCred = [NSURLCredential credentialWithUser:@"HCTMM300" password:@"Welcome1" persistence:NSURLCredentialPersistenceForSession];
            [[challenge sender] useCredential:newCred forAuthenticationChallenge:challenge];
        } else {
            [[challenge sender] cancelAuthenticationChallenge:challenge];
        }
    }];
    
    operation.managedObjectContext = managedObjectStore.mainQueueManagedObjectContext;
    operation.managedObjectCache = managedObjectStore.managedObjectCache;
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation * operation, RKMappingResult * result) {
        SalesRep * salesRep = [result firstObject];
        NSLog(@"SalesRep networkId %@", salesRep.networkId);
    } failure:^(RKObjectRequestOperation * operation, NSError * error) {
        NSLog(@"Failed with error: %@", [error localizedDescription]);
    }];
    NSOperationQueue * operationQueue = [NSOperationQueue new];
    [operationQueue addOperation:operation];
    
//    RKObjectManager * objectManager = [RKObjectManager managerWithBaseURL:IB_URL(@"https://hmuled01.hersheys.com:10040")];
//    objectManager.managedObjectStore = managedObjectStore;
//    [objectManager.HTTPClient setAuthorizationHeaderWithUsername:@"HCTMM300" password:@"Welcome1"];
//    [RKObjectManager setSharedManager:objectManager];
//    [objectManager addResponseDescriptor:responseDescriptor];
//    [objectManager getObjectsAtPath:@"/torch/v1/fetchData" parameters:nil success:nil failure:nil];
     */
    
//}

@end
