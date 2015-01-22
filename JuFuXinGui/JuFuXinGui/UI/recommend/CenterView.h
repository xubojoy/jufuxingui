//
//  CenterView.h
//  JuFuXinGui
//
//  Created by myStyle on 14-12-26.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CenterViewDelegate <NSObject>
-(void)didClassifyBtn:(UIButton *)aSender;

@end

@interface CenterView : UIView

@property (weak, nonatomic) IBOutlet UIView *upLine;
@property (weak, nonatomic) IBOutlet UIView *downLine;
@property (weak, nonatomic) IBOutlet UIButton *centerLeftClassifyBtn;
@property (weak, nonatomic) IBOutlet UIButton *centerClassifyBtn;
@property (weak, nonatomic) IBOutlet UIButton *centerRightClassifyBtn;
@property (nonatomic, strong) UIView *centerLeftLine;
@property (nonatomic, strong) UIView *centerRightLine;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UILabel *titleLab1;
@property (weak, nonatomic) IBOutlet UILabel *titleLab2;
@property (weak, nonatomic) IBOutlet UILabel *titleLab3;
@property (nonatomic, weak) id<CenterViewDelegate> delegate;

- (IBAction)centerClassifyBtnClick:(UIButton *)sender;


@end
