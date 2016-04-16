//
//  TopModel.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/13.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TopModel.h"
#import "MJExtension.h"
@implementation TopModel
+(NSDictionary*)mj_replacedKeyFromPropertyName
{
    return @{
             @"small_image" : @"image0",
             @"large_image" : @"image1",
             @"middle_image" : @"image2",
             @"ID" : @"id",
             @"top_cmt" : @"top_cmt[0]"
             };


}

@end
