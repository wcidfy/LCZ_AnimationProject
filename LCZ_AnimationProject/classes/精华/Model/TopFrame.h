//
//  TopFrame.h
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/13.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TopModel.h"
@interface TopFrame : NSObject
@property(nonatomic,strong)TopModel *topic;
@property(nonatomic,assign)CGFloat cellHeight;
@property (assign, nonatomic) CGRect  contentViewFrame;//图片或视频或声音内容尺寸

@end
