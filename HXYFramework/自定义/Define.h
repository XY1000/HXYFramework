//
//  Define.h
//  HXYFramework
//
//  Created by tmp on 16/5/11.
//  Copyright © 2016年 hxy. All rights reserved.
//

#ifndef Define_h
#define Define_h

//屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//NSUserDefaults
#define GetObjectUserDefault(key)     [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define SetObjectUserDefault(object, key) [[NSUserDefaults standardUserDefaults] setObject:object forKey:key]

//判断字符串是否为空
#define STR_IS_NIL(objStr) ([objStr isKindOfClass:[NSNull class]] || objStr == nil || [objStr length] <= 0)


//缩放比(以设计图是iPhone 6为基准)
static CGFloat const ScalWidth = SCREEN_WIDTH / 375.0f;
static CGFloat const ScalHeight = SCREEN_HEIGHT / 667.0f;

#endif /* Define_h */
