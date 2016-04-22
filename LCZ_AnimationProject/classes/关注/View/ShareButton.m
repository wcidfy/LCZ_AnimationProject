//
//  ShareButton.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/22.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "ShareButton.h"

@implementation ShareButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.titleLabel.textColor=[UIColor whiteColor];
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.imageView.contentMode=UIViewContentModeScaleAspectFit;
        [self.titleLabel setFont:[UIFont systemFontOfSize:14]];
    }
    return self;
    
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleH=contentRect.size.height*0.3;
    CGFloat imageH=contentRect.size.height-titleH;
    
    return CGRectMake(0, imageH, contentRect.size.width, titleH);
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat titleH=contentRect.size.height*0.3;
    CGFloat imageH=contentRect.size.height-titleH;
    
    return CGRectMake(0, 0, contentRect.size.width, imageH);
    
}

@end
