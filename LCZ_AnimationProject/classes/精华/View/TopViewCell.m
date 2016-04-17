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
#import "BottonCell.h"
#import "UIImageView+WebCache.h"
#import "XFUserModel.h"

@interface TopViewCell()
//     *  头像
    @property(nonatomic,strong)UIImageView *imageIcon;
//     *  昵称
    @property(nonatomic,strong)UILabel *lableName;
//     *  三个灰点
    @property(nonatomic,strong)UIButton *buttonPoint;
//     *  创建时间
    @property(nonatomic,strong)UILabel *creatTime;
//     *  正文
    @property(nonatomic,strong)UILabel *lableText;
//     *  最热评论
    @property(nonatomic,strong)UIView *hotView;
    @property(nonatomic,strong)UILabel *hotTile;
    @property(nonatomic,strong)UILabel *hotLable;




@property(nonatomic,strong)VideoView *videoView;
@property(nonatomic,strong)BottonCell *bottonCell;
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
        [_buttonPoint setBackgroundImage:[UIImage imageNamed:@"cellmorebtnnormal"] forState:UIControlStateNormal];
        [_buttonPoint setBackgroundImage:[UIImage imageNamed:@"cellmorebtnclick"] forState:UIControlStateHighlighted];
        [self.contentView addSubview:_buttonPoint];
       
        _creatTime=[[UILabel alloc]init];
        _creatTime.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_creatTime];
        
        _lableText=[[UILabel alloc]init];
        _lableText.textColor=[UIColor lightGrayColor];
        _lableText.lineBreakMode=NSLineBreakByTruncatingTail;
        _lableText.font=[UIFont systemFontOfSize:14];
        _lableText.numberOfLines = 0;
        [self.contentView addSubview:_lableText];
        
//        _buttonDing=[[UIButton alloc]init]
        
        _hotView=[[UIView alloc]init];
        [self.contentView addSubview:_hotView];
        _hotTile=[[UILabel alloc]init];
        _hotTile.text=@"最热评价";
        _hotTile.textColor=[UIColor grayColor];
        [_hotView addSubview:_hotTile];
        _hotLable=[[UILabel alloc]init];
        _hotLable.font=[UIFont systemFontOfSize:14];
        [_hotView addSubview:_hotLable];
        
    }


    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger leftdex=15;
    NSInteger topdex=10;
    _imageIcon.frame=CGRectMake(leftdex, topdex, 40, 40);
    
    _lableName.frame=CGRectMake(leftdex+40+leftdex, 0, LCZViewWidth-leftdex+30+leftdex-40, 30);
    
    _buttonPoint.frame=CGRectMake(LCZViewWidth-40,topdex*2, 30, 30);
    
    _creatTime.frame=CGRectMake(_lableName.x, 35, LCZViewWidth-_lableName.x, 15);
    



}
-(void)setTopFrame:(TopFrame *)topFrame
{
    
    _topFrame=topFrame;
    TopModel *topModel=self.topFrame.topic;
    CGFloat textH =10+ [topModel.text boundingRectWithSize:CGSizeMake(LCZViewWidth-30 , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
    _lableText.frame=CGRectMake(15,60, LCZViewWidth-30, textH);
    [self.imageIcon sd_setImageWithURL:[NSURL URLWithString:topModel.profile_image]];
    self.lableName.text=topModel.name;
    self.creatTime.text=topModel.created_at;
    self.lableText.text=topModel.text;
    
    if (topFrame.topic.type==TopicTypeVideo) {
        self.videoView.topModel=topModel;
        self.videoView.frame=_topFrame.contentViewFrame;
        self.videoView.backgroundColor=[UIColor redColor];
        
       
    }
    NSLog(@"____%d",topModel.ding);
   
    
    if (topModel.top_cmt) {
        NSString *content = [NSString stringWithFormat:@"%@ : %@", topModel.top_cmt.user.username, topModel.top_cmt.content];
        CGFloat topcmtContentH = [content boundingRectWithSize:CGSizeMake(LCZViewWidth-30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
        self.hotView.frame=CGRectMake(15,topFrame.contentViewFrame.size.height+50+textH, LCZViewWidth-30, topcmtContentH+20);
        self.hotView.backgroundColor=[UIColor redColor];
        self.hotLable.frame=CGRectMake(0, 20, LCZViewWidth-30, topcmtContentH);
        
        self.hotLable.text=[NSString stringWithFormat:@"%@ : %@", topModel.top_cmt.user.username, topModel.top_cmt.content];
     
    }else
    {
        self.hotView.hidden=YES;
    
    }

    self.bottonCell.frame=CGRectMake(0, self.topFrame.cellHeight-50, self.width, 50);
    [self.bottonCell.buttonDing setTitle:[NSString stringWithFormat:@"  %ld",(long)topModel.ding] forState:UIControlStateNormal];
    [self.bottonCell.buttonCai setTitle:[NSString stringWithFormat:@"  %ld",(long)topModel.cai] forState:UIControlStateNormal];
    [self.bottonCell.buttonForward setTitle:[NSString stringWithFormat:@"  %ld",(long)topModel.repost] forState:UIControlStateNormal];
    [self.bottonCell.buttonAnswer setTitle:[NSString stringWithFormat:@"  %ld",(long)topModel.comment] forState:UIControlStateNormal];
}
-(VideoView *)videoView
{
    if (_videoView==nil) {
        _videoView=[[VideoView alloc]init];
        [self.contentView addSubview:_videoView];
    }

    return _videoView;
}
-(BottonCell *)bottonCell
{
    if (_bottonCell==nil) {
        _bottonCell=[[BottonCell alloc]init];
        [self.contentView addSubview:_bottonCell];
    }
    return _bottonCell;

}
@end
