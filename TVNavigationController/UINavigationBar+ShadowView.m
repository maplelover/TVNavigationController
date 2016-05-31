//
//  UINavigationBar+ShadowView.m
//  TVTest
//
//  Created by zhoujinrui on 16/5/31.
//  Copyright © 2016年 zhoujinrui. All rights reserved.
//

#import "UINavigationBar+ShadowView.h"

@implementation UINavigationBar (ShadowView)

- (UIView *)findShadowViewWithSuperview:(UIView *)superview
{
    UIView *ret = nil;
    for (UIView *subview in superview.subviews)
    {
        if (subview.frame.origin.y >= superview.frame.size.height
            && subview.frame.size.height < 1
            && [subview isKindOfClass:[UIImageView class]])
        {
            ret = subview;
            break;
        }
    }
    return ret;
}

- (UIView *)findShadowView
{
    UIView *ret = nil;
    
    for (UIView *subview in self.subviews)
    {
        if (subview.frame.size.width == self.frame.size.width)
        {
            ret = [self findShadowViewWithSuperview:subview];
            if (ret)
            {
                break;
            }
        }
    }
    
    NSAssert(ret, @"View hierarchy changed?");
    return ret;
}

@end
