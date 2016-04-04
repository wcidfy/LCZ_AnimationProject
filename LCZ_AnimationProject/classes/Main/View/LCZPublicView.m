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
      
        
    }


    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
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

