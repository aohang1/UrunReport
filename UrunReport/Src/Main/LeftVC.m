
//
//  LeftVC.m
//  UrunNews
//
//  Created by URUN42 on 15-3-31.
//  Copyright (c) 2015年 URUN. All rights reserved.
//

#import "LeftVC.h"
#import "LeftCell.h"
#import "MainVC.h"
#import "UIViewController+MMDrawerController.h"
#import "NSString+Expand.h"
#import <UIKit/UIKit.h>

#define BtnHeight 45

@interface LeftVC ()

@end

@implementation LeftVC

- (void)dealloc
{

}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        userDefaults = [NSUserDefaults standardUserDefaults];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    app = (AppDelegate *)[UIApplication sharedApplication].delegate;

    self.navigationController.navigationBarHidden = YES;
    
    m_menuTitle = [[NSArray alloc] initWithObjects:@"检查更新", nil];
    m_menuImg = [[NSArray alloc] initWithObjects:@"icon_Left_hongd", nil];
    
    self.view.backgroundColor = RGBColor(226.0, 226.0, 226.0);;
    
    topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWith - ScreenWith*40/100, 190)];
    topView.backgroundColor = RGBColor(40.0, 92.0, 136.0);
    [self.view addSubview:topView];
    
    m_hardImgBnt = [[UIButton alloc] initWithFrame:CGRectMake(topView.width/4, (topView.height - BtnHeight)/2, BtnHeight, BtnHeight)];
    [m_hardImgBnt setBackgroundImage:[UIImage imageNamed:@"icon_detail_list"] forState:UIControlStateNormal];
    [m_hardImgBnt addTarget:self action:@selector(toPhoneLogin) forControlEvents:UIControlEventTouchUpInside];
    [OpinionSetting setViewLayer:m_hardImgBnt radius:m_hardImgBnt.height / 2 borderWidth:1 borderColor:[UIColor clearColor]];
    [topView addSubview:m_hardImgBnt];
    
    nameLab = [[UILabel alloc]initWithFrame:CGRectMake(m_hardImgBnt.x+m_hardImgBnt.height + 8,m_hardImgBnt.centerY -18/2, 100, 18)];
    nameLab.text = @"未登录";
    nameLab.font = ContentFont;
    nameLab.textColor =[UIColor whiteColor];
    [topView addSubview:nameLab];
    
    loginTimeLab = [[UILabel alloc]initWithFrame:CGRectMake(0,m_hardImgBnt.y+m_hardImgBnt.height +20,topView.width, 18)];
    loginTimeLab.text = @"登录时间:2015年XX.YY-XX.YY";
    loginTimeLab.font = SystemFont_12;
    loginTimeLab.textAlignment = NSTextAlignmentCenter;
    loginTimeLab.textColor =[UIColor whiteColor];
    [topView addSubview:loginTimeLab];
    
    //分割线
    lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, topView.y+topView.height, topView.width, 1)];
    lineView1.backgroundColor = RGBColor(73.0, 73.0, 73.0);
    lineView1.alpha=0.6;
    [self.view addSubview:lineView1];
    
    //tableview
    m_menuTable = [[UITableView alloc]initWithFrame:CGRectMake(0, lineView1.y+lineView1.height, topView.width, self.view.height-nameLab.x-nameLab.height)];
    m_menuTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    m_menuTable.dataSource = self;
    m_menuTable.delegate = self;
    [m_menuTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
    [self.view addSubview:m_menuTable];
    
    m_menuTable.backgroundColor =  RGBColor(225.0, 225.0,225.0);

    
}


//未登录——————跳转手机登录页面
//已登录——————跳转我的资料页面
-(void)toPhoneLogin
{
   // TODO
}

#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return m_menuTitle.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"cellIdentify";
    LeftCell *cell = (LeftCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentify];
    cell = [[LeftCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify frame:CGRectMake(0, 0,tableView.width, 50)];
    
    UIView *selectedView = [[UIView alloc]init];
    cell.selectedBackgroundView = selectedView;
    
    cell.cellTitle.text = m_menuTitle[indexPath.row];
    [cell.cellImg setImage:[UIImage imageNamed:m_menuImg[indexPath.row]]];
    
    
    selectedView.backgroundColor = RGBColor(238.0, 238.0, 238.0);
    cell.cellTitle.textColor = [UIColor blackColor];
    return cell;
}

#pragma mark - UITableView delegate

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0 )
    {
        [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    }
    else if(indexPath.row == 1)
    {
       
    }
    else if(indexPath.row == 2)
    {//收藏
            }
    else if(indexPath.row == 3)
    {//设置
       
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end






