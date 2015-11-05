//
//  LeftCellOther.h
//  UrunReport
//
//  Created by urun2 on 15/11/4.
//  Copyright © 2015年 urun3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftCell : UITableViewCell
@property (retain, nonatomic) UILabel *cellTitle;
@property (retain, nonatomic) UIImageView *cellImg;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame;

@end
