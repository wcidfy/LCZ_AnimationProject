//
//  VideoView.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/16.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "VideoView.h"
#import "UIImageView+WebCache.h"
@implementation VideoView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
//        视频大图
        _imageView=[[UIImageView alloc]init];
        [self addSubview:_imageView];
//        播放按钮
        _playButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_playButton setBackgroundImage:[UIImage imageNamed:@"play-voice-stop"] forState:UIControlStateNormal];
        [_playButton setBackgroundImage:[UIImage imageNamed:@"play-voice-bgN"] forState:UIControlStateHighlighted];
        [_playButton setBackgroundImage:[UIImage imageNamed:@"play-voice-bg"] forState:UIControlStateSelected];

        [self addSubview:_playButton];
//        播放总数
        _lablePlayNum=[[UILabel alloc]init];
        [self addSubview:_lablePlayNum];
//        播放时长
        _lablePlayTime=[[UILabel alloc]init];
        [self addSubview:_lablePlayTime];
        
        
    }

    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _playButton.frame=CGRectMake(_imageView.centerX-20, _imageView.centerY-20, 40, 40);
    _lablePlayNum.frame=CGRectMake(_imageView.x, _imageView.height-30, self.bounds.size.width-40, 30);
    _lablePlayTime.frame=CGRectMake(_imageView.width-40,  _imageView.height-30, 40, 30);


}
-(void)setTopModel:(TopModel *)topModel
{
    _topModel=topModel;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_topModel.middle_image]];
    self.lablePlayNum.text=[NSString stringWithFormat:@"%ld",(long)_topModel.playcount];
    self.lablePlayTime.text=[NSString stringWithFormat:@"%ld",_topModel.voicetime];
    

}
@end
