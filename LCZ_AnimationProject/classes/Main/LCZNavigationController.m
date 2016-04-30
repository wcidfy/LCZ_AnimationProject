//
//  LCZNavigationController.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LCZNavigationController.h"

@interface LCZNavigationController ()

@end

@implementation LCZNavigationController
//只初始化一次
+ (void)initialize
{
    UIImage *background = [UIImage imageNamed:@"login_register_background"];
//    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"login_register_background"]];

    //设置导航条
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:background forBarMetrics:UIBarMetricsDefault];
    [bar setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:20]}];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
