//
//  NonetView.h
//  FootballReservation
//
//  Created by 王园园 on 14-10-24.
//  Copyright (c) 2014年 gx. All rights reserved.
//
/*
 [MBHUDView hudWithBody:@"加载成功" type:MBAlertViewHUDTypeCheckmark hidesAfter:1.0 show:YES]; 对号
 [MBHUDView hudWithBody:@"加载中" type:MBAlertViewHUDTypeActivityIndicator hidesAfter:4.0 show:YES]; 转圈
 [MBHUDView hudWithBody:@"加载失败" type:MBAlertViewHUDTypeExclamationMark hidesAfter:1.5 show:YES]; 叹号
 [MBHUDView hudWithBody:@"Ready?" type:MBAlertViewHUDTypeDefault hidesAfter:2.0 show:YES]; 只有文字
 [MBHUDView hudWithBody:@"Hello" type:MBAlertViewHUDTypeCheckmark hidesAfter:1.0 show:YES];
 [MBHUDView dismissCurrentHUD];//消失
 */

#import <UIKit/UIKit.h>


@protocol NetViewDelegate <NSObject>

-(void)NetViewReloadData;

@end


@interface NonetView : UIView

+(NonetView *)shareNetView;


@property (nonatomic,retain) id<NetViewDelegate> delegate;

@end
