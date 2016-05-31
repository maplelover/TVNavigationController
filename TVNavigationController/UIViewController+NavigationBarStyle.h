//
//  UIViewController+NavigationBarStyle.h
//  TVTest
//
//  Created by zhoujinrui on 16/5/31.
//  Copyright © 2016年 zhoujinrui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavigationBarStyle)

/// 导航栏是否透明，默认不透明
@property (nonatomic, getter=isNavigationBarTransparent) IBInspectable BOOL navigationBarTransparent;

/// 导航栏标题、按钮颜色
@property (nonatomic, strong) IBInspectable UIColor *navigationBarColor;

/// 导航栏背景颜色
@property (nonatomic, strong) IBInspectable UIColor *navigationBarTintColor;

@end
