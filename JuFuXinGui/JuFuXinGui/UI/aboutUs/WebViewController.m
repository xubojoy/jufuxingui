//
//  WebViewController.m
//  JuFuXinGui
//
//  Created by myStyle on 14-12-25.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "WebViewController.h"
#import "HAN_Constants.h"
#import "LocalCache.h"
@interface WebViewController ()

@end

@implementation WebViewController

-(void)viewWillAppear:(BOOL)animated{
    if (self.local.rjian==nil) {
        [self getadata];
    }
    else{[self initbody];}

    [super viewWillAppear:animated];
    [[NTViewController sharedController] hidesTabBar:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.local=[LocalCache shareuser];
    [self setRightSwipeGesture];
    //[self getadata];
    [self initHeader];
    //[self initbody];
}

#pragma mark - 头部相关
//初始化头部
- (void)initHeader{
    //初始化布局与背景
    if ([self.titleString isEqualToString:@""]||self.titleString==nil) {
        self.titleString=@"关于我们";
    }
    self.header  = [[HeaderView alloc] initWithTitle:self.titleString navigationController:self.navigationController];
    [self.view addSubview:self.header];
}
#pragma mark 
-(void)initbody{
    
    
    if ([self.context isEqualToString:@""]) {
        NSString * path=[[NSBundle mainBundle]pathForResource:self.titleString ofType:@"txt"];
        NSString* content = [NSString stringWithContentsOfFile:path
                                                      encoding:NSUTF8StringEncoding
                                                         error:NULL];
        self.context=content;
    }
    
    if (self.local.rjian==nil) {
        self.local.rjian=self.context;
    }
    UIWebView  * webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, self.header.frame.size.height, screen_width,Screen_height)];
       webview.scrollView.showsHorizontalScrollIndicator=YES;
    [webview loadHTMLString:self.local.rjian baseURL:nil];
    [self.view addSubview:webview];
}
-(void)getadata{
    [MBHUDView hudWithBody:@"正在加载..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:10000 show:YES];
    __weak WebViewController * weeksafa=self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString * string=@"http://www.gmtxw06.com/index.php?m=Article&a=intro_list";
        NSURL * url=[NSURL URLWithString:string];
        NSURLRequest * request=[NSURLRequest requestWithURL:url];
        
        NSURLResponse *response = nil;
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        NSLog(@"时尚大方%@",data);
        NSString * datastring=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"发生大发啊是%@",datastring);
       dispatch_async(dispatch_get_main_queue(), ^{
           [MBHUDView dismissCurrentHUD];
            NSError *error;
            NSDictionary *userInfo = [NSJSONSerialization JSONObjectWithData:[datastring dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
           
            NSDictionary * dic=(NSDictionary *)userInfo;
            if ([[dic objectForKey:@"code"] isEqualToString:@"01"]) {
                NSLog(@"sjdfakljdksf");
            weeksafa.titleString=[dic objectForKey:@"title"];
            weeksafa.context=[dic objectForKey:@"content"];
                [weeksafa initbody];
            }
        });
    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self.local goout];
    // Dispose of any resources that can be recreated.
}
@end
