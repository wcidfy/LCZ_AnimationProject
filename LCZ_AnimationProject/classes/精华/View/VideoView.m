//
//  VideoView.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/16.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "VideoView.h"
#import "UIImageView+WebCache.h"
#import "KRVideoPlayerController.h"
@interface VideoView()
@property(nonatomic,strong)KRVideoPlayerController *krVideoPlayController;
@end
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
        [_playButton setBackgroundImage:[UIImage imageNamed:@"video-play"] forState:UIControlStateNormal];
        [_playButton addTarget:self action:@selector(playButtonClick:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:_playButton];
//        播放总数
        _lablePlayNum=[[UILabel alloc]init];
        _lablePlayNum.textColor=[UIColor grayColor];
        [self addSubview:_lablePlayNum];
//        播放时长
        _lablePlayTime=[[UILabel alloc]init];
        _lablePlayTime.textColor=[UIColor grayColor];
        _lablePlayTime.textAlignment=NSTextAlignmentRight;
        [self addSubview:_lablePlayTime];
        
        
    }

    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _imageView.frame=self.bounds;
    _playButton.frame=CGRectMake(_imageView.centerX-25, _imageView.centerY-25, 50, 50);
    _lablePlayNum.frame=CGRectMake(_imageView.x, _imageView.height-30, self.bounds.size.width-40, 30);
    _lablePlayTime.frame=CGRectMake(_imageView.width-60,  _imageView.height-30, 60, 30);


}
-(void)setTopModel:(TopModel *)topModel
{
    _topModel=topModel;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_topModel.middle_image]];

    self.lablePlayNum.text=[NSString stringWithFormat:@"%ld",(long)_topModel.playcount];
    self.lablePlayTime.text=[NSString stringWithFormat:@"%2d:%02d",_topModel.voicetime/60,_topModel.videotime % 60];
    NSLog(@"______%@",self.lablePlayTime.text);

}
-(void)playButtonClick:(UIButton *)sender
{

    NSLog(@"1213");
    [self PlayWithUrl:[NSURL URLWithString:self.topModel.videouri]];
    [self addSubview:self.krVideoPlayController.view];

}
-(void)PlayWithUrl:(NSURL *)url
{
    if (_krVideoPlayController==nil) {
        _krVideoPlayController=[[KRVideoPlayerController alloc]initWithFrame:self.imageView.bounds];
        __weak typeof (self)weakSelf=self;
        [self.krVideoPlayController setDimissCompleteBlock:^{
            weakSelf.krVideoPlayController=nil;
        }];
    }

    self.krVideoPlayController.contentURL=url;
}
//停止视频的播放
- (void)reset {
    [self.krVideoPlayController dismiss];
    self.krVideoPlayController = nil;
}

@end
