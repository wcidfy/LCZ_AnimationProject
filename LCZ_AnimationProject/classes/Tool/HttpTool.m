//
//  HttpTool.m
//  zzzzz
//
//  Created by lxx on 16/1/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"
@implementation HttpTool
+(void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure
{
//    / 创建请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    [mgr GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success)
        {
        success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
    }];
}
+(void )Post:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure
{
    //    / 创建请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    [mgr POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];


}
@end
