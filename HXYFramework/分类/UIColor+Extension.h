//
//  UIColor+Extension.h
//  TestCustomNavigation
//
//  Created by xiaoz on 15/9/17.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+ (UIColor *) colorWith255Red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha;

+ (UIColor *) colorWithHex:(long)hex andAlpha:(float)alpha;

@end
