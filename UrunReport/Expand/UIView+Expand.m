//
//  UIView+Expand.m
//  UrunReport
//
//  Created by urun2 on 15/11/5.
//  Copyright © 2015年 urun3. All rights reserved.
//

#import "UIView+Expand.h"

@implementation UIView (Expand)
-(CGFloat)x
{
    return self.frame.origin.x;
}

-(void)setX:(CGFloat)x
{
    CGRect f = self.frame;
    f.origin.x = x;
    self.frame = f;
}

-(CGFloat)y
{
    return self.frame.origin.y;
}

-(void)setY:(CGFloat)y
{
    CGRect f = self.frame;
    f.origin.y = y;
    self.frame = f;
}

- (CGFloat)width {
    return self.frame.size.width;
}


- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)height {
    return self.frame.size.height;
}


- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}


- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


- (CGFloat)centerY {
    return self.center.y;
}


- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)offsetX
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setOffsetX:(CGFloat)offsetX
{
    CGRect frame = self.frame;
    frame.origin.x = offsetX - frame.size.width;
    self.frame = frame;
}

- (CGFloat)offsetY
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setOffsetY:(CGFloat)offsetY
{
    CGRect frame = self.frame;
    frame.origin.y = offsetY - frame.size.height;
    self.frame = frame;
}

@end
