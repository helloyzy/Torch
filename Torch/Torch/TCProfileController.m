//
//  TCProfileController.m
//  SingleView
//
//  Created by Whitman Yang on 8/26/13.
//  Copyright (c) 2013 Whitman Yang. All rights reserved.
//

#import "TCProfileController.h"
#import "YIInnerShadowView.h"
#import "GraphicsUtils.h"
#import "IIViewDeckController.h"

@interface TCProfileController ()

@end

@implementation TCProfileController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    vwLeftShadow.bounds = CGRectMake(0, 0, 3, self.view.bounds.size.height);
    vwLeftShadow.bounds = CGRectMake(0, 0, 15, self.view.bounds.size.height);
    vwLeftShadow.backgroundColor = [UIColor clearColor];
    vwLeftShadow.shadowMask = YIInnerShadowMaskLeft;
    vwLeftShadow.shadowColor = [UIColor darkGrayColor];
    vwLeftShadow.shadowRadius = 10;
    
    UITapGestureRecognizer * clickRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toMyDay)];
    [clickRecognizer setNumberOfTapsRequired:1];
    [clickRecognizer setNumberOfTouchesRequired:1];
    clickRecognizer.cancelsTouchesInView = NO;
    [imgVwMyDay setUserInteractionEnabled:YES];
    [imgVwMyDay addGestureRecognizer:clickRecognizer];
}

- (void)toMyDay {
    IIViewDeckController * deckCtl = self.viewDeckController;
    if (deckCtl) {
        [deckCtl toggleRightViewAnimated:YES];
        UINavigationController *navController = (UINavigationController *)deckCtl.centerController;
        if (navController) {
            [navController popToRootViewControllerAnimated:YES];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
