//
//  UIButton+HXY.m
//  inject
//
//  Created by tmp on 16/3/28.
//  Copyright © 2016年 hxy. All rights reserved.
//

#import "UIButton+HXY.h"
#import <objc/runtime.h>

static void *temTime;
static BOOL isOK = true;
@implementation UIButton (HXY)

- (void)setSpaceTime:(CGFloat)spaceTime {
    
    NSNumber *num = @(spaceTime);
    objc_setAssociatedObject(self, temTime, num, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (CGFloat)spaceTime {
    
    NSNumber *num = objc_getAssociatedObject(self, temTime);
    return num.floatValue;
    
}

+ (void)load {
    
    Method systemMethod = class_getInstanceMethod([self class], @selector(sendAction:to:forEvent:));
    Method cutomMethod  = class_getInstanceMethod([self class], @selector(HXYbtnClickWithAction:to:forEvent:));
    
    BOOL isCreat = class_addMethod(self , @selector(sendAction:to:forEvent:), method_getImplementation(cutomMethod), method_getTypeEncoding(cutomMethod));
    
 
    if (isCreat) {
        
       
        class_replaceMethod(self, @selector(HXYbtnClickWithAction:to:forEvent:), method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
        
    }else {
        
       method_exchangeImplementations(systemMethod, cutomMethod);

    }

    
}
- (void)HXYbtnClickWithAction:(SEL)action  to:(id)target forEvent:(UIEvent *)event {
    
    
    
    
    
    if (isOK) {
        
        isOK = false;
        
        [self performSelector:@selector(resetData) withObject:nil afterDelay:self.spaceTime];
        
        [self HXYbtnClickWithAction:action to:target forEvent:event];
        
    }
    
   
}

- (void)resetData {
    
    isOK = true;
    
}

@end
