//
//  InsetsLabel.m
//  JuFuXinGui
//
//  Created by myStyle on 15-1-9.
//  Copyright (c) 2015年 XB. All rights reserved.
//

#import "InsetsLabel.h"

@implementation InsetsLabel
-(id)initWithFrame:(CGRect)frame andInsets:(UIEdgeInsets)insets{
    self = [super initWithFrame:frame];
    if (self) {
        self.insets = insets;
    }
    return self;
}

-(id)initWithInsets:(UIEdgeInsets)insets{
    self = [super init];
    if (self) {
        self.insets = insets;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {0, 15, 0, 15};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}


@end
