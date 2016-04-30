//
//  LCZAttentionViewController.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LCZAttentionViewController.h"
#import "LogViewController.h"
#import "MyAlertView.h"
@interface LCZAttentionViewController ()

@end

@implementation LCZAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *but=[UIButton buttonWithType:UIButtonTypeCustom];
    but.frame=CGRectMake(100, 100, 60, 40);
    [but setTitle:@"点击" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(butClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}
-(void)butClick
{

        LogViewController *log=[LogViewController new];
        [self presentViewController:log animated:NO completion:nil];
   
}

@end
