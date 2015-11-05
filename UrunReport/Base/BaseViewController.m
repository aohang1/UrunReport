//
//  BaseViewController.m
//  YRNewsReport
//
//  Created by urun2 on 15/11/4.
//  Copyright © 2015年 urun. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@end

@implementation BaseViewController
@synthesize mainContentViewFrame;
@synthesize customNav;
@synthesize leftButton;
@synthesize SearchTextField;
@synthesize searchView;
@synthesize searchBnt;

//返回主内容视图，默认值为空，如果继承BaseViewController，一般都需要重写此方法。重写此方法后，则不能重写loadView方法，不然会导致此方法失效。如果不重写此方法，一定要重写loadView方法，这样才能保证视图初始化成功。
- (UIView *)mainContentView
{
    return nil;
}

//初始化主内容视图位置
- (void)initMainContentViewFrame
{
    CGRect rect = [UIScreen mainScreen].bounds;
    mainContentViewFrame = CGRectMake(0, StatusBarHeight+NavHeight, rect.size.width, rect.size.height-StatusBarHeight-NavHeight);
}

/**
 *  自定义导航栏
 */
- (void)showCustomNav
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    CGRect rect = [UIScreen mainScreen].bounds;
    CGRect navRect = CGRectMake(0, 0, rect.size.width , NavHeight+StatusBarHeight);
    customNav = [[UIImageView alloc]initWithFrame:navRect];
    [customNav setBackgroundColor:RGBColor(73.0, 137.0, 193.0)];

    [self.view addSubview:customNav];
    
}

/**
 *  自定义导航栏跳转到个人信息页的按钮
 */
- (void)showCustomNavToInfoButton
{
    if([self showToInfoButton])
    {
        customNav.userInteractionEnabled = YES;
        leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(10, StatusBarHeight, 50, 44); //14*25
        [leftButton setImageEdgeInsets:UIEdgeInsetsMake(10, 11, 10, 25)]; //top, left, bottom, right
        [leftButton setImage:[UIImage imageNamed:@"icon_detail_list"] forState:UIControlStateNormal];
        [leftButton addTarget:self action:@selector(onLeftButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [customNav addSubview:leftButton];
    }
}

/**
 *  自定义导航栏返回按钮
 */
- (void)showCustomNavBackButton
{
    if([self showBackButton])
    {
        customNav.userInteractionEnabled = YES;
        leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(10, StatusBarHeight, 50, 44); //14*25
        [leftButton setImageEdgeInsets:UIEdgeInsetsMake(10, 11, 10, 25)]; //top, left, bottom, right
        [leftButton setImage:[UIImage imageNamed:@"icon_detail_return"] forState:UIControlStateNormal];
        [leftButton addTarget:self action:@selector(onBackButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [customNav addSubview:leftButton];
    }
    else
    {
        [self showCustomNavToInfoButton];
    }
}

/**
 *  自定义导航栏搜索框
 */
- (void)showCustomSearchBox
{
    if([self showSearchBox])
    {
        searchView = [[UIView alloc]initWithFrame:CGRectMake(leftButton.x +leftButton.height + 10, StatusBarHeight +(NavHeight-25)/2, 200, 25)];
        searchView.backgroundColor = [UIColor whiteColor];
        [self.customNav addSubview:searchView];
        
        searchBnt = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, 16, 16)];
        searchBnt.centerY = searchView.height/2;
        [searchBnt addTarget:self action:@selector(searchButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [searchBnt setImage:[UIImage imageNamed:@"icon_main_search"] forState:UIControlStateNormal] ;
        [searchView addSubview:searchBnt];
        
        SearchTextField = [[UITextField alloc]initWithFrame:CGRectMake(36, 0, 170, 25)];
        SearchTextField.centerY = searchView.height/2;
        SearchTextField.placeholder = @"请输入关键字";
        SearchTextField.font = SystemFont_14;
        [searchView addSubview:SearchTextField];
    }
}
/**
 *  默认显示导航栏返回按钮 如果不需要 在子类重写此方法 返回NO即可
 */
- (BOOL)showToInfoButton
{
    return YES;
}

/**
*  默认显示导航栏返回按钮 如果不需要 在子类重写此方法 返回NO即可
*/
- (BOOL)showBackButton
{
    return YES;
}

/**
 *  默认显示导航栏搜索框 如果不需要 在子类重写 返回NO
 */
- (BOOL)showSearchBox
{
    return YES;
}

- (void)onLeftButtonClick
{

}

- (void)searchButtonClick
{
        //todo
}
- (void)onBackButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark- BaseViewController life cycle
- (id)init
{
    if(self = [super init])
    {
        [self initMainContentViewFrame];
    }
    return self;
}

- (void)loadView
{
    UIView *contentView = [self mainContentView];
    NSAssert(contentView!=nil, @"Subclass must implepment mainContentView.");
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view  addSubview:contentView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *rightSwipeGes = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe)];
    rightSwipeGes.direction = UISwipeGestureRecognizerDirectionRight;
    rightSwipeGes.delegate = self;
    [self.view addGestureRecognizer:rightSwipeGes];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self showCustomNav];
    [self showCustomNavBackButton];
    [self showCustomSearchBox];
}

#pragma mark - 滑动手势
//默认返回上一级，如果有不同需求在子类重写
- (void)rightSwipe
{
    [self onBackButtonClick];
}

#pragma mark hud
- (void)hudShowTextOnly:(NSString *)text delay:(int)delay view:(UIView *)aView
{
    hud = [MBProgressHUD showHUDAddedTo:aView animated:YES];
    
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.margin = 10.f;
    //    hud.yOffset = 200; //设置距离视图中心的y坐标
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:delay];
}

- (void)hudShowWithLabelText:(NSString *)text view:(UIView *)aView
{
    hud = [[MBProgressHUD alloc]initWithView:aView];
    [aView addSubview:hud];
    
    hud.detailsLabelText = text;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud show:YES];
}

- (void)hideHudDidSuccess:(NSString *)text
{
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.detailsLabelText = text;
    [hud hide:YES afterDelay:2];
}

- (void)hideHudDidFail:(NSString *)text
{
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x_icon_reqeustFail"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.detailsLabelText = text;
    [hud hide:YES afterDelay:2];
}

- (void)hideHud
{
    [hud hide:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
