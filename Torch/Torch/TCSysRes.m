//
//  TCSysRes.m
//  Torch
//
//  Created by Whitman Yang on 8/29/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import "TCSysRes.h"
#import "Store.h"

static Store *gStoreInCall = nil;

Store *storeInCall() {
    return gStoreInCall;
}

void setStoreInCall(Store *store) {
    gStoreInCall = store;
}


#pragma mark - font

UIFont * TCFont_HNLTComBd(CGFloat size) {
//    return [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:size];
    return [UIFont boldSystemFontOfSize:size];
}

UIFont * TCFont_HNLTComMd(CGFloat size) {
//    return [UIFont fontWithName:@"HelveticaNeueLTCom-Md" size:size];
    return [UIFont systemFontOfSize:size];
}

UIFont * TCFont_HNLTComLt(CGFloat size) {
//    return [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size:size];
    return [UIFont systemFontOfSize:size];
}

#pragma mark - color

UIColor * TCColor_DarkBlue() {
    return [UIColor colorWithRed:0.239 green:0.435 blue:0.6 alpha:1];
}

UIColor * TCColor_DarkBlue_TblVwSectTopSep() {
    return [UIColor colorWithRed:0.188 green:0.376 blue:0.565 alpha:1];
}

UIColor * TCColor_LtBlue_TblVwSectHeaderBg() {
    return [UIColor colorWithRed:0.816 green:0.878 blue:0.91 alpha:1];
}

#pragma mark - label

UILabel * TCLbl_Title_Ext(UILabel * lbl) {
    lbl.textColor = TCColor_DarkBlue();
    lbl.font = TCFont_HNLTComBd(17);
    lbl.backgroundColor = [UIColor clearColor];
    return lbl;
}

/**
 UILabel * TCLbl_Title(CGRect frame) {
 UILabel * result = [[UILabel alloc] initWithFrame:frame];
 result.textColor = [UIColor colorWithRed:0.239 green:0.435 blue:0.6 alpha:1];
 result.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Bd" size:17];
 result.backgroundColor = [UIColor clearColor];
 return result;
 }
 */

#pragma mark - view



UIView * TCVw_TblVw_SectHeader(NSString * titleKey) {
    CGFloat vwWidth = [UIScreen mainScreen].bounds.size.width;
    UIImage * bgImage = [UIImage imageNamed:@"historybg.png"];
    CGFloat vwHeight = TC_TblVw_SectHeader_Height;
    UIView * result = [[UIView alloc] initWithFrame:CGRectMake(0, 0, vwWidth, vwHeight)];
    [result setBackgroundColor:[[UIColor alloc] initWithPatternImage:bgImage]];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, vwWidth, vwHeight - 3)];
    label.text = NSLocalizedString(titleKey, nil);
    label.textColor = TCColor_DarkBlue();
    label.font = TCFont_HNLTComBd(17);
    label.backgroundColor = [UIColor clearColor];
    [result addSubview:label];
    
    UIView * separator_top = [[UIView alloc] initWithFrame:CGRectMake(0, 0, vwWidth, 2)];
    separator_top.backgroundColor = TCColor_DarkBlue_TblVwSectTopSep();
    [result addSubview:separator_top];
    
    UIView * separator_bottom = [[UIView alloc] initWithFrame:CGRectMake(0, vwHeight - 2, vwWidth, 2)];
    separator_bottom.backgroundColor = [UIColor colorWithRed:206/255.0f green:206/255.0f blue:206/255.0f alpha:1];
    [result addSubview:separator_bottom];
    return result;
}

#pragma mark - table view cell

UITableViewCell * TCTblVwCell_SubtitleStyle(UITableView * tblVw, NSString * reuseIdentifier) {
    UITableViewCell *cell = [tblVw dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
        cell.textLabel.font = TCFont_HNLTComBd(17);
        cell.detailTextLabel.font = TCFont_HNLTComLt(12);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1];
    }
	return cell;
}
