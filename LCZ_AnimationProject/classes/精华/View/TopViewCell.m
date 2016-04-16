//
//  TopViewCell.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/13.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TopViewCell.h"
#import "TopModel.h"
#import "VideoView.h"
@interface TopViewCell()
//     *  头像
    @property(nonatomic,strong)UIImageView *imageIcon;
//     *  昵称
    @property(nonatomic,strong)UILabel *lableName;
//     *  三个灰点
    @property(nonatomic,strong)UIButton *buttonPoint;
//     *  创建时间
    @property(nonatomic,strong)UILabel *creatTime;

@property(nonatomic,strong)VideoView *videoView;
@end
@implementation TopViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imageIcon=[[UIImageView alloc]init];
        [self.contentView addSubview:_imageIcon];
        
        _lableName=[[UILabel alloc]init];
        _lableName.textAlignment=NSTextAlignmentLeft;
        _lableName.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_lableName];
        
        _buttonPoint=[UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonPoint setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _buttonPoint.titleLabel.textAlignment=NSTextAlignmentCenter;
        [_buttonPoint setTitle:@"..." forState:UIControlStateNormal];
        [self.contentView addSubview:_buttonPoint];
       
        _creatTime=[[UILabel alloc]init];
        _creatTime.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_creatTime];
        
        
        
    }


    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger leftdex=15;
    NSInteger topdex=10;
    _imageIcon.frame=CGRectMake(leftdex, topdex, 30, 30);
    
    _lableName.frame=CGRectMake(leftdex+30+leftdex, 0, LCZViewWidth-leftdex+30+leftdex-30, 30);
    
    _buttonPoint.frame=CGRectMake(LCZViewWidth-30,topdex*2, 30, 30);
    
    _creatTime.frame=CGRectMake(_lableName.x, 40, LCZViewWidth-_lableName.x, 10);

}
-(void)setTopFrame:(TopFrame *)topFrame
{
    _topFrame=topFrame;
    TopModel *topModel=self.topFrame.topic;
    [self.imageIcon setImage:[UIImage imageNamed:topModel.profile_image]];
    self.lableName.text=topModel.name;
    self.creatTime.text=topModel.created_at;
    
    if (topFrame.topic.type==TopicTypeVideo) {
        self.videoView.frame=topFrame.contentViewFrame;
    }




}
-(VideoView *)videoView
{
    if (_videoView==nil) {
        _videoView=[[VideoView alloc]init];
        [self.contentView addSubview:_videoView];
    }

    return _videoView;
}
@end
