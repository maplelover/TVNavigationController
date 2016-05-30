//
//  TVNavigationBar.m
//  tdc
//
//  Created by zhoujinrui on 15/10/8.
//  Copyright © 2015年 Topvogues. All rights reserved.
//

#import "TVNavigationBar.h"

@interface TVNavigationBar ()

@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation TVNavigationBar
@synthesize shadowColor = _shadowColor;

- (UIView *)findBottomLineWithSuperview:(UIView *)superview
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

- (UIView *)shadowLineView
{
    if (!_bottomLine)
    {
        for (UIView *subview in self.subviews)
        {
            if (subview.frame.size.width == self.frame.size.width)
            {
                _bottomLine = [self findBottomLineWithSuperview:subview];
                if (_bottomLine)
                {
                    break;
                }
            }
        }
        
        NSAssert(_bottomLine, @"View hierarchy changed?");
    }
    
    return _bottomLine;
}

- (UIColor *)shadowColor
{
    if (!_shadowColor)
    {
        _shadowColor = [UIColor clearColor];
    }
    return _shadowColor;
}

- (void)setShadowColor:(UIColor *)shadowColor
{
    if (_shadowColor != shadowColor)
    {
        _shadowColor = shadowColor;
        [self updateShadowColor];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self updateShadowColor];
}

- (void)updateShadowColor
{
    if (_shadowColor)
    {
        self.shadowLineView.backgroundColor = self.shadowColor;
    }
}

@end
