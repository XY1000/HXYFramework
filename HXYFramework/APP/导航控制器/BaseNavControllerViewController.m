//
//  BaseNavControllerViewController.m
//  HXYFramework
//
//  Created by tmp on 16/5/11.
//  Copyright © 2016年 hxy. All rights reserved.
//

#import "BaseNavControllerViewController.h"

static long const barColor = 0xAAAAAA;
static long const titleColor = 0x000000;
static CGFloat const fontSize = 18;

@implementation BaseNavControllerViewController

+ (void)initialize
{
    if (self == [BaseNavControllerViewController class]) { // 肯定能保证只调用一次
        
        // 0.获取导航条外观
        UINavigationBar *bar = [UINavigationBar appearance];
        
        // 1.设置背景图
        //UIImage *navImage = [UIImage imageNamed:@"topbarbg_ios7"];
        //[bar setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
        
        // 2.设置背景色
        [bar setBarTintColor:[UIColor colorWithHex:barColor andAlpha:1]];
        
        // 3.设置左右按钮的文字颜色
        [bar setTintColor:[UIColor colorWithHex:titleColor andAlpha:1]];
        
        // 4.设置导航栏样式，从而影响状态栏的文字颜色
        [bar setBarStyle:UIBarStyleBlack];
        
        // 5.设置返回按钮的箭头样式
        [bar setTitleVerticalPositionAdjustment:0 forBarMetrics:UIBarMetricsDefault];
        
        // 6.设置标题栏文字的样式
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSForegroundColorAttributeName] = [UIColor colorWithHex:titleColor andAlpha:1];
        attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:fontSize];
        [bar setTitleTextAttributes:attributes];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBarItem.selectedImage = [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
