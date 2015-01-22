//
//  MyAlert.h
//  TextAlertView
//
//  Created by mac on 14-11-16.
//  Copyright (c) 2014年 han. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
   not_cancel_button=3030,
    Cancel_button=3040
    
}AlertButtonTag;

@protocol MyAlertViewDelegate;



@interface MyAlert : UIView
{
    NSString * _labelTitle;
    NSString * _buttonTitle;
    NSString *  _otherButtonTitle;
    UIView *    _view;
    int     _alerttag;
}
/*
 默认的是3
 1 代表   AlertLabelNSTextAlignmentRight
 2 代表   AlertLabelNSTextAlignmentLeft
 3和大于3的 代表AlertLabelNSTextAlignmentCenter
 */
@property (nonatomic,assign)int textAlignment;//label文字的对齐方式

@property(nonatomic,assign)id<MyAlertViewDelegate>delegate;
/*
  myAlertHeight 高度
  missTime      消失时间
 labelHeight    label的高度
 */
@property(nonatomic,assign)int myAlertHeight;
@property(nonatomic,assign)int missTime;
@property(nonatomic,assign)float labelHeight;
@property(nonatomic,assign)int atag;
@property(nonatomic,strong)UILabel* titleLabel;
/*
   初始化方法
 */
-(id)initMyAlertWithTitle:(NSString *)Title delegate:(id)delegate cancelButtonTitle:(NSString *)cancelTitle otherButtonTitle:(NSString *)otherButtonTitle;
-(id)initMyAlertWithTitle:(NSString *)Title delegate:(id)delegate cancelButtonTitle:(NSString *)cancelTitle otherButtonTitle:(NSString *)otherButtonTitle alertTag:(int)tag;

//显示的方法
-(void)show;
-(void)clearAlertView;

@end
@protocol MyAlertViewDelegate<NSObject>

@optional
-(void)doSomething:(UIButton *)sender;
-(void)doSomethingWith:(MyAlert *)alert btn:(UIButton *)sender;
@end