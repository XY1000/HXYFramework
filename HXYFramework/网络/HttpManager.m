//
//  HttpManager.m
//  HXYFramework
//
//  Created by tmp on 16/5/11.
//  Copyright © 2016年 hxy. All rights reserved.
//

#import "HttpManager.h"

static AFHTTPSessionManager *manager = nil;

@implementation HttpManager

+ (AFHTTPSessionManager *)sharedAFManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        //如果需要@"text/plain"  此处添加
        //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
        
        // 设置超时时间
        // [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        // manager.requestSerializer.timeoutInterval = 10.f;
        // [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        
        // 设置返回格式
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        

        
        //设置请求头 不一定所有方法都用到（谁用到谁设置）
        //[manager.requestSerializer setValue:phone forHTTPHeaderField:cellphone];
        
    });
    return manager;
}


+ (void)postJSONWithUrl:(NSString *)urlStr parameters:(id)parameters progress:(void(^)(NSProgress*))progessValue success:(void (^)(NSDictionary* responseObject))success fail:(void (^)(NSError *))fail
{
    manager = [self sharedAFManager];
    
    [manager POST:urlStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progessValue) {
            
             progessValue(uploadProgress);
        }
       
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSDictionary *jsonObject=[NSJSONSerialization
                                      JSONObjectWithData:responseObject
                                      options:NSJSONReadingMutableLeaves
                                      error:nil];
            success(jsonObject);
           
            }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
        }
    }];
    
}

+ (void)getJsonWithUrl:(NSString *)urlStr
            parameters:(id)parameters
              progress:(void(^)(NSProgress*))progessValue
               success:(void (^)(NSDictionary* responseObject))success
                  fail:(void (^)(NSError *error))fail{
    
    manager = [self sharedAFManager];

    [manager GET:urlStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
       
        if (progessValue) {
            
            progessValue(downloadProgress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSDictionary *jsonObject=[NSJSONSerialization
                                      JSONObjectWithData:responseObject
                                      options:NSJSONReadingMutableLeaves
                                      error:nil];
            success(jsonObject);
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (fail) {
            fail(error);
        }
    }];
}

+ (void)putJsonWithUrl:(NSString *)urlStr
            parameters:(id)parameters
               success:(void (^)(NSDictionary* responseObject))success
                  fail:(void (^)(NSError *error))fail{
    
    manager = [self sharedAFManager];

    [manager PUT:urlStr parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSDictionary *jsonObject=[NSJSONSerialization
                                      JSONObjectWithData:responseObject
                                      options:NSJSONReadingMutableLeaves
                                      error:nil];
           
            success(jsonObject);
            
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (fail) {
            fail(error);
        }
    }];
    
}

+ (void)deleteJsonWithUrl:(NSString *)urlStr
               parameters:(id)parameters
                  success:(void (^)(NSDictionary* responseObject))success
                     fail:(void (^)(NSError *error))fail{
    
    manager = [self sharedAFManager];

    [manager DELETE:urlStr parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSDictionary *jsonObject=[NSJSONSerialization
                                      JSONObjectWithData:responseObject
                                      options:NSJSONReadingMutableContainers
                                      error:nil];
            
            success(jsonObject);
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      
        if (fail) {
            fail(error);
        }
    }];
}

+(void)postMultipartFormRequest:(NSString *)urlStr
                           data:(NSData *)data
                     parameters:(id)parameters
                       progress:(void(^)(NSProgress*))progessValue
                        success:(void (^)(NSDictionary *))success
                           fail:(void (^)(NSError *))fail{
    
    manager = [self sharedAFManager];

    [manager POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:@"file" fileName:@"headImage" mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progessValue) {
            progessValue(uploadProgress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSDictionary *jsonObject=[NSJSONSerialization
                                      JSONObjectWithData:responseObject
                                      options:NSJSONReadingMutableContainers
                                      error:nil];
          
            success(jsonObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      
        if (fail) {
            fail(error);
        }
    }];
}

+ (void)NetLinkCompletionHandleSuccess:(void (^)())success withFaile:(void (^)())faile{
    AFNetworkReachabilityManager * manger = [AFNetworkReachabilityManager sharedManager];
    [manger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == AFNetworkReachabilityStatusNotReachable) {
            faile();
        }else{
            success();
        }
    }];
    [manger startMonitoring];
}



@end
