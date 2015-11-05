//
//  LeftCellOther.m
//  UrunReport
//
//  Created by urun2 on 15/11/4.
//  Copyright © 2015年 urun3. All rights reserved.
//

#import "LeftCell.h"

@implementation LeftCell
@synthesize cellTitle, cellImg;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        cellTitle = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 80, frame.size.height)];
        cellTitle.font = ContentFont;
        cellTitle.textAlignment =NSTextAlignmentLeft;
        //menuTitle.center = CGPointMake(85, HEIGHT(self.contentView)/2);
        [self.contentView addSubview:cellTitle];
        
        cellImg= [[UIImageView alloc] initWithFrame:CGRectMake(cellTitle.x +cellTitle.width, (cellTitle.y + cellTitle.height - 18)/2, 18, 18)];
        [cellImg setImage:[UIImage imageNamed:@"icon_Left_hongd" ]];
        cellImg.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:cellImg];
    }
    return self;
}


@end
