//
//  AppDelegate.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-17.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "AppDelegate.h"
#import "ShareSDKProcessor.h"
#import "AFNetworking.h"
#import "JSHttpRequest.h"
#import "LocalCache.h"
#import "IntroduceViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"First"]) {
        IntroduceViewController * IntroduceVC = [[IntroduceViewController alloc]init];
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
        self.window.rootViewController = IntroduceVC;
    }else
    {
        self.viewController = [[NTViewController alloc]init];
        self.window.rootViewController = self.viewController;
    }
    
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"First"];

    
    
    self.localcache=[LocalCache shareuser];
    self.user=[UserModel shareuser];
    [ShareSDKProcessor initShareSDK];
    [JSHttpRequest listenNetworkChange];
    self.window.backgroundColor = [UIColor whiteColor];

   
    [self.window makeKeyAndVisible];
    return YES;
}
#pragma mark -----链接跳转回调

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                        wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //  NSLog(@"链接调到app啦。。。。。。。openURL:%@" , sourceApplication);
        [ShareSDK handleOpenURL:url
              sourceApplication:sourceApplication
                     annotation:annotation
                     wxDelegate:self];
        return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"applicationWillResignActive");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
//    if (self.user.isLoad==YES) {
//        NSUserDefaults * defaoults=[NSUserDefaults standardUserDefaults];
//        if (defaoults) {
//            self.user.isgesture=[defaoults boolForKey:self.user.userName];
//        }
//        
//        
//    }
   // [self.localcache goout];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    if (self.user.isLoad==YES) {
        if (self.user.isgesture==YES) {
            NSString* pswd = [LLLockPassword loadLockPassword];
            //NSString* pswdd =[LLLockPassword loadLockPasswordwithusername:self.user.userid];
            if (pswd) {
                [self showLLLockViewController:LLLockViewTypeCheck];
            }

        }
        
    }
 
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark - 弹出手势解锁密码输入框
- (void)showLLLockViewController:(LLLockViewType)type
{
    if(self.window.rootViewController.presentingViewController == nil){
        
        LLLog(@"root = %@", self.window.rootViewController.class);
        LLLog(@"lockVc isBeingPresented = %d", [self.lockVc isBeingPresented]);
        
        self.lockVc = [[LLLockViewController alloc] init];
        self.lockVc.nLockViewType = type;
        
        self.lockVc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        [self.window.rootViewController presentViewController:self.lockVc animated:NO completion:^{
        }];
        LLLog(@"创建了一个pop=%@", self.lockVc);
    }
}


@end
