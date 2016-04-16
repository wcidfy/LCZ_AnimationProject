//
//  recomTool.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/13.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "recomTool.h"
#import "HttpTool.h"
#import "TopModel.h"
#import "MJExtension.h"

@implementation recomTool
+(void)getCommentsWithID:(NSString *)ID block:(void (^)(id, id))block {
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"dataList";
    params[@"c"] = @"comment";
    params[@"data_id"] = ID;
    params[@"hot"] = @"1";
//    [HttpTool get:BaseURL parameters:params success:^(id json) {
//        
//        // 如果没有数据
//        if (![json isKindOfClass:[NSDictionary class]]) {
//            return;
//        }
//        //最热评论
//        NSArray *hotCommentArray = [XFCommentModel mj_objectArrayWithKeyValuesArray:json[@"hot"]];
//        
//        //最新评论
//        NSArray *lastestCommentArray = [XFCommentModel mj_objectArrayWithKeyValuesArray:json[@"data"]];
//        block(hotCommentArray,lastestCommentArray);
//        
//    } failure:^(NSError *error) {
//        nil;
//    }];
    [HttpTool GET:BaseURL parameters:params success:^(id responseObject) {
        
//         如果没有数据
                if (![responseObject isKindOfClass:[NSDictionary class]]) {
                    return;
                }
                //最热评论
                NSArray *hotCommentArray = [XFCommentModel mj_objectArrayWithKeyValuesArray:responseObject[@"hot"]];
        
                //最新评论
                NSArray *lastestCommentArray = [XFCommentModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
                block(hotCommentArray,lastestCommentArray);
    } failure:^(NSError *error) {
        
    }];
}

+(void)getDataWithArrayType:(TopicType)type parameterA:(NSString *)parameterA block:(void (^)(id json,id param))block {
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = parameterA;
    params[@"c"] = @"data";
    params[@"type"] = @(type);
    

    
    [HttpTool GET:BaseURL parameters:params success:^(id responseObject) {
        NSArray *talekArray = [TopModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
                NSString *maxTime = responseObject[@"info"][@"maxtime"];
                block(talekArray,maxTime);

    } failure:^(NSError *error) {
        
    }];
}



@end
