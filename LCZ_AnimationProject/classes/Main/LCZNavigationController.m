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
    UIImage *background = [UIImage imageNamed:@"navigationbarBackgroundWhite"];
    //设置导航条
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:background forBarMetrics:UIBarMetricsDefault];
    [bar setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:20]}];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
