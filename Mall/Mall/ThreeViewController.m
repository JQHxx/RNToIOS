//
//  ThreeViewController.m
//  Mall
//
//  Created by midland on 2019/8/14.
//  Copyright © 2019 JQHxx. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.title = @"我是原生";
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(50, 70, (self.view.frame.size.width-100), 44);
    label.text = @"我又回来了";
    [self.view addSubview:label];
}
    
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = YES;
}


@end
