//
//  MyAlertView.h
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/12.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAlertView : UIAlertView
@property(nonatomic, retain) UITextField *_oldPwd;    // 旧密码输入框
@property(nonatomic, retain) UITextField *qqd;    // 新密码输入框
@property(nonatomic, retain) UITextField* _cfmPwd;    // 新密码确认框


@end
