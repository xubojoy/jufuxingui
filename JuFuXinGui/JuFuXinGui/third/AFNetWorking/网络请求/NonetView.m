//
//  NonetView.m
//  FootballReservation
//
//  Created by 王园园 on 14-10-24.
//  Copyright (c) 2014年 gx. All rights reserved.
//

#import "NonetView.h"
static NonetView *_netview = nil;
@implementation NonetView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

    }
    return self;
}

+(NonetView *)shareNetView;
{
    if(!_netview){
        _netview = [[NonetView alloc]init];
        _netview.frame = CGRectMake( 0, 64,screen_width, [UIScreen mainScreen].bounds.size.height-64);
        [_netview setlayOut];
    }
    return _netview;
}

-(void)setlayOut
{
    
    self.backgroundColor = [UIColor whiteColor];
    float y = [UIScreen mainScreen].bounds.size.height/2-140;
    UIImageView *netImg = [[UIImageView alloc]initWithFrame:CGRectMake(screen_width/2-60, y, 120, 120)];
    netImg.image = [UIImage imageNamed:@"断网"];
    [self addSubview:netImg];
    
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(screen_width/2-100, VIEW_MAXY(netImg)+15, 200, 27)];
    lable1.backgroundColor = [UIColor clearColor];
    lable1.textColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.8];
    lable1.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:17.0f];
    lable1.text = @"网络不给力";
    lable1.textAlignment = NSTextAlignmentCenter;
    [self addSubview:lable1];
    
    UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(screen_width/2-100, VIEW_MAXY(lable1), 200, 27)];
    lable2.textColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.8];
    lable2.backgroundColor = [UIColor clearColor];
    lable2.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0f];
    lable2.text = @"点击屏幕重新加载";
    lable2.textAlignment = NSTextAlignmentCenter;
    [self addSubview:lable2];
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)];
    [self addGestureRecognizer:tap];
}



-(void)tapView:(UIGestureRecognizer *)gesture
{
    [MBHUDView dismissCurrentHUD];//消失
    [self.delegate performSelector:@selector(NetViewReloadData)];
}




@end
