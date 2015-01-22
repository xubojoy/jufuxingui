//
//  MyNBTabController.h
//  NB2
//
//  Created by kohn on 13-11-16.
//  Copyright (c) 2013年 Kohn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTViewController.h"
#import "CycleScrollView.h"
#import "CenterClassifyView.h"
#import "Progress.h"
@interface RecomIndexViewController : UIViewController
@property (nonatomic ,weak) NTViewController * delegate;
@property (nonatomic , retain) CycleScrollView *mainScorllView;
@property (nonatomic, strong) HeaderView *header;
@property (nonatomic, strong) CenterClassifyView *centerClassifyView;
@property (nonatomic, strong) Progress *circle;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *contentArray;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSDictionary *dataDic;
@property (nonatomic, strong) NSMutableArray *huodongArray;



@end