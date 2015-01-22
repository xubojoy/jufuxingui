//
//  MyTextField.m
//  玖信贷
//
//  Created by 庞珂路 on 14-11-24.
//  Copyright (c) 2014年 neil. All rights reserved.
//

#import "MyTextField.h"
#import "HAN_Constants.h"
@implementation MyTextField
{
    UIToolbar* toolbar;
    UIBarButtonItem* doneBtn;
}
-(void)initViewWithString:(NSString*)string{
    self.typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,View_SizeW(self)/4, View_SizeY(self))];
    [self addSubview:self.typeLabel];
    self.typeLabel.textAlignment = NSTextAlignmentCenter;
    self.typeLabel.textColor=[UIColor blackColor];
   // UILabel* line = [[UILabel alloc]initWithFrame:CGRectMake(VIEW_MAXX(self.typeLabel)+1,View_SizeY(self)/8, 1,3*View_SizeY(self)/4)];
    //[self addSubview:line];
    self.typeLabel.font = [UIFont systemFontOfSize:12];
    //line.backgroundColor = [UIColor blueColor];
    //line.tag = 3000;
    //self.myTextField = [[UITextField alloc]initWithFrame:CGRectMake(VIEW_MAXX(line)+3,0, View_SizeW(self)-View_SizeW(self.typeLabel)-60, View_SizeY(self))];
    int x;
    if (self.type==3) {
        x=View_SizeW(self)/4;
    }else{
        x=10;
    }
     self.myTextField = [[UITextField alloc]initWithFrame:CGRectMake(x,0, View_SizeW(self)-View_SizeW(self.typeLabel)-60, View_SizeY(self))];
    self.myTextField.adjustsFontSizeToFitWidth = YES;
    self.myTextField.minimumFontSize = 0.1;
    UIFont* font ;
    if (string.length>=10) {
        font = [UIFont systemFontOfSize:10];
    }else{
        font = [UIFont systemFontOfSize:14];
    }
    self.myTextField.font = font;
    [self addSubview:self.myTextField];
   
//    NSDictionary *boldFont = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:5.0] forKey:NSFontAttributeName];
//    NSAttributedString* str = [[NSAttributedString alloc]initWithString:string attributes:boldFont];
//    self.myTextField.attributedPlaceholder = str;
    self.myTextField.placeholder = string;
    self.myTextField.delegate = self;
    self.layer.borderWidth = 1;
    self.layer.borderColor = RGBACOLOR(15, 106, 249, 1).CGColor;
    
    self.placeHolder = string;
    //工具栏
    toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, Screen_weight, Screen_height/15)];
    toolbar.backgroundColor = [UIColor lightGrayColor];
    doneBtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(doneAction)];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneBtn, nil];
    [toolbar setItems:buttonsArray];
    self.myTextField.inputAccessoryView = toolbar;
   
}
-(void)doneAction{
    [self.myTextField resignFirstResponder];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
   // self.typeLabel.hidden=YES;
    self.myTextField.font = [UIFont systemFontOfSize:14];
//    self.layer.borderColor = RGBACOLOR(209, 223, 244, 1).CGColor;
//    UILabel* line = (UILabel*)[self viewWithTag:3000];
//    line.backgroundColor = RGBACOLOR(209, 223, 244, 1);
    //self.myTextField.placeholder = nil;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    UIFont* font ;
    if (![textField.text isEqualToString:@""]) {
        font = [UIFont systemFontOfSize:14];
    }else{
        font = [UIFont systemFontOfSize:14];
    }
    self.myTextField.font = font;
    self.typeLabel.hidden=NO;
    //self.layer.borderColor = [UIColor lightGrayColor].CGColor;
   // UILabel* line = (UILabel*)[self viewWithTag:3000];
   // line.backgroundColor = [UIColor lightGrayColor];
    //self.myTextField.placeholder = self.placeHolder;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}
@end
