//
//  NetManager+HomeRequest.h
//  HXYFramework
//
//  Created by tmp on 16/5/11.
//  Copyright © 2016年 hxy. All rights reserved.
//

#import "NetManager.h"

@interface NetManager (HomeRequest)

- (void)postUserLoginWithUsername:(NSString *)username
                         Password:(NSString *)password
                          Success:(void(^)())success
                          Failure:(void(^)(NSError *error))failure;
@end
