//
//  LeftVC.h
//  UrunNews
//
//  Created by URUN42 on 15-3-31.
//  Copyright (c) 2015年 URUN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "BaseViewController.h"

@interface LeftVC : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *m_menuTable;
    NSArray *m_menuTitle;
    NSArray *m_menuImg;
    UIView *topView;
    UIButton *m_hardImgBnt;
    UIView *billView;
    UILabel *nameLab;
    UILabel *loginTimeLab;
    MBProgressHUD *hud;
    UIView *lineView1;
    NSUserDefaults *userDefaults;
    AppDelegate *app;

}
@end
