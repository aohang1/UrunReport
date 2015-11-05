//
//  SystemConfig.h
//  YRNewsReport
//
//  Created by urun2 on 15/11/4.
//  Copyright © 2015年 urun. All rights reserved.
//

#ifndef SystemConfig_h
#define SystemConfig_h

#define ScreenWith [UIScreen mainScreen].bounds.size.width  //屏幕宽度
#define Screenheight [UIScreen mainScreen].bounds.size.height  //屏幕高度

#define RGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBColorAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define SystemFont_10 [UIFont systemFontOfSize:10]
#define SystemFont_12 [UIFont systemFontOfSize:12]
#define SystemFont_13 [UIFont systemFontOfSize:13]
#define SystemFont_14 [UIFont systemFontOfSize:14]
#define SystemFont_16 [UIFont systemFontOfSize:16]
#define SystemFont_18 [UIFont systemFontOfSize:18]
#define SystemFont_20 [UIFont systemFontOfSize:20]
#define BoldSystemFont_12 [UIFont boldSystemFontOfSize:12]
#define BoldSystemFont_14 [UIFont boldSystemFontOfSize:14]
#define BoldSystemFont_16 [UIFont boldSystemFontOfSize:16]

#define ContentFont [UIFont systemFontOfSize:16]  //内容字体
#define NavTitleFont [UIFont boldSystemFontOfSize:18] //导航栏标题字体
#define kArticleTitleFont [UIFont boldSystemFontOfSize:16] //文章标题字体
#endif /* SystemConfig_h */


#ifdef DEBUG
/*
 　1) __VA_ARGS__ 是一个可变参数的宏，很少人知道这个宏，这个可变参数的宏是新的C99规范中新增的，目前似乎只有gcc支持（VC6.0的编译器不支持）。宏前面加上##的作用在于，当可变参数的个数为0时，这里的##起到把前面多余的","去掉的作用,否则会编译出错, 你可以试试。
 　　2) __FILE__ 宏在预编译时会替换成当前的源文件名
 　　3) __LINE__宏在预编译时会替换成当前的行号
 　　4) __FUNCTION__宏在预编译时会替换成当前的函数名称
 */
//# define DLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);

#define DLog(fmt, ...) NSLog((@"[行号:%d] " fmt),__LINE__,##__VA_ARGS__);
//#	define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#	define pwd printf("%s %d\n", __PRETTY_FUNCTION__, __LINE__);
#define debug_object( arg ) debug( @"Object: %@", arg );
#define debug_int( arg ) debug( @"integer: %i", arg );
#define debug_float( arg ) NSLog( @"float: %f", arg );
#define debug_rect(arg) NSLog( @"CGRect ( %f, %f, %f, %f)", arg.origin.x, arg.origin.y, arg.size.width, arg.size.height );
#define debug_point( arg ) debug( @"CGPoint ( %f, %f )", arg.x, arg.y );
#define debug_bool( arg )   debug( @"Boolean: %@", ( arg == YES ? @"YES" : @"NO" ) );
#else
#	define DLog(...)
#endif
