//
//  LCZPublicView.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LCZPublicView.h"
#import "MyButton.h"
@interface LCZPublicView()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIButton  *exitButton;
@property(nonatomic,strong)UIView *whileView;


@end
@implementation LCZPublicView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        _whileView=[[UIView alloc]init];
        [self addSubview:_whileView];
        _imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"app_slogan"]];
        [_whileView addSubview:_imageView];
       
        
    
        _exitButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_exitButton setTitle:@"取消" forState:UIControlStateNormal];
        [_exitButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_exitButton addTarget:self action:@selector(exitButClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_whileView addSubview:_exitButton];
        [self SetAnimation:_whileView];
    }

    

    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _imageView.frame=CGRectMake(20, LCZViewHeight*0.2,LCZViewWidth-40, 20);
    _whileView.frame=CGRectMake(0, 0, LCZViewWidth, LCZViewHeight);
    _exitButton.frame=CGRectMake(LCZViewWidth/2-20, LCZViewHeight-60, 40, 40);
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"发链接"];
    for (NSInteger i=0; i<images.count; i++) {
        MyButton *Butt=[MyButton buttonWithType:UIButtonTypeCustom];
        [Butt setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [Butt setTitle:titles[i] forState:UIControlStateNormal];
        Butt.titleLabel.textAlignment=NSTextAlignmentCenter;
        NSInteger maxRowCount=3;
        CGFloat startX=20;
        CGFloat buttonW=70;
        CGFloat buttonH=100;
        CGFloat middleW=(LCZViewWidth-startX*2-buttonW*maxRowCount)/2;
        
        NSInteger Col=i%3;
        NSInteger Row=i/3;
        CGFloat buttonX=startX+(middleW+buttonW)*Col;
        CGFloat buttonY=LCZViewHeight*0.4+Row*(100+20);
        Butt.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [_whileView addSubview:Butt];

}
    
}


-(void)exitButClick
{
    NSLog(@"121");
    [self cancelAnimation];
}
-(void)SetAnimation:(UIView *)view
{

[UIView animateWithDuration:0.1 delay:0 usingSpringWithDamping:1 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
    
} completion:^(BOOL finished) {
    [UIView animateWithDuration:0.1 delay:0 usingSpringWithDamping:1 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        view.transform=CGAffineTransformMakeScale(0.01, 0.01);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:1 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
             view.transform=CGAffineTransformMakeScale(1, 1);
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionTransitionCurlDown animations:^{
                self.imageView.y=120;
                [self layoutIfNeeded];
            } completion:nil];
        }];
    }];
}];


}
-(void)cancelAnimation
{
    for (NSInteger i = 0; i<self.whileView.subviews.count; i++) {
        UIView *view = self.whileView.subviews[i];
        if ([view isKindOfClass:[MyButton class]]) {
            [UIView animateWithDuration:0.3 delay:0.05 options:UIViewAnimationOptionTransitionCurlDown animations:^{
                view.y = 800;
                 [self layoutIfNeeded];
   } completion:^(BOOL finished) {
            }];
        }
    }

    [UIView animateWithDuration:0.7 animations:^{
        self.imageView.y=800;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];

    }];
}
@end

