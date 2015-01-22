//
//  IntroduceViewController.m
//  TeachThin
//
//  Created by 巩鑫 on 14-11-27.
//  Copyright (c) 2014年 巩鑫. All rights reserved.
//

#import "IntroduceViewController.h"
#import "RecomIndexViewController.h"
@interface IntroduceViewController ()

@end

@implementation IntroduceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initGuide];
}
-(void)initGuide
{
    UIScrollView* scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screen_width, CGRectGetHeight(self.view.frame))];
    [scrollView setContentSize:CGSizeMake(3*screen_width, 0)];
    [scrollView setPagingEnabled:YES];
    [scrollView setBounces:NO];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    UIImageView *imageview1=[[UIImageView alloc]initWithFrame:CGRectMake(0,0, screen_width, CGRectGetHeight(scrollView.frame))];
    
    [imageview1 setImage:[UIImage imageNamed:@"introduce1"]];
    [scrollView addSubview:imageview1];
    
    UIImageView*imageview2=[[UIImageView alloc]initWithFrame:CGRectMake(screen_width, 0, screen_width, CGRectGetHeight(scrollView.bounds))];
    [imageview2 setImage:[UIImage imageNamed:@"introduce2"]];
    
    [scrollView addSubview:imageview2];
    
    UIImageView*imageview3=[[UIImageView alloc]initWithFrame:CGRectMake(screen_width*2, 0, screen_width, CGRectGetHeight(scrollView.frame))];
    [imageview3 setImage:[UIImage imageNamed:@"introduce3"]];
    
    [scrollView addSubview:imageview3];
    imageview3.userInteractionEnabled=YES;
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake((screen_width-106)/2, CGRectGetHeight(self.view.frame)-85, 106, 35)];
    [button addTarget:self action:@selector(firstpressed) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"start_noaml"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"start_highlight"] forState:UIControlStateHighlighted];
    [imageview3 addSubview:button];
    
    UIPageControl*page=[[UIPageControl alloc]init];
    page.frame=CGRectMake((screen_width-45)/2, CGRectGetHeight(self.view.frame)-40, 45, 30);
    page.pageIndicatorTintColor = HexRGBAlpha(0x4fb4d9, 1);
    page.currentPageIndicatorTintColor = HexRGBAlpha(0xf2fbfb, 1);
    page.numberOfPages=3;
    page.currentPage=0;
    page.tag = 100;
    page.userInteractionEnabled=NO;
    [self.view addSubview:scrollView];
    [self.view addSubview:page];
}
//
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    UIPageControl* page = (UIPageControl*)[self.view viewWithTag:100];
    int current = scrollView.contentOffset.x/screen_width;
    page.currentPage = current;
}

//点击进入体验按钮
-(void)firstpressed
{
    NTViewController * ntvc = [[NTViewController alloc]init];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = ntvc;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
