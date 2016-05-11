//
//  NetManager.h
//  HXYFramework
//
//  Created by tmp on 16/5/11.
//  Copyright © 2016年 hxy. All rights reserved.
//

#import "HttpManager.h"

#define Root_Path  @"http://121.42.192.12"
#define Send_Url(rootPath,path) [NSString stringWithFormat:@"%@/%@", rootPath,path]

@interface NetManager : NSObject

+(instancetype)sharedInstance;

@end
