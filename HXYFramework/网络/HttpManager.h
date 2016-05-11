//
//  HttpManager.h
//  HXYFramework
//
//  Created by tmp on 16/5/11.
//  Copyright © 2016年 hxy. All rights reserved.
//

@interface HttpManager : NSObject

//post 请求
+ (void)postJSONWithUrl:(NSString *)urlStr
             parameters:(id)parameters
               progress:(void(^)(NSProgress*))progessValue
                success:(void (^)(NSDictionary* responseObject))success
                   fail:(void (^)(NSError *error))fail;
//get请求
+ (void)getJsonWithUrl:(NSString *)urlStr
            parameters:(id)parameters
              progress:(void(^)(NSProgress*))progessValue
               success:(void (^)(NSDictionary* responseObject))success
                  fail:(void (^)(NSError *error))fail;
//put请求
+ (void)putJsonWithUrl:(NSString *)urlStr
            parameters:(id)parameters
               success:(void (^)(NSDictionary* responseObject))success
                  fail:(void (^)(NSError *error))fail;
//delegate请求
+ (void)deleteJsonWithUrl:(NSString *)urlStr
               parameters:(id)parameters
                  success:(void (^)(NSDictionary* responseObject))success
                     fail:(void (^)(NSError *error))fail;

//上传文件 image/png
+ (void)postMultipartFormRequest:(NSString *)urlStr
                            data:(NSData *)data
                      parameters:(id)parameters
                        progress:(void(^)(NSProgress*))progessValue
                         success:(void (^)(NSDictionary* responseObject))success
                            fail:(void (^)(NSError *error))fail;

//网络连接
+ (void)NetLinkCompletionHandleSuccess:(void(^)())success withFaile:(void(^)())faile;





@end
