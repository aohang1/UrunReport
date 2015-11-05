//
//  NSString+Expand.m
//  YRNewsReport
//
//  Created by urun2 on 15/11/4.
//  Copyright © 2015年 urun. All rights reserved.
//

#import "NSString+Expand.h"

@implementation NSString (Expand)

//判断字符串是否为空
+ (BOOL)isEmptyString:(NSString *)string
{
    if(!string || [string isKindOfClass:[NSNull class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || string.length == 0)
    {
        return YES;
    }
    return NO;
}
@end
