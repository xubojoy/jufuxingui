//
//  Progress.h
//  JuFuXinGui
//
//  Created by 张昊天 on 15-1-5.
//  Copyright (c) 2015年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Progress : UIView{

    UIImageView *BGView;
    UIImageView *pointer;
    UILabel *progressValue;
//    float oldProgress;
//    UITextField *vvv;

    
}
-(void)updataWithValue:(float)value;
/*
 *设置进度
 */

@end
