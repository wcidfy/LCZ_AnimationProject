//
//  recomTool.h
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/13.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  推荐获取请求封装
 */
@interface recomTool : NSObject
+(void)getCommentsWithID:(NSString *)ID block:(void (^)(id json1,id json2))block;

+(void)getDataWithArrayType:(TopicType)type parameterA:(NSString *)parameterA block:(void (^)(id json,id param))block ;
@end
