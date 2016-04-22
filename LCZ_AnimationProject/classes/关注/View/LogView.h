//
//  LogView.h
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/21.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareButton.h"
/**
 *  登录view
 */
@interface LogView : UIView
/**
 *  退出按钮
 */
@property(nonatomic,strong)UIButton *exitButton;
/**
 *  登录注册切换按钮
 */
@property(nonatomic,strong)UIButton *loginchangeButton;
/**
 *  注册登录所在的总view
 */
@property(nonatomic,strong)UIView *loginAndRegi;
/**
 *  手机号密码所在的view（登录）
 */
@property(nonatomic,strong)UIView *loginView;
/**
 *  手机号输入框（登录）
 */
@property(nonatomic,strong)UITextField *phoneTextFiled;
/**
 *  密码输入框（登录）
 */
@property(nonatomic,strong)UITextField *PassTextFiled;
/**
 *  登录按钮
 */
@property(nonatomic,strong)UIButton *loginButton;
/**
 *  忘记密码按钮
 */
@property(nonatomic,strong)UIButton *forgotButton;
/**
 *  手机号密码所在的view（登录）
 */
@property(nonatomic,strong)UIView *regiView;
/**
 *  手机号输入框（注册）
 */
@property(nonatomic,strong)UITextField *regiPhoneTextFiled;
/**
 *  密码输入框（注册）
 */
@property(nonatomic,strong)UITextField *SettingPassTextFiled;
/**
 *  注册按钮
 */
@property(nonatomic,strong)UIButton *regiButton;
/**
 *  快速登录
 */
@property(nonatomic,strong)UILabel *quickLogin;
/**
 *  扣扣分享
 */
@property(nonatomic,strong)ShareButton *qqShare;
/**
 *  微博分享
 */
@property(nonatomic,strong)ShareButton *sinaShare;
/**
 *  腾讯微博分享
 */
@property(nonatomic,strong)ShareButton *tencentShare;
@end
