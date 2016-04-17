//
//  TopFrame.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/13.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TopFrame.h"
#import "XFUserModel.h"
static CGFloat avatarMaxY = 50;
static CGFloat inset = 10;
static CGFloat toolBarHeight = 50;
static CGFloat textX = 14;
static CGFloat topCmtH = 20;
@implementation TopFrame
-(void)setTopic:(TopModel *)topic

{
    _topic=topic;
    CGFloat textW = SCREEN_WIDTH - 28;
    CGFloat textH = 10+[topic.text boundingRectWithSize:CGSizeMake(textW , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
    //最大的Y值
    CGFloat maxY = avatarMaxY + inset*2 + textH ;
    if (topic.type != TopicTypeTalk) {
        CGFloat contentViewX = textX;
        CGFloat contentViewY = maxY;
        CGFloat contentViewW = textW;
        CGFloat widthScale = topic.width / contentViewW;
        CGFloat contentViewH = topic.height / widthScale;
        if (topic.type == TopicTypeVideo && contentViewH > 250) {
            contentViewH = 250;
            topic.bigImage = YES;
        }if (contentViewH > 1500) {
            contentViewH = 300;
            topic.bigImage = YES;
        }
        self.contentViewFrame = CGRectMake(contentViewX, contentViewY, contentViewW, contentViewH);
        
        maxY = contentViewY + contentViewH + inset;
        
    }
    //如果有热门评论
    if(topic.top_cmt){
        
        NSString *content = [NSString stringWithFormat:@"%@ : %@", topic.top_cmt.user.username, topic.top_cmt.content];
        CGFloat topcmtContentH = [content boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil].size.height;
        
        maxY = topcmtContentH + topCmtH + maxY + inset;
        
    }
    
    
    //设置cell的高度
    self.cellHeight = maxY + toolBarHeight;
}
@end
