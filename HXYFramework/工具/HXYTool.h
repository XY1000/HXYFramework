//
//  HXYTool.h
//  HXYFramework
//
//  Created by tmp on 16/5/11.
//  Copyright © 2016年 hxy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, DateStyle) {
    DateStyleYear = 1 << 0,     //年
    DateStyleMonth = 1 << 1,    //月
    DateStyleDate = 1 << 2,     //日
    DateStyleHour = 1 << 3,     //小时
    DateStyleMinute = 1 << 4,   //分钟
    DateStyleSecond = 1 << 5    //秒
};


@interface HXYTool : NSObject

/**
 *  距离当前时间的距离
 *
 *  @param timeNumber 时间
 *
 *  @return 返回离现在的时间差 （刚刚，几分钟前，几小时前，昨天，要是本周内就显示是周几，其他就是转成某年某月）
 */
+ (NSString  *)displayDataStyleWithNumber:(NSString *)timeNumber;


/**
 *
 *  时间戳的转换
 *
 *  @param timeNumber 时间
 *  @param type       时间转化的样式（例如：年月日 DateStyleYear|DateStyleMonth|DateStyleDate）
 *
 */
+ (NSString *)TimestampConversionWithNumber:(NSString *)timeNumber withType:(DateStyle)type;


@end
