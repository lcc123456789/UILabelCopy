//
//  ViewController.m
//  UILable_Copy
//
//  Created by mac on 17/1/4.
//  Copyright © 2017年 lcc. All rights reserved.
//

#import "ViewController.h"
#import "CC_CopyLable.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CC_CopyLable *LabTest = [CC_CopyLable cc_CopyLableWithType:LabelTypeShowAll];
    LabTest.frame = CGRectMake(100, 100, 100, 30);
    LabTest.text = @"testetstdddkk";
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(70, 0, 30, 30)];
//    btn.backgroundColor = [UIColor lightGrayColor];
   // [LabTest addSubview:btn];
    [self.view addSubview:LabTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
