//
//  LocalCache.m
//  JuFuXinGui
//
//  Created by mac on 15/1/6.
//  Copyright (c) 2015年 XB. All rights reserved.
//

#import "LocalCache.h"
static LocalCache * share=nil;
@implementation LocalCache
+(id)shareuser{
    if (share == nil) {
        share =[[LocalCache alloc]init];
       
    }
    return share;
}
-(void)goout{
    self.rjian=nil;
    self.changji=nil;
    self.yonghu=nil;
}
@end
