//
//  YRMainView.h
//  YRNewsReport
//
//  Created by urun on 15/10/28.
//  Copyright © 2015年 urun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^setIconBlock)(id sender);

@interface MainContenView : UIView

@property (nonatomic,copy) setIconBlock iconBlock;

-(void)addBlock:(setIconBlock)block;

@end
