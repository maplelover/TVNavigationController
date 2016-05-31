//
//  TVNavigationBar.m
//  tdc
//
//  Created by zhoujinrui on 15/10/8.
//  Copyright © 2015年 Topvogues. All rights reserved.
//

#import "TVNavigationBar.h"
#import "UINavigationBar+ShadowView.h"

@interface TVNavigationBar ()

@property (nonatomic, strong) UIView *shadowView;

@end

@implementation TVNavigationBar

- (UIView *)shadowView
{
    if (!_shadowView)
    {
        _shadowView = [self findShadowView];
    }
    
    return _shadowView;
}

- (void)setShadowColor:(UIColor *)shadowColor
{
    if (_shadowColor != shadowColor)
    {
        _shadowColor = shadowColor;
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_shadowColor)
    {
        self.shadowView.backgroundColor = _shadowColor;
    }
}

@end
