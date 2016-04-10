//
//  AddTreaView.h
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/10.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTreaView : UIView
/**
 *  请输入城市
 */
@property(nonatomic,strong)UITextField *cityFiled;
/**
 *  请输入小区
 */
@property(nonatomic,strong)UITextField *housingFiled;

/**
 *  详细地址
 */
@property(nonatomic,strong)UITextField *hdetailedFiled;

@end

