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
@end
@implementation LCZPublicView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        _imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"app_slogan"]];
        [self addSubview:_imageView];
        
    }


    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _imageView.frame=CGRectMake(20, self.bounds.size.height*0.2,self.bounds.size.width-40, 20);
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"发链接"];
    for (NSInteger i=0; i<images.count; i++) {
        MyButton *Butt=[MyButton buttonWithType:UIButtonTypeCustom];
        [Butt setImage:[UIImage imageNamed:images[0]] forState:UIControlStateNormal];
        [Butt setTitle:titles[0] forState:UIControlStateNormal];
        [self addSubview:Butt];


}
}
@end

