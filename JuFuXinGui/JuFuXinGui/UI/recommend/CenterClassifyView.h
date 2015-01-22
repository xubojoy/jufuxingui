//
//  CenterClassifyView.h
//  JuFuXinGui
//
//  Created by myStyle on 14-12-30.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CenterClassifyView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *bgImg;

@property (weak, nonatomic) IBOutlet UILabel *classifyContent;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIButton *tapBtn;
@property (nonatomic, strong) NSDictionary *dataDict;

- (IBAction)tapBtnClick:(id)sender;

@end
