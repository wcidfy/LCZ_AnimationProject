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
    NSString * timestamp = [[NSString alloc] initWithFormat:@"%ld",(long)[NSDate timeIntervalSinceReferenceDate]];
    NSString * nonce = [NSString stringWithFormat:@"%d",arc4random()];
    NSString * appkey = @"ik1qhw091mi8p";
    NSString * Signature = [NSString stringWithFormat:@"%@%@%@",appkey,nonce,timestamp] ;//用sha1对签名进行加密,随你用什么方法,MD5...
    //以下拼接请求内容
    [mgr.requestSerializer setValue:appkey forHTTPHeaderField:@"App-Key"];
    [mgr.requestSerializer setValue:nonce forHTTPHeaderField:@"Nonce"];
    [mgr.requestSerializer setValue:timestamp forHTTPHeaderField:@"Timestamp"];
    [mgr.requestSerializer setValue:Signature forHTTPHeaderField:@"Signature"];
    [mgr.requestSerializer setValue:@"o8knCANPiO" forHTTPHeaderField:@"appSecret"];
    [mgr.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
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
