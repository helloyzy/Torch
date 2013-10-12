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

@interface TCSurveyListController ()

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
    
    _titles = @[@"Encuesta de Marketing", @"Encuesta de Segmentación"];
    
    table = [MGTableBox boxWithSize:self.view.size];
    table.height = 200;
    
    [table.topLines addObject:[self sectionHeader:@"Almacene nombre aquí" backgroundColor:[UIColor clearColor] underlineColor:[UIColor blackColor] fontName:@"HelveticaNeueLTCom-Md"]];
    [table.topLines addObject:[self sectionHeader:@"Encuestas" backgroundColor:[UIColor clearColor] underlineColor:[UIColor blackColor] fontName:@"HelveticaNeueLTCom-Md"]];
    [table layout];
    
    [self.view addSubview:table];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {	
    UITableViewCell *cell;
        static NSString *storeHomeSec3Identifier = @"storeHomeSection3";
        cell = [tableView dequeueReusableCellWithIdentifier:storeHomeSec3Identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:storeHomeSec3Identifier];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
        }
    cell.textLabel.text = _titles[indexPath.row];
        //cell.textLabel.text = [[self.menuList objectAtIndex:indexPath.row] objectForKey:kTitleKey];
            cell.textLabel.textColor = [UIColor colorWithRed:0.239 green:0.435 blue:0.6 alpha:1];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TCSurveyController *survey =
    [[TCSurveyController alloc] init];
    survey.questions = /*[Survey allForPredicate:[NSPredicate predicateWithFormat:@"NOT(questionType = nil)"]];*/
    indexPath.row == 0 ? [Survey marketingSurveyQuestions:self.store] : [Survey segmentationSurveyQuestions:self.store];
    survey.index = 0;
    survey.subtitle = _titles[indexPath.row];
    [self.navigationController pushViewController:survey animated:YES];
}

@end
