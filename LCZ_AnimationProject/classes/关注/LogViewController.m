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
    [_logView.exitButton addTarget:self action:@selector(exitButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_logView.loginchangeButton addTarget:self action:@selector(loginchangeButtonClick) forControlEvents:UIControlEventTouchUpInside];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor lightGrayColor];
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
-(void)exitButtonClick
{
    [self dismissViewControllerAnimated:YES completion:nil];

}
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
