//
//  UIViewController+NavigationBarStyle.m
//  TVTest
//
//  Created by zhoujinrui on 16/5/31.
//  Copyright © 2016年 zhoujinrui. All rights reserved.
//

#import "UIViewController+NavigationBarStyle.h"
#import <objc/runtime.h>

static char const * kNavigationBarStyleKey      = 0;
static char const * kNavigationBarColorKey      = 0;
static char const * kNavigationBarTintColorKey  = 0;

@implementation UIViewController (NavigationBarStyle)

- (BOOL)isNavigationBarTransparent
{
    return [objc_getAssociatedObject(self, &kNavigationBarStyleKey) boolValue];
}

- (void)setNavigationBarTransparent:(BOOL)navigationBarTransparent
{
    objc_setAssociatedObject(self, &kNavigationBarStyleKey, @(navigationBarTransparent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)navigationBarColor
{
    return objc_getAssociatedObject(self, &kNavigationBarColorKey);
}

- (void)setNavigationBarColor:(UIColor *)navigationBarColor
{
    objc_setAssociatedObject(self, &kNavigationBarColorKey, navigationBarColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)navigationBarTintColor
{
    return objc_getAssociatedObject(self, &kNavigationBarTintColorKey);
}

- (void)setNavigationBarTintColor:(UIColor *)navigationBarTintColor
{
    objc_setAssociatedObject(self, &kNavigationBarTintColorKey, navigationBarTintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
