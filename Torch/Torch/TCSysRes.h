//
//  TCSysRes.h
//  Torch
//
//  Created by Whitman Yang on 8/29/13.
//  Copyright (c) 2013 Hershey. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TC_TblVw_SectHeader_Height 42

// font HelveticaNeueLTCom-Bd
UIFont * TCFont_HNLTComBd(CGFloat size);
// font HelveticaNeueLTCom-Md
UIFont * TCFont_HNLTComMd(CGFloat size);
// font HelveticaNeueLTCom-Lt
UIFont * TCFont_HNLTComLt(CGFloat size);

UIColor * TCColor_DarkBlue();

// extend the label with the Title style
UILabel * TCLbl_Title_Ext(UILabel * lbl);

// table view section header
UIView * TCVw_TblVw_SectHeader(NSString * titleKey);

// table view cell - subtitle style
UITableViewCell * TCTblVwCell_SubtitleStyle(UITableView * tblVw, NSString * reuseIdentifier);