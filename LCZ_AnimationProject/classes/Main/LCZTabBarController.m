//
//  LCZTabBarController.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LCZTabBarController.h"
#import "LCZNavigationController.h"
#import "LCZNewViewController.h"
#import "LCZAttentionViewController.h"
#import "LCZMeViewController.h"
#import "LCZEssenceViewController.h"
#import "LCZTabBar.h"

@interface LCZTabBarController ()

@end

@implementation LCZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self AddControllers];
    [self setValue:[[LCZTabBar alloc]init] forKeyPath:@"tabBar"];
}
#pragma  mark  添加子控制器
-(void)AddControllers
{
    LCZEssenceViewController *essen=[LCZEssenceViewController new];
    [self addController:essen image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon" title:@"精华"];
    LCZNewViewController *new=[LCZNewViewController new];
    [self addController:new image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon" title:@"最新"];
    LCZAttentionViewController *att=[LCZAttentionViewController new];
    [self addController:att image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon" title:@"关注"];
    LCZMeViewController *me=[LCZMeViewController new];
    [self addController:me image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon" title:@"我"];
    


}
#pragma  mark 创建子控制器
-(void)addController:(UIViewController *)vc image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    vc.title=title;
    vc.tabBarItem.image=[[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.title=title;
    LCZNavigationController *nav=[[LCZNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
   


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
