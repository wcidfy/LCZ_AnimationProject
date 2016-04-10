//
//  AddTreaView.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/10.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "AddTreaView.h"

@implementation AddTreaView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        UILabel *la=[self getLable];
        la.frame=CGRectMake(0, 84, 100, 40);
        la.text=@"请输入省区:";
        [self addSubview:la];
        _cityFiled=[self getTextFiled];
        _cityFiled.placeholder=@"请输入省区";
        
        [self addSubview:_cityFiled];
        
        
    }


    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _cityFiled.frame=CGRectMake(100, 84, self.frame.size.width-100, 40);



}
-(UILabel*)getLable
{
    UILabel *la=[[UILabel alloc]init];
    la.textColor=[UIColor grayColor];
    la.textAlignment=NSTextAlignmentCenter;
    la.backgroundColor=[UIColor whiteColor];
    la.layer.masksToBounds=YES;
    la.layer.borderWidth=0.5;
    la.layer.borderColor=[UIColor grayColor].CGColor;
    return la;
}
-(UITextField *)getTextFiled
{
    UITextField *tx=[[UITextField alloc]init];
    tx.textAlignment=NSTextAlignmentLeft;
    tx.layer.masksToBounds=YES;
    tx.layer.borderWidth=1;
    tx.layer.borderColor=[UIColor grayColor].CGColor;

    return tx;
}
@end
