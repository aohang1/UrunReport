//
//  AppDelegate.m
//  UrunReport
//
//  Created by urun2 on 15/11/4.
//  Copyright © 2015年 urun3. All rights reserved.
//

#import "AppDelegate.h"
#import "MainVC.h"
#import "LeftVC.h"
#import "MMDrawerVisualState.h"



@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize drawerController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    LeftVC *leftVC=[[LeftVC alloc]init];
    MainVC *mainVC = [[MainVC alloc]init];
    UINavigationController *mainNav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    
    drawerController = [[MMDrawerController alloc]
                        initWithCenterViewController:mainNav
                        leftDrawerViewController:leftVC
                        rightDrawerViewController:nil];
    [drawerController setMaximumLeftDrawerWidth:ScreenWith - ScreenWith*40/100];
    [drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    [drawerController setDrawerVisualStateBlock:^(MMDrawerController *aDrawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
        MMDrawerControllerDrawerVisualStateBlock block;
        block = [MMDrawerVisualState slideAndScaleVisualStateBlock];
        block(aDrawerController, drawerSide, percentVisible);
    }];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:drawerController];
    [nav setNavigationBarHidden:YES];
    [self.window setRootViewController:nav];
    
    [self.window makeKeyAndVisible];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}

- (void)applicationWillTerminate:(UIApplication *)application {
   
}

@end
