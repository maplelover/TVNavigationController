//
//  TVNavigationController.m
//  TVTest
//
//  Created by zhoujinrui on 16/5/30.
//  Copyright © 2016年 zhoujinrui. All rights reserved.
//

#import "TVNavigationController.h"
#import "TVNavigationBar.h"

@interface TVNavigationController ()

@property (nonatomic, getter=isBarTransparent) BOOL barTransparent;

@end

@implementation TVNavigationController

+ (void)initialize
{
    if (self == [TVNavigationController class])
    {
        UINavigationBar *navigationBar = [UINavigationBar appearance];
        navigationBar.tintColor = [UIColor whiteColor];

        navigationBar.titleTextAttributes = @{
              NSForegroundColorAttributeName: [UIColor whiteColor],
              NSFontAttributeName: [UIFont boldSystemFontOfSize:18]
              };

        NSDictionary *barItemAttributes = @{
            NSFontAttributeName: [UIFont systemFontOfSize:16]
            };
        [[UIBarButtonItem appearance] setTitleTextAttributes:barItemAttributes
                                                    forState:UIControlStateNormal];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.barTransparent = [self.topViewController isNavigationBarTransparent];
}

#pragma mark - Getter/Setter
- (void)setBarTransparent:(BOOL)barTransparent
{
    if (_barTransparent != barTransparent)
    {
        _barTransparent = barTransparent;
        
        TVNavigationBar *navigationBar = (TVNavigationBar *)self.navigationBar;
        if (barTransparent)
        {
            UIImage *emptyImage = [[UIImage alloc] init];
            [navigationBar setBackgroundImage:emptyImage forBarMetrics:UIBarMetricsDefault];
            navigationBar.shadowLineView.hidden = YES;
        }
        else
        {
            [navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
            navigationBar.shadowLineView.hidden = NO;
        }
    }
}

#pragma mark - Push/Pop
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self updateNavigationBarWithHandler:^{
        [super pushViewController:viewController animated:animated];
    }];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    __block NSArray<UIViewController *> *ret = nil;
    
    [self updateNavigationBarWithHandler:^{
        ret = [super popToViewController:viewController animated:animated];
    }];
    
    return ret;
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
{
    __block NSArray<UIViewController *> *ret = nil;
    
    [self updateNavigationBarWithHandler:^{
        ret = [super popToRootViewControllerAnimated:animated];
    }];
    
    return ret;
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    __block UIViewController *ret = nil;
    
    [self updateNavigationBarWithHandler:^{
        ret = [super popViewControllerAnimated:animated];
    }];
    
    return ret;
}

#pragma mark - Private
- (void)updateNavigationBarWithHandler:(void (^)())handler
{
    UIViewController *prevViewController = self.topViewController;
    BOOL originalTransparent = [self.topViewController isNavigationBarTransparent];
    
    handler();
    
    UIViewController *currentViewController = self.topViewController;
    BOOL currentTransparent = [currentViewController isNavigationBarTransparent];
    if (originalTransparent != currentTransparent)
    {
        self.barTransparent = YES;
        
        UIViewController *opaqueViewController = originalTransparent ? currentViewController : prevViewController;
        TVNavigationBar *fakeNavigationBar = [self createFakeNavigationBar];
        [opaqueViewController.view addSubview:fakeNavigationBar];
        
        [self.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            //TODO: 独立控制导航栏前景、背景色
            
        } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            [fakeNavigationBar removeFromSuperview];
            self.barTransparent = [self.topViewController isNavigationBarTransparent];
        }];
    }
}

- (TVNavigationBar *)createFakeNavigationBar
{
    CGRect frame = self.navigationBar.frame;
    frame.size.height += frame.origin.y;
    frame.origin.y = 0;
    TVNavigationBar *navigationBar = [[TVNavigationBar alloc] initWithFrame:frame];
    navigationBar.barStyle = self.navigationBar.barStyle;
    return navigationBar;
}

@end