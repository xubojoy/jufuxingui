//
//  InsetsLabel.h
//  JuFuXinGui
//
//  Created by myStyle on 15-1-9.
//  Copyright (c) 2015年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InsetsLabel : UILabel
@property(nonatomic) UIEdgeInsets insets;
-(id) initWithFrame:(CGRect)frame andInsets: (UIEdgeInsets) insets;
-(id)initWithInsets:(UIEdgeInsets)insets ;
@end
