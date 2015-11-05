//
//  YRClassesTableViewController.m
//  YRNewsReport
//
//  Created by urun on 15/10/29.
//  Copyright © 2015年 urun. All rights reserved.
//

#define kScrollViewHight 40

#import "ClassesTableViewController.h"
#import "LeftBarView.h"
#import "YRCommon.h"
#import "YRTitleScrollView.h"
#import "YRTitleTableViewController.h"



@interface YRClassesTableViewController ()
{
    YRTitleScrollView *_titleScrollView;
    YRTitleTableViewController *_listTableVC;
}

@end

@implementation YRClassesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    _ScrollSelectIndex = 0;
    _listSelectIndex = 0;
    [self setNaviLeftBarItem:@"navigationbar_back"];
    [self addSubItem];
}

- (void)addSubItem
{
    //滚动标题
    _titleScrollView = [[YRTitleScrollView alloc]init];
    _titleScrollView.frame = CGRectMake(0, 64, YRAppWidth, kScrollViewHight);
    __unsafe_unretained YRClassesTableViewController *subSelf = self;
    _titleScrollView.titleChangBlock = ^(NSInteger index){
        NSLog(@"titleChangBlock%ld",index);
        subSelf.ScrollSelectIndex = index;
    };
    _titleScrollView.titleNames = [NSMutableArray
                                   arrayWithObjects:@"我的收藏",@"本日报告",@"本周报告",
                                                    @"本月报告",@"快报",@"专报",@"早报",
                                                    @"晚报",@"周报",@"月报",@"季报",@"年报", nil];
    [self.view addSubview:_titleScrollView];
    
    //标题列表
    _listTableVC = [[YRTitleTableViewController alloc]initWithStyle:UITableViewStylePlain];
    _listTableVC.swipeGestureBlock = ^(BOOL direct){
        if (direct == NO && _listSelectIndex < _titleScrollView.titleNames.count - 1)
        {
            NSInteger listIndex = subSelf.listSelectIndex + 1;
            subSelf.listSelectIndex = listIndex;
            NSLog(@"listChang++%ld",subSelf.listSelectIndex);
        }
        else if (direct == YES && _listSelectIndex > 0)
        {
            subSelf.listSelectIndex = _listSelectIndex - 1;
            NSLog(@"listChang--%ld",subSelf.listSelectIndex);
        }
        
    };
    CGFloat listTableY = (kScrollViewHight + 64);
    _listTableVC.view.frame = CGRectMake(0, listTableY, YRAppWidth, YRAppHeight-listTableY);
    [self.view addSubview:_listTableVC.view];
    [self addChildViewController:_listTableVC];
}

- (void)setScrollSelectIndex:(NSInteger)ScrollSelectIndex
{
    _ScrollSelectIndex = ScrollSelectIndex;
    _listSelectIndex = ScrollSelectIndex;
}

- (void)setListSelectIndex:(NSInteger)listSelectIndex
{
    _listSelectIndex = listSelectIndex;
    _ScrollSelectIndex = listSelectIndex;
    [_titleScrollView setSelectTitle:listSelectIndex];
}


- (void)setNaviLeftBarItem:(NSString *)leftImageName
{
    __unsafe_unretained id selfNavi = self.navigationController;
    
    YRLeftBarView *leftBarView = [[YRLeftBarView alloc]initWithFrame:CGRectMake(0, 0, 220, 40) imageName:leftImageName];
    leftBarView.buttonClick = ^{
        [selfNavi popViewControllerAnimated:YES];
    };
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBarView];
    self.navigationItem.leftBarButtonItem = leftItem;
}

@end
