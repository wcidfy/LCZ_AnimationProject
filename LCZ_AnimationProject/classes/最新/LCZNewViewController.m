//
//  LCZNewViewController.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LCZNewViewController.h"
#import <RongIMKit/RongIMKit.h>
#import "HttpTool.h"
#import "ChatListViewController.h"
@interface LCZNewViewController ()

@end

@implementation LCZNewViewController
+(void)initialize
{
    [[RCIM sharedRCIM] initWithAppKey:@"ik1qhw091mi8p"];

}
-(void)getToken
{
 NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userId"]=@"test1";
    params[@"name"]=@"test1";
    params[@"portraitUri"]=@"qeqwe";
    [HttpTool Post:@"https://api.cn.ronghub.com/user/getToken.json" parameters:params success:^(id responseObject) {
        NSLog(@"2123");
        
    } failure:^(NSError *error) {
        
    }];


}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self getToken];
    [[RCIM sharedRCIM] connectWithToken:@"31MSEr5EuNyvYl5BNZKWWLh6gmgQGoc6P6GEId1RDJ9kQgbTYaM3PJQa5SOyGXp8EXDwMEpW3WjaWrLgBQprlA==" success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%d", status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
    
    
    UIButton *but=[UIButton buttonWithType:UIButtonTypeCustom];
    but.frame=CGRectMake(100, 100, 100, 100);
    [but setTitle:@"点击" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(butClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}
-(void)butClick
{
    ChatListViewController *chatList = [[ChatListViewController alloc] init];
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:chatList animated:YES];
    self.hidesBottomBarWhenPushed=NO;

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
