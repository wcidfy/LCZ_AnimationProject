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


@interface LCZNewViewController ()<RCIMUserInfoDataSource>

@end

@implementation LCZNewViewController
+(void)initialize
{
    [[RCIM sharedRCIM] initWithAppKey:@"ik1qhw091mi8p"];

}
-(void)getToken
{
 NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userId"]=@"111";
    params[@"name"]=@"xxxx";
    params[@"portraitUri"]=@"http://img2.imgtn.bdimg.com/it/u=998138008,4043877710&fm=206&gp=0.jpg";
    [HttpTool Post:@"https://api.cn.ronghub.com/user/getToken.json" parameters:params success:^(id responseObject) {
        NSLog(@"%@",responseObject[@"token"]);
        NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
        [ud setObject:responseObject[@"token"] forKey:@"Token"];
      
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];


}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self getToken];
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
   NSString *token= [ud objectForKey:@"Token"];
    [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
      
        
        [[RCIM sharedRCIM]setUserInfoDataSource:self];
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
-(void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion
{
    if ([@"1213" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"1213";
        user.name = @"韩梅梅";
        user.portraitUri = @"http://rongcloud-web.qiniudn.com/docs_demo_rongcloud_logo.png";
        return completion(user);
    }
    return completion(nil);
}
@end
