//
//  UserModel.m
//  JuFuXinGui
//
//  Created by mac on 14/12/31.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "UserModel.h"
static UserModel *shareUser = nil;
@implementation UserModel
+(UserModel *)shareuser{
    if (shareUser == nil) {
        shareUser =[[UserModel alloc]init];
        shareUser.money=[NSString stringWithFormat:@"2300"];
        
    }
    return shareUser;
}
-(void)initUserByDic:(NSDictionary*)dic{
    self.token = [dic objectForKey:@"token"];
    self.isLoad = YES;
}
-(void)goout{
    self.token=nil;
    self.isLoad=NO;
    self.idcard=nil;
    self.userName=nil;
    self.truename=nil;
    self.userimage=nil;
    self.sex=nil;
    self.pwd=nil;
    self.userid=nil;
    self.money=nil;
   self.isgesture=nil;
    [self zhanghu];
    
}
-(void)zhanghu{
    self.myincomArray=nil;
    self.huikuanArray=nil;
    self.zijingArray=nil;
    self.touziArray=nil;
}
@end
