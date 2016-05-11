//
//  NetManager+HomeRequest.m
//  HXYFramework
//
//  Created by tmp on 16/5/11.
//  Copyright © 2016年 hxy. All rights reserved.
//

#import "NetManager+HomeRequest.h"

//登录
static NSString * const myPage_UserLogin                        = @"api/user/login";

@implementation NetManager (HomeRequest)

- (void)postUserLoginWithUsername:(NSString *)username
                         Password:(NSString *)password
                          Success:(void (^)())success
                          Failure:(void (^)(NSError *))failure
{
    NSDictionary *params = @{@"username":username, @"password":password};
    
    [HttpManager postJSONWithUrl:Send_Url(Root_Path, myPage_UserLogin) parameters:params progress:nil success:^(NSDictionary *responseObject) {
        
        NSLog(@"%@",responseObject);
        
        
    } fail:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}

@end
