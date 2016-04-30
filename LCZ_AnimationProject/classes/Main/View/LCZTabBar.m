//
//  LCZTabBar.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LCZTabBar.h"
#import "LCZPublicView.h"
@interface LCZTabBar()
@property(nonatomic,strong)UIButton *publicButton;
@end
@implementation LCZTabBar


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
       

        UITabBarItem *barItem=[UITabBarItem appearance];
        [barItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
        [barItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
        _publicButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_publicButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        _publicButton.size=_publicButton.currentImage.size;
        [_publicButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [[_publicButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
            NSLog(@"qewq");
            UIWindow *wind=[UIApplication sharedApplication].keyWindow;
            LCZPublicView *lcz=[LCZPublicView new];
            lcz.backgroundColor=[UIColor whiteColor];
            lcz.frame=[UIScreen mainScreen].bounds;
            [wind addSubview:lcz];
        }];
        [self addSubview:_publicButton];
        
    }
    return self;

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat Width=self.width;
    
    CGFloat Height=self.height;
    NSInteger index=0;
    CGFloat viewX;
    self.publicButton.center=CGPointMake(Width/2, Height/2);
    for (UIView *view in self.subviews) {
        if (![view isKindOfClass:[UIControl class]]||view==self.publicButton) continue;{
            viewX=(index>1?index+1:index)*self.width/5;
            view.frame=CGRectMake(viewX, 0, Width/5, Height);
            index++;
           
           
        }
    }


}
@end
