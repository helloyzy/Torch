//
//  TCSurveyListController.m
//  Torch
//
//  Created by Yuan Mai on 10/12/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCSurveyListController.h"
#import "TCSurveyController.h"
#import "Survey.h"
#import <InnerBand/InnerBand.h>
#import "UIViewController+MGBox.h"
#import <MGTableBox.h>
#import "TCSysRes.h"

@interface TCSurveyListController () {
    NSInteger _availableSurveyType;
}

@property (nonatomic, strong) MGTableBox* table;

@end

@implementation TCSurveyListController

@synthesize table;

NSArray* _titles;

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
    
    _titles = @[[self localString:@"survey.marketing.title"],[self localString:@"survey.segmentation.title"]];
    
    _availableSurveyType = 0;
    if ([Survey marketingSurveyQuestions:self.store].count > 0) {
        _availableSurveyType ++;
    }
    if ([Survey segmentationSurveyQuestions:self.store].count > 0) {
        _availableSurveyType ++;
    }
    
    CGRect frame = CGRectMake(0, 8, self.view.size.width, 200);
    table = [[MGTableBox alloc] initWithFrame:frame];
        
    [table.topLines addObject:[self sectionHeader:self.store.name backgroundColor:[UIColor clearColor] underlineColor:[UIColor blackColor] font:TCFont_HNLTComBd(17)]];
    NSString *sectionHeader = [self localString:@"survey.list.title"];
    if (_availableSurveyType == 0) {
        sectionHeader = [self localString:@"survey.list.noSurvey"];
    }
    [table.topLines addObject:[self sectionHeader:sectionHeader backgroundColor:[UIColor clearColor] underlineColor:[UIColor blackColor] font:TCFont_HNLTComBd(17)]];
    [table layout];
    
    [self.view addSubview:table];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return _availableSurveyType > 0 ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _availableSurveyType;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {	
    UITableViewCell *cell;
    static NSString *surveyCellIdentifier = @"surveyCellIdentifier";
    cell = [tableView dequeueReusableCellWithIdentifier:surveyCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:surveyCellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    cell.textLabel.text = _titles[indexPath.row];
    cell.textLabel.font = TCFont_HNLTComMd(17);
    cell.textLabel.textColor = [UIColor colorWithRed:0.239 green:0.435 blue:0.6 alpha:1];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TCSurveyController *survey = [[TCSurveyController alloc] init];
    survey.questions = indexPath.row == 0 ? [Survey marketingSurveyQuestions:self.store] : [Survey segmentationSurveyQuestions:self.store];
    survey.index = 0;
    survey.subtitle = _titles[indexPath.row];
    survey.storeHomeView = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 2];
    [self.navigationController pushViewController:survey animated:YES];
}

@end
