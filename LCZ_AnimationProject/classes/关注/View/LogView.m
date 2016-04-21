//
//  LogView.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/21.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LogView.h"
@interface LogView()
{
    UIView *whileLine;
    UIView *whileLine1;
}
@end
@implementation LogView
-(instancetype )initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];

    if (self) {
        
        _exitButton=[self getButton];
        [_exitButton setBackgroundImage:[UIImage imageNamed:@"login_close_icon"] forState:UIControlStateNormal];
        [self addSubview:_exitButton];
        
        _loginchangeButton=[self getButton];
        [_loginchangeButton setTitle:@"注册账号" forState:UIControlStateNormal];
        [_loginchangeButton setTitle:@"已有账号？" forState:UIControlStateSelected];

        [self addSubview:_loginchangeButton];
        
        _loginAndRegi=[[UIView alloc]init];
        _loginAndRegi.backgroundColor=[UIColor clearColor];
        [self addSubview:_loginAndRegi];
        _loginAndRegi.transform=CGAffineTransformMakeScale(0.0000001,0.0000001);

        _loginView=[[UIView alloc]init];
        _loginView.backgroundColor=[UIColor grayColor];
        _loginView.layer.masksToBounds=YES;
        _loginView.layer.cornerRadius=10;
        [_loginAndRegi addSubview:_loginView];
        
        _phoneTextFiled=[[UITextField alloc]init];
        _phoneTextFiled.placeholder=@"请输入手机号";
//        _phoneTextFiled.backgroundColor=[UIColor grayColor];
        [_loginView addSubview:_phoneTextFiled];
        
        whileLine=[[UIView alloc]init];
        whileLine.backgroundColor=[UIColor whiteColor];
        [_loginView addSubview:whileLine];
        
        _PassTextFiled=[[UITextField alloc]init];
        _PassTextFiled.placeholder=@"请输入密码";
        [_loginView addSubview:_PassTextFiled];
        
        _loginButton=[self getButton];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        _loginButton.backgroundColor=[UIColor grayColor];
        _loginButton.layer.masksToBounds=YES;
        _loginButton.layer.cornerRadius=10;
        [_loginAndRegi addSubview:_loginButton];
        
        
        
        
        
        
        
        
        
        
        
        _regiView=[[UIView alloc]init];
        _regiView.backgroundColor=[UIColor grayColor];
        _regiView.layer.masksToBounds=YES;
        _regiView.layer.cornerRadius=10;
        [_loginAndRegi addSubview:_regiView];
        
        _regiPhoneTextFiled=[[UITextField alloc]init];
        _regiPhoneTextFiled.placeholder=@"请输入手机号";
        //        _phoneTextFiled.backgroundColor=[UIColor grayColor];
        [_regiView addSubview:_regiPhoneTextFiled];
        
        whileLine1=[[UIView alloc]init];
        whileLine1.backgroundColor=[UIColor whiteColor];
        [_regiView addSubview:whileLine1];
        
        _SettingPassTextFiled=[[UITextField alloc]init];
        _SettingPassTextFiled.placeholder=@"请设置密码";
        [_regiView addSubview:_SettingPassTextFiled];
        
        _regiButton=[self getButton];
        [_regiButton setTitle:@"注册" forState:UIControlStateNormal];
        _regiButton.backgroundColor=[UIColor grayColor];
        _regiButton.layer.masksToBounds=YES;
        _regiButton.layer.cornerRadius=10;
        [_loginAndRegi addSubview:_regiButton];
        
        
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _exitButton.frame=CGRectMake(20, 20, 20, 20);
    _loginchangeButton.frame=CGRectMake(LCZViewWidth-90, 20, 90, 20);
    _loginAndRegi.frame=CGRectMake(0, 0,LCZViewWidth*2, 150);
    _loginView.frame=CGRectMake(20,20, LCZViewWidth-40, 80);
    _phoneTextFiled.frame=CGRectMake(0, 10,_loginView.width , 30);
    whileLine.frame=CGRectMake(0, 40, _loginView.width, 1);
    _PassTextFiled.frame=CGRectMake(0, 41,_loginView.width, 30);
    _loginButton.frame=CGRectMake(20, _loginView.x+80+10, _loginView.width, 30);
    
    
    
    
    _regiView.frame=CGRectMake(LCZViewWidth+20,20, LCZViewWidth-40, 80);
    _regiPhoneTextFiled.frame=CGRectMake(0, 10,_regiView.width , 30);
    whileLine1.frame=CGRectMake(0, 40, _regiView.width, 1);
    _SettingPassTextFiled.frame=CGRectMake(0, 41,_regiView.width, 30);
    _regiButton.frame=CGRectMake(LCZViewWidth+20,110, _regiView.width, 30);
    [self setAnimation];
   
}
-(void)setAnimation
{

    // 退出按钮动画
    [UIView animateWithDuration:1.0 animations:^{
        self.exitButton.transform = CGAffineTransformMakeRotation(M_PI);
        
    }];
    

        [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.25 initialSpringVelocity:0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
            _loginAndRegi.y=150;
        } completion:^(BOOL finished) {
            [self layoutIfNeeded];
            _loginAndRegi.y=LCZViewHeight*0.15;
            _loginAndRegi.transform=CGAffineTransformMakeScale(1, 1);

            //注册账号动画
            [self setupAnimationWithStartRect:CGRectMake(0, 0, 0, CGRectGetHeight(self.loginchangeButton.frame)) endRect:CGRectMake(0, 0, CGRectGetWidth(self.loginchangeButton.frame), CGRectGetHeight(self.loginchangeButton.frame)) object:self.loginchangeButton duration:0.5];
        }];

        
    
    
    
    
    
 



}
-(UIButton *)getButton
{
    UIButton *but=[UIButton buttonWithType:UIButtonTypeCustom];
    [but setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    but.titleLabel.textAlignment=NSTextAlignmentCenter;
    return but;
}

//设置动画
-(void)setupAnimationWithStartRect:(CGRect)startRect endRect:(CGRect)endRect object:(UIView *)view duration:(NSTimeInterval)duration {
    
    UIBezierPath *beginPath = [UIBezierPath bezierPathWithRect:startRect];
    
    UIBezierPath *endPath = [UIBezierPath bezierPathWithRect:endRect];
    
    CAShapeLayer *quickMask = [[CAShapeLayer alloc]init];
    quickMask.path = endPath.CGPath;
    quickMask.fillColor = [UIColor whiteColor].CGColor;
    view.layer.mask = quickMask;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = duration;
    animation.beginTime = CACurrentMediaTime();
    animation.fromValue = (__bridge id _Nullable)(beginPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(endPath.CGPath);
    [quickMask addAnimation:animation forKey:@"path"];
    
}
@end
