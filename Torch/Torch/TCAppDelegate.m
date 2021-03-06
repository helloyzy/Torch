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
#import "TCDataStatusController.h"

#import "TCDBUtils.h"
#import "TCSvcUtils.h"
#import "IBFunctions.h"
#import "DateUtils.h"
#import "TCUtils.h"
#import "TCSysRes.h"

#import "Store.h"
#import "StoreCall.h"

#import "OrderCredit.h"
#import "SurveyResponse.h"
#import <NSManagedObject+InnerBand.h>

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
    // [TCDBUtils prepareMockData];
}

- (void) serviceTest {
    // [TCSvcUtils syncDataService];
    // OrderCredit *order = [[OrderCredit all]objectAtIndex:0];
    // [TCSvcUtils orderRequestService:order];
    NSArray *surveys = [SurveyResponse surveyResponsesToSend];
    [TCSvcUtils surveyPostService:surveys];
}

- (void)setStoreInCallInNecessary {
    setStoreInCall([StoreCall callInProgress]);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // NSLog(@"Documents dir %@", IB_DOCUMENTS_DIR());
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    // self.viewController = [[TCViewController alloc] initWithNibName:@"TCViewController" bundle:nil];
    // self.viewController = [self newDeckController];
    // self.viewController = [[TCDisclaimerVwCtl alloc] init];
    // self.viewController = [[TCStoreHomeView alloc] init];
    // self.viewController = [self rootDeckCtrl];
    // self.viewController = [[TCPrinterCtl alloc] init];
#ifdef TC_DEBUG
    [self initDB];
    // [self serviceTest];
    self.viewController = [self loginController];
    // self.viewController = [self controllerWithinNavCtr];
#else
    if ([self isLoginRequired]) {
        self.viewController = [self loginController];
    } else {
        [TCDBUtils initDB];
        [self setStoreInCallInNecessary];
        self.viewController = [UIViewController myDayDeckAsRoot];
    }
    // self.viewController = [self isLoginRequired] ? [self loginController] : [UIViewController myDayDeckAsRoot];
#endif
    
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

@end
