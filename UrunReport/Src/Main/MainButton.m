//
//  YRMainButton.m
//  YRNewsReport
//
//  Created by urun on 15/10/28.
//  Copyright © 2015年 urun. All rights reserved.
//

#import "MainButton.h"

#define kImageHeight 50
#define kImageWidth 50

@interface MainButton()

@end

@implementation MainButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addtagView];
    }
    return self;
}

- (void)addtagView
{
    _tagImageView = [[UIImageView alloc]init];
    [self addSubview:_tagImageView];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    self.imageView.frame = CGRectMake((width-kImageWidth)/2, (height-kImageHeight)/2, kImageWidth, kImageHeight);
    
    //new的标记view
    _tagImageView.frame = CGRectMake(width - 40, 20, 24, 17);
    _tagImageView.image = [UIImage imageNamed:@"icon_main_new_s"];
    
    //设置title的属性
    CGRect frame = self.titleLabel.frame;
    frame.origin.x = 0;
    frame.origin.y = height - 35;
    frame.size.width = width;
    self.titleLabel.frame = frame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor blackColor];
    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
}


@end
