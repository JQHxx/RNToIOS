//
//  ViewController.m
//  Mall
//
//  Created by midland on 2019/8/14.
//  Copyright © 2019 JQHxx. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * btn =[UIButton buttonWithType: UIButtonTypeCustom];
    btn.frame =CGRectMake(100,100, self.view.frame.size.width-200, 50);
    [btn setTitle:@"点我跳原生" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
    
-(void)press:(UIButton *)btn{
    TwoViewController * two =[[TwoViewController alloc]init];
    UINavigationController * nav =[[UINavigationController alloc]initWithRootViewController:two];
    [self presentViewController:nav animated:YES completion:nil];
    
}


@end
