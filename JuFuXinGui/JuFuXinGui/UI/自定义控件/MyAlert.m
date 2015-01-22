//
//  MyAlert.m
//  TextAlertView
//
//  Created by mac on 14-11-16.
//  Copyright (c) 2014年 han. All rights reserved.
//

#import "MyAlert.h"
#import "HAN_Constants.h"
#import "MFrame+UIView.h"
#define BACKGROUNDCOLOR [[UIColor alloc]initWithHue:45/255 saturation:45/255 brightness:45/255 alpha:0.7]
//
#define AlET_TAG 3010 //大view的tag
#define VIEW_TAG 3020 //alert的tag
/*
 
 */
#define OTHER_BUTTON_TAG 3030 //确定按钮的tag
#define CANCEL_BUTTON_TAG 3040 //取消按钮的tag
#define TOW_BUTTON_WIDTH  Screen_weight/2-30 //有两个按钮的宽
#define BUTTON_HEIGHT     40 //按钮的高
#define ONE_BUTTON_WIDTH  Screen_weight/3+10 //一个按钮的宽

@implementation MyAlert

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark 初始化方法

-(id)initMyAlertWithTitle:(NSString *)Title delegate:(id)delegate cancelButtonTitle:(NSString *)cancelTitle otherButtonTitle:(NSString *)otherButtonTitle
{
    if (self=[super init]) {
        self.delegate=delegate;
        _labelTitle=Title;
        _buttonTitle=cancelTitle;
        _otherButtonTitle=otherButtonTitle;
    }
    
    
    _view=[[UIView alloc]initWithFrame:CGRectMake(0,0,self.width,self.height)];
    //_view.backgroundColor=BACKGROUNDCOLOR;
    _view.backgroundColor=[UIColor whiteColor];
    [self addSubview:_view];
    return self;
}
-(id)initMyAlertWithTitle:(NSString *)Title delegate:(id)delegate cancelButtonTitle:(NSString *)cancelTitle otherButtonTitle:(NSString *)otherButtonTitle alertTag:(int)tag
{
    
    if (self=[super init]) {
        self.delegate=delegate;
        _labelTitle=Title;
        _buttonTitle=cancelTitle;
        _otherButtonTitle=otherButtonTitle;
        _alerttag=tag;
    }
    
    
    _view=[[UIView alloc]initWithFrame:CGRectMake(0,0,self.width, self.height)];
    _view.backgroundColor=BACKGROUNDCOLOR;
    [self addSubview:_view];
    return self;
    
}


