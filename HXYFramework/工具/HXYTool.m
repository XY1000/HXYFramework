//
//  HXYTool.m
//  HXYFramework
//
//  Created by tmp on 16/5/11.
//  Copyright © 2016年 hxy. All rights reserved.
//

#import "HXYTool.h"

@implementation HXYTool

+(NSString  *)displayDataStyleWithNumber:(NSString *)timeNumber
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:[timeNumber longLongValue]/1000];
    // NSLog(@"**** == %ld",(long)[timeNumber integerValue]);
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    NSString *dateSMS = [dateFormatter stringFromDate:date1];
    //    NSLog(@"给的时间date****%@",dateSMS);
    
    
    NSDate *now = [NSDate date];
    NSString *dateNow = [dateFormatter stringFromDate:now];
    //当前的时间转为时间戳
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[now timeIntervalSince1970]];
    //计算当前的时间戳和给定得时间戳的差值
    long long int interval = ([timeSp longLongValue] - [timeNumber longLongValue]/1000);
    
    //判断是不是今天
    if ([dateSMS isEqualToString:dateNow]) {
        [dateFormatter setDateFormat:@"HH:mm:ss"];
        if (interval < 60) {
            //秒
            return @"刚刚";
        }else if (interval < 60 * 60){
            //分钟
            return [NSString stringWithFormat:@"%ld分钟前", (NSInteger)interval/60];
        }else  {
            //小时
            return [NSString stringWithFormat:@"%ld小时前", (NSInteger)interval/(60 * 60)];
        }
    }else {
        //不是今天的情况
        //判断是不是昨天
        //条件就是取两天的差值
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"yyyy-MMM-dd";
        //只要年月日
        NSString *dateString = [formatter stringFromDate:date1];
        NSString *nowString = [formatter stringFromDate:[NSDate date]];
        
        //年-月-日
        NSDate *date = [formatter dateFromString:dateString];
        NSDate *now1 = [formatter dateFromString:nowString];
        //取两天之间的差值
        NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
        NSDateComponents *component = [calendar components:unit fromDate:date toDate:now1 options:0];
        if (component.year == 0 && component.month == 0 && component.day ==1) {
            
            [dateFormatter setDateFormat:@"HH:mm:ss"];
            NSString *dateSMS = [dateFormatter stringFromDate:date1];
            NSString *date = [dateSMS substringWithRange:NSMakeRange(0, 5)];
            return  [NSString stringWithFormat:@"昨天 %@", date];
            
        }else{
            
            //  出来今天和昨天剩下两种情况  要么是本周之内 要么是超过了一周
            //  判断是不是本周之内
            //  这里得到的日期是星期的开始日期
            //  下面的到本周的开始日期
            NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian] ;
            [gregorian setFirstWeekday:2]; //monday is first day
            NSDate *now = [NSDate date];
            NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:now];
            NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
            [componentsToSubtract setDay: - ((([components weekday] - [gregorian firstWeekday])+ 7 ) % 7)];
            NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract toDate:now options:0];
            NSDateComponents *componentsStripped = [gregorian components: (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)fromDate: beginningOfWeek];
            NSDateFormatter *hahaformatter1 = [[NSDateFormatter alloc] init];
            // [hahaformatter1 setDateFormat:@"yyyy-MM-dd EEEE HH:mm:ss"];
            [hahaformatter1 setDateFormat:@"EEEE"];
            hahaformatter1.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
            //这里得到的日期是星期的开始日期  //得到星期的第一天的信息
            beginningOfWeek = [gregorian dateFromComponents: componentsStripped];
            
            NSString *begintimeSp = [NSString stringWithFormat:@"%ld", (long)[beginningOfWeek timeIntervalSince1970]];
            NSString *judgetimeSp1 = [NSString stringWithFormat:@"%ld", (long)[date1 timeIntervalSince1970]];
            
            //比较这周开始的一天的日期和即将判定的也就是给定的日期的先后
            //date1是给定的即将判定的某一天
            if ([begintimeSp intValue]>[judgetimeSp1 intValue]) {
                //   NSLog(@"直接显示年月日");
                //超过了一周 不是本周内  在本周之前
                //这里超过了一周
                [dateFormatter setDateFormat:@"YYYY-MM-dd"];
                NSString *dateSMS = [dateFormatter stringFromDate:date1];
                NSString *dateStr = [NSString stringWithFormat:@"%@",dateSMS];
                return dateStr;
            }else{
                //是本周则直接显示的星期
                [dateFormatter setDateFormat:@"EEEE"];
                NSString *dateSMS = [dateFormatter stringFromDate:date1];
                NSString *dateStr = [NSString stringWithFormat:@"%@",dateSMS];
                if ([dateStr isEqualToString:@"Monday"]) {
                    return @"星期一";
                }else if ([dateStr isEqualToString:@"Tuesday"]){
                    return @"星期二";
                }else if ([dateStr isEqualToString:@"Wednesday"]){
                    return @"星期三";
                }else if ([dateStr isEqualToString:@"Thursday"]){
                    return @"星期四";
                }else if ([dateStr isEqualToString:@"Friday"]){
                    return @"星期五";
                }
                return dateStr;
            }
            
        }
        
    }
    
}

+ (NSString *)TimestampConversionWithNumber:(NSString *)timeNumber withType:(DateStyle)type {
    //@"yyyy-MM-dd HH:mm:ss"
    NSMutableString *formtStr = [NSMutableString string];
    
    if (type & DateStyleYear) {
        
        if (type & DateStyleMonth) {
            
             [formtStr appendString:@"yyyy-"];
            
        }else {
             [formtStr appendString:@"yyyy"];
        }
        
    }
    
    if (type & DateStyleMonth) {
      
        if (type & DateStyleDate) {
            
            [formtStr appendString:@"MM-"];
            
        }else {
            
            [formtStr appendString:@"MM"];
        }
        
        
        if ((!(type & DateStyleDate))&&((type & DateStyleHour) || (type & DateStyleMinute) || (type & DateStyleSecond))) {
            
            [formtStr appendString:@" "];
        }
        
    }
    
    if (type & DateStyleDate) {
       
        [formtStr appendString:@"dd"];
        
        if ((type & DateStyleHour) || (type & DateStyleMinute) || (type & DateStyleSecond)) {
            
            [formtStr appendString:@" "];
        }
        
    }
    
    if (type & DateStyleHour) {
        
        if (type & DateStyleMinute) {
            
            [formtStr appendString:@"HH:"];
            
        }else {
            
            [formtStr appendString:@"HH"];
        }
        
    }
    
    if (type & DateStyleMinute) {
        
        if (type & DateStyleSecond) {
            
            [formtStr appendString:@"mm:"];
        }else {
            [formtStr appendString:@"mm"];
        }
        
    }
    
    if (type & DateStyleSecond) {
        
        [formtStr appendString:@"ss"];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    NSDate *starttime =[NSDate dateWithTimeIntervalSince1970:timeNumber.integerValue];
    [formatter setDateFormat:formtStr];
    NSString *startDateString = [formatter stringFromDate:starttime];
    
    return startDateString;
}


@end
