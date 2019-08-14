//
//  TwoViewController.m
//  Mall
//
//  Created by midland on 2019/8/14.
//  Copyright © 2019 JQHxx. All rights reserved.
//

#import "TwoViewController.h"
#import "ReactView.h"
//要跳转的原生界面
#import "ThreeViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    
    
    
    //self.navigationItem.title = @"我是包含RN的原生页面哟~";
    ReactView * reactView = [[ReactView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height)];
    [self.view addSubview:reactView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doPushNotification:) name:@"RNOpenOneVC" object:nil];
}

- (void)doPushNotification:(NSNotification *)notification{
    NSLog(@"成功收到===>通知");
    ThreeViewController *one = [[ThreeViewController alloc]init];
    
    
    [self.navigationController pushViewController:one animated:YES];
    
    //注意不能在这里移除通知否则pus进去后有pop失效
}

@end
