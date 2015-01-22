//
//  ShareContent.m
//  styler
//
//  Created by wangwanggy820 on 14-8-8.
//  Copyright (c) 2014年 mlzj. All rights reserved.
//

#import "ShareContent.h"

@implementation ShareContent

-(id)initWithTitle:(NSString *)title content:(NSString *)content sinaWeiBoContent:(NSString *)sinaWeiBoContent url:(NSString *)url image:(UIImage *)image imageUrl:(NSString *)imageUrl{

    self = [super init];
    if (self) {
        self.title = title;
        self.content = content;
        self.sinaWeiBoContent = sinaWeiBoContent;
        self.url = url;
        self.image = image;
        self.imageUrl = imageUrl;
    }
    return self;
}

@end