-(void)creatView
{
    
    if (![_labelTitle isEqualToString:nil]&&_labelTitle!=nil) {
        self.titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0,30, 40)];
        CGSize size=[self getNSStringSize:_labelTitle];
        self.titleLabel.frame=CGRectMake(10,0,self.bounds.size.width-20,size.height+15);
        self.titleLabel.layer.cornerRadius=2;
        self.titleLabel.text=_labelTitle;
        self.titleLabel.numberOfLines=0;
        if (self.textAlignment) {
            if (self.textAlignment==1) {
                self.titleLabel.textAlignment=NSTextAlignmentRight;
            }
           else if (self.textAlignment==2) {
                self.titleLabel.textAlignment=NSTextAlignmentLeft;
            }
          else  if (self.textAlignment==3) {
                self.titleLabel.textAlignment=NSTextAlignmentCenter;
            }
          else{
             self.titleLabel.textAlignment=NSTextAlignmentCenter;
          }
        }
        else{
            self.titleLabel.textAlignment=NSTextAlignmentCenter;
        }
        
        
        
        self.labelHeight=self.titleLabel.bounds.size.height;
        self.titleLabel.backgroundColor=[UIColor clearColor];
        self.titleLabel.textColor=[UIColor blackColor];
        [self addSubview:self.titleLabel];
    }
    if (![_buttonTitle isEqualToString:nil]&&_buttonTitle!=nil) {
        
        UILabel * linelabel=[[UILabel alloc]initWithFrame:CGRectMake(0,self.frame.size.height-55,self.frame.size.width,1)];
        linelabel.backgroundColor=[UIColor whiteColor];
        linelabel.alpha=0.1;
        [self addSubview:linelabel];

        UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor=[UIColor lightGrayColor];
           btn.layer.cornerRadius=2;
        btn.tag=OTHER_BUTTON_TAG;
        [btn setTitle:_buttonTitle forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];

        if (![_otherButtonTitle isEqualToString:nil]&&_otherButtonTitle!=nil) {
                        btn.frame=CGRectMake(10,self.bounds.size.height-BUTTON_HEIGHT-10,TOW_BUTTON_WIDTH,BUTTON_HEIGHT);
            UILabel * sulinelabel=[[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2-1,self.frame.size.height-55,1,55)];
            
            sulinelabel.backgroundColor=[UIColor whiteColor];
            sulinelabel.alpha=0.1;
            [self addSubview:sulinelabel];
        }
        else{
            btn.frame=CGRectMake(ONE_BUTTON_WIDTH-20,self.bounds.size.height-BUTTON_HEIGHT-10,ONE_BUTTON_WIDTH,BUTTON_HEIGHT);
            
        }
        [self addSubview:btn];
    }
    if (![_otherButtonTitle isEqualToString:nil]&&_otherButtonTitle!=nil) {
        UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor=[UIColor lightGrayColor];
        btn.layer.cornerRadius=2;
        btn.tag=CANCEL_BUTTON_TAG;
        [btn setTitle:_otherButtonTitle forState:UIControlStateNormal];
        
        if (![_buttonTitle isEqualToString:nil]&&_buttonTitle!=nil) {
            btn.frame=CGRectMake(30+
                                 TOW_BUTTON_WIDTH, self.bounds.size.height-BUTTON_HEIGHT-10,TOW_BUTTON_WIDTH,BUTTON_HEIGHT);
        }
        else{
            btn.frame=CGRectMake(ONE_BUTTON_WIDTH-20,self.bounds.size.height-BUTTON_HEIGHT-10,ONE_BUTTON_WIDTH,BUTTON_HEIGHT);
           
        }
        [btn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    
}



-(CGSize)getNSStringSize:(NSString *)aString
{
    UIFont * font=[UIFont systemFontOfSize:15];
   // NSDictionary * dic=[NSDictionary dictionaryWithDictionary:0];
    //iOS7以下的方法
    if (([[[UIDevice currentDevice] systemVersion] floatValue]<= 7.0f)) {
        CGSize size=[aString sizeWithFont:font constrainedToSize:CGSizeMake(self.bounds.size.width, 5000) lineBreakMode:NSLineBreakByCharWrapping];
    
        return size;
    }else//iOS7yi上的方法
    {
        
        CGSize size=[aString sizeWithFont:font constrainedToSize:CGSizeMake(self.bounds.size.width, 5000) lineBreakMode:NSLineBreakByCharWrapping];
        return size;
    }
    

    
}


#pragma mark 显示和清除的方法

-(void)show
{
    
    int height =self.myAlertHeight?self.myAlertHeight:150;
    
    self.frame=CGRectMake(10,150,Screen_weight-20,height);
    _view.frame = CGRectMake(0,0,Screen_weight-20,height);
    if (Screen_weight==375) {
        self.frame=CGRectMake(10,200,Screen_weight-20,height);
    }
    else  if (Screen_weight==414) {
        self.frame=CGRectMake(10,300,Screen_weight-20,height);
    }
    self.layer.cornerRadius=2;
    
    self.backgroundColor=[UIColor clearColor];
    [self creatView];
    UIWindow * window=[UIApplication sharedApplication].keyWindow;
    UIView * view=[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.tag=VIEW_TAG;
    
    if (self.atag) {
        _alerttag=self.atag;
    }
    if (_alerttag) {
        self.tag=_alerttag;
    }else{
        
        _alerttag=AlET_TAG;
        self.tag=_alerttag;
    }
    
    view.backgroundColor=BACKGROUNDCOLOR;
    view.alpha=0.0;
    [UIView animateWithDuration:0.5 animations:^{
        view.alpha=0.5;
    }];
    [UIView commitAnimations];
    UITapGestureRecognizer * tapGes=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clearAlertView)];
    [view addGestureRecognizer:tapGes];
    int time= self.missTime?self.missTime:15;
    [self performSelector:@selector(clearAlertView) withObject:nil afterDelay:time];
    self.center=window.center;
    [window addSubview:view];
    [window addSubview:self];
    
}



-(void)clearAlertView
{
    while ([self.subviews lastObject]!=nil) {
        [(UIView *)[self.subviews lastObject] removeFromSuperview];
    }
    //int tag= self.tag;
    UIWindow * window=[UIApplication sharedApplication].keyWindow;
    [[window viewWithTag:VIEW_TAG] removeFromSuperview];
    [[window viewWithTag:_alerttag] removeFromSuperview];
   
    
}



- (void)Click:(UIButton *)sender
{
    /*
     not_cancel_button=3030,
     Cancel_button=3040
     */
    [self clearAlertView];
    if ([_delegate respondsToSelector:@selector(doSomething:)])
    {
        
        [_delegate doSomething:sender];
    }
    if ([_delegate respondsToSelector:@selector(doSomethingWith:btn:)]) {
        [_delegate doSomethingWith:self btn:sender];
    }
    
   
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
