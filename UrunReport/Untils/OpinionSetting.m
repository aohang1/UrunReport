//
//  OpinionSetting.m
//  UrunReport
//
//  Created by urun2 on 15/11/5.
//  Copyright © 2015年 urun3. All rights reserved.
//

#import "OpinionSetting.h"

@implementation OpinionSetting

+ (void)setViewLayer:(UIView *)view radius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)color
{
    CALayer *layer = [view layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:radius];
    [layer setBorderWidth:width];
    [layer setBorderColor:[color CGColor]];
}


@end
