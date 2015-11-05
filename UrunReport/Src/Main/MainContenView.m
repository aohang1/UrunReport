//
//  YRMainView.m
//  YRNewsReport
//
//  Created by urun on 15/10/28.
//  Copyright © 2015年 urun. All rights reserved.
//

#import "MainContenView.h"
#import "MainButton.h"

@implementation MainContenView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addAllButton];
        self.backgroundColor = RGBColor(238.0, 238.0, 238.0);
    }
    return self;
}

-(void)addAllButton
{
    [self addbtn:@"我的收藏" icon:@"icon_main_collection" index:0];
    [self addbtn:@"本日报告" icon:@"icon_main_todayReport" index:1];
    [self addbtn:@"本周报告" icon:@"icon_main_curWeekReport" index:2];
    [self addbtn:@"本月报告" icon:@"icon_main_curMonthReport" index:3];
    [self addbtn:@"快报" icon:@"icon_main_quickReport" index:4];
    [self addbtn:@"专报" icon:@"icon_main_SpecialReports" index:5];
    [self addbtn:@"早报" icon:@"icon_main_monthReport" index:6];
    [self addbtn:@"晚报" icon:@"icon_main_eveningReport" index:7];
    [self addbtn:@"周报" icon:@"icon_main_weekReport" index:8];
    [self addbtn:@"月报" icon:@"icon_main_monthReport" index:9];
    [self addbtn:@"季报" icon:@"icon_mian_seasonReport" index:10];
    [self addbtn:@"年报" icon:@"icon_main_yearsReport" index:11];
    
}

- (UIButton *)addbtn:(NSString *)title icon:(NSString *)icon index:(int)index
{
    MainButton *btn = [[MainButton alloc] init];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    
    int row = index / 3;
    int column = index % 3;
    
    CGFloat height = self.frame.size.height/4;
    CGFloat width = self.frame.size.width/3;
    
    btn.frame = CGRectMake(width * column , height * row, width - 1, height - 1);
    btn.tag = index;
    
    [btn addTarget:self action:@selector(naviBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];

    return btn;
}

-(void)naviBtnClicked:(UIButton *)sender
{
    if (self.iconBlock) {
        self.iconBlock(sender);
    }
}

-(void)addBlock:(setIconBlock)block
{
    self.iconBlock = block;
}

@end
