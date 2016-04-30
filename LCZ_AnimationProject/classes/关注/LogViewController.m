//
//  LogViewController.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/21.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LogViewController.h"
#import "LogViewController.h"
#import "LogView.h"
#import "UMSocial.h"
#import "UMSocialqqHandler.h"
@interface LogViewController ()
{
    NSInteger i;

}
@property(nonatomic,strong)LogView *logView;
@end

@implementation LogViewController
-(void)initDate
{
    i=0;

}
-(void)loadView
{
    [self initDate];
    _logView=[[LogView alloc]init];
    self.view=_logView;
    [self buttonClick];

}
-(void)buttonClick
{
    [_logView.exitButton addTarget:self action:@selector(exitButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_logView.loginchangeButton addTarget:self action:@selector(loginchangeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_logView.qqShare addTarget:self action:@selector(qqShareClick) forControlEvents:UIControlEventTouchUpInside];
    [_logView.sinaShare addTarget:self action:@selector(sinaShareClick) forControlEvents:UIControlEventTouchUpInside];
    [_logView.tencentShare addTarget:self action:@selector(tencentShareClick) forControlEvents:UIControlEventTouchUpInside];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor=[UIColor lightGrayColor];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"login_register_background"]];

    UITapGestureRecognizer *tapGest=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchClick)];
    [self.view addGestureRecognizer:tapGest];
}
-(void)touchClick
{
    [_logView.phoneTextFiled resignFirstResponder];
    [_logView.PassTextFiled resignFirstResponder];
    [_logView.regiPhoneTextFiled resignFirstResponder];
    [_logView.SettingPassTextFiled resignFirstResponder];


}
#pragma mark 退出按钮
-(void)exitButtonClick
{
     [self touchClick];
    [UIView animateWithDuration:1 animations:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
  

}
#pragma mark 注册登录切换按钮
-(void)loginchangeButtonClick
{
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
        if (_logView.loginAndRegi.x==0) {
            _logView.loginAndRegi.x=-self.view.bounds.size.width;
            _logView.loginchangeButton.selected=YES;
            
        }else
        {
            _logView.loginchangeButton.selected=NO;
            
            _logView.loginAndRegi.x=0;
            
        }
    }];

}
#pragma  mark 扣扣分享
-(void)qqShareClick
{
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatSession] content:@"分享内嵌文字" image:nil location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
//    [UMSocialConfig setWXAppId:@"wx34bd7147c4d8ad5a" url:nil];
    
}
#pragma mark 新浪分享
-(void)sinaShareClick
{
    

    //根据url创建一个UMSocialUrlResource对象；resourceType：多媒体资源类型，图片、音乐或者视频；urlString：url字符串
    UMSocialUrlResource *urlResource = [[UMSocialUrlResource alloc]initWithSnsResourceType:UMSocialUrlResourceTypeImage url:@"http://img0.pcgames.com.cn/pcgames/1407/07/4057451_1_thumb.jpg"];    //分享url资源
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatSession] content:@"分享内嵌文字" image:nil location:nil urlResource:urlResource presentedController:self completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
    
  [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://baidu.com";
       
   
}
#pragma mark 腾讯分享
-(void)tencentShareClick
{
//    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeApp;
//    
//    // 分享图盘到微信朋友圈显示字数比较少，只显示分享标题
//    
//    [UMSocialData defaultData].extConfig.title = @"朋友圈分享内容";
//    // 显示分享平台
//    
//    [UMSocialSnsService presentSnsController:self appKey:nil shareText:@"分享的内容" shareImage:nil 
}
@end
