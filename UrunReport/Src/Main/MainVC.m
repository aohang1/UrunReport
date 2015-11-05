//
//  MainVC.m
//  YRNewsReport
//
//  Created by urun2 on 15/11/4.
//  Copyright © 2015年 urun. All rights reserved.
//

#import "MainVC.h"
#import "MainContenView.h"
#import "UIViewController+MMDrawerController.h"


@implementation MainVC
@synthesize naviClassesByButtonTag;

-(UIView *)mainContentView
{
    mainView = [[UIView alloc]initWithFrame:self.mainContentViewFrame];
    mainView.backgroundColor = [UIColor whiteColor];
    
    naviClassesByButtonTag = @[@"我的收藏",@"本日报告",@"本周报告",
                               @"本月报告",@"快报",@"专报",@"早报",
                               @"晚报",@"周报",@"月报",@"季报",@"年报"
                               ];
    [self addItemView];
    return mainView;
}

//隐藏默认的回退按钮，则显示个人信息按钮
- (BOOL)showBackButton
{
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)addItemView
{
    MainContenView *mainContenView = [[MainContenView alloc]initWithFrame:CGRectMake(0, 0, mainView.width, mainView.height)];
    
//    [mainView addBlock:^(id sender) {
//        //        UIButton *btn = (UIButton *)sender;
//        YRClassesTableViewController *storeVC = [[YRClassesTableViewController alloc]init];
//        //        storeVC.title = _naviClassesByButtonTag[btn.tag];
//        [self.navigationController pushViewController:storeVC animated:YES];
//    }];
    [mainView addSubview:mainContenView];
}

#pragma mark 导航栏按钮
- (void)onLeftButtonClick
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)searchButtonClick
{
    NSLog(@"%@" ,self.SearchTextField.text);
    
}
@end
