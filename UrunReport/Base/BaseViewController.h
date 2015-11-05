//
//  BaseViewController.h
//  YRNewsReport
//
//  Created by urun2 on 15/11/4.
//  Copyright © 2015年 urun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"


#define StatusBarHeight 20 //状态栏高度固定为20
#define NavHeight 44 //自定义导航栏高度 默认为44

@interface BaseViewController : UIViewController<UIGestureRecognizerDelegate>
{
    MBProgressHUD *hud;
}

/**
 *  内容区域的frame
 */
@property(nonatomic, readonly) CGRect mainContentViewFrame;

/**
 *  自定义的导航栏View
 */
@property(nonatomic, strong) UIImageView *customNav;

/**
 *  自定义的导航栏返回按钮
 */
@property(nonatomic, strong) UIButton *leftButton;

/**
 *  导航栏搜索输入框
 */
@property(nonatomic, strong) UITextField *SearchTextField;

@property(nonatomic, strong) UIView *searchView;

@property(nonatomic, strong) UIButton * searchBnt;

/**
 *  全屏提示框 只显示文字
 *
 *  @param text  提示内容
 *  @param delay 显示时间
 *  @param aView 提示框super view
 */
- (void)hudShowTextOnly:(NSString *)text delay:(int)delay view:(UIView *)aView;

/**
 *  全屏提示框 显示login框和文本
 *
 *  @param text  提示内容
 *  @param delay 显示时间
 *  @param aView 提示框super view
 */
- (void)hudShowWithLabelText:(NSString *)text view:(UIView *)aView;

- (void)hideHudDidSuccess:(NSString *)text;

- (void)hideHudDidFail:(NSString *)text;

/**
 *  隐藏loading框
 */
- (void)hideHud;
@end
