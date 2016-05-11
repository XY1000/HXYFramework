//
//  TabBarController.m
//  HXYFramework
//
//  Created by tmp on 16/5/11.
//  Copyright © 2016年 hxy. All rights reserved.
//

#import "TabBarController.h"

static CGFloat const fontSize = 11;
static long const normalFontColor = 0x000000;
static long const selectFontColor = 0x98BF00;

@implementation TabBarController

+ (void)initialize
{
    if (self == [TabBarController class]){
        
        UITabBarItem *barItem = [UITabBarItem appearance];
        
        // 2.设置TabBarItem
        [barItem setTitlePositionAdjustment:UIOffsetMake(0, -1)];
        
        NSMutableDictionary *normalAttribute = [NSMutableDictionary dictionary];
        
        normalAttribute[NSForegroundColorAttributeName] = [UIColor colorWithHex:normalFontColor andAlpha:1];
        
        normalAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:fontSize];
        
        [barItem setTitleTextAttributes:normalAttribute forState:UIControlStateNormal];
        
        NSMutableDictionary *selectedAttribute = [NSMutableDictionary dictionary];
        
        selectedAttribute[NSForegroundColorAttributeName] = [UIColor colorWithHex:selectFontColor andAlpha:1];
        
        selectedAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:fontSize];
        [barItem setTitleTextAttributes:selectedAttribute forState:UIControlStateSelected];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
