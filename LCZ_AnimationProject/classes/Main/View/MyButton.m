//
//  MyButton.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

-(instancetype)initWithFrame:(CGRect)frame
{

    self=[super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    }
    return self;
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat imageH=contentRect.size.height*0.7;
    CGFloat titleH=contentRect.size.height-imageH;

    return CGRectMake(0, imageH, contentRect.size.width, titleH);
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{

    CGFloat imageH=contentRect.size.height*0.7;
    
    return CGRectMake(0, 0, contentRect.size.width, imageH);

}
@end
