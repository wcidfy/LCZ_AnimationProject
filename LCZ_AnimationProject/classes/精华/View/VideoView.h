//
//  VideoView.h
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/16.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopModel.h"

@interface VideoView : UIView
/**
 *  video 图片
 */
@property(nonatomic,strong)UIImageView *imageView;
/**
 *  点击按钮
 */
@property(nonatomic,strong)UIButton *playButton;
/**
 *  播放总数
 */
@property(nonatomic,strong)UILabel *lablePlayNum;
/**
 *  播放时长
 */
@property(nonatomic,strong)UILabel *lablePlayTime;

@property(nonatomic,strong)TopModel *topModel;


@end
