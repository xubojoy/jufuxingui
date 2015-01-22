//
//  CommonItemTxt.h
//  styler
//
//  Created by System Administrator on 13-7-4.
//  Copyright (c) 2013年 mlzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonItemTxt : NSObject

@property int txtType;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;

-(id) init:(int)txtType title:(NSString *)title content:(NSString *)content;

@end
