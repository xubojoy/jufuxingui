//
//  Progress.m
//  JuFuXinGui
//
//  Created by 张昊天 on 15-1-5.
//  Copyright (c) 2015年 XB. All rights reserved.
//

#import "Progress.h"

@implementation Progress


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        BGView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width*44/50)];
        BGView.image = [UIImage imageNamed:@"wai_kuang_icon"];
        [self addSubview:BGView];
        
        pointer = [[UIImageView alloc] initWithFrame:CGRectMake(0, (frame.size.height - frame.size.width*35/233)/2, frame.size.width, frame.size.width*35/233)];
        pointer.transform = CGAffineTransformRotate(pointer.transform, -45 * M_PI/180.0);
        pointer.image = [UIImage imageNamed:@"pointer2"];
        [self addSubview:pointer];
        progressValue = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/4, frame.size.height*0.75, frame.size.width/2, frame.size.height*0.15)];
        progressValue.font = [UIFont systemFontOfSize:frame.size.height*0.15];
        progressValue.textAlignment = NSTextAlignmentCenter;
        [self addSubview:progressValue];
        
        UILabel *ttt = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/4, progressValue.frame.size.height + progressValue.frame.origin.y, frame.size.width/2, frame.size.height*0.1)];
        ttt.textAlignment = NSTextAlignmentCenter;
        ttt.font = [UIFont systemFontOfSize:frame.size.height*0.08];
        ttt.text = @"已完成";
        [self addSubview:ttt];
        
//        vvv = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.width-30, 0, 30, 20)];
//        vvv.borderStyle = UITextBorderStyleLine;
//        [self addSubview:vvv];
//        
//        UIButton *su = [UIButton buttonWithType:UIButtonTypeContactAdd];
//        [su addTarget:self action:@selector(updata) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:su];
        
    }
    return self;
}
//-(void)updata{
//
//    [vvv resignFirstResponder];
//    int n = [vvv.text intValue];
////    [self FormatProgress];
//    [self updataWithValue:n];
//
//}


-(void)updataWithValue:(float)value{

    
    
    pointer.transform = CGAffineTransformIdentity;
    pointer.transform = CGAffineTransformRotate(pointer.transform, -45 * M_PI/180.0);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3.0];
    
 
    if(value > 67){
    
        pointer.transform = CGAffineTransformRotate(pointer.transform, M_PI);
        pointer.transform = CGAffineTransformRotate(pointer.transform, M_PI*0.5*((value-67)/33.0));
    }else{
    
        pointer.transform = CGAffineTransformRotate(pointer.transform, M_PI*(value / 67.0));
        
    }
    
    progressValue.text = [NSString stringWithFormat:@"%.0f%%",value];
    [UIView commitAnimations];

    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
