//
//  LuckyMoneyViewController.m
//  TVTest
//
//  Created by zhoujinrui on 16/5/31.
//  Copyright © 2016年 zhoujinrui. All rights reserved.
//

#import "LuckyMoneyViewController.h"
#import "UIViewController+TVNavigationBarStyle.h"

@implementation LuckyMoneyViewController

- (IBAction)popWithoutAnimation:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}

- (IBAction)pushWithoutAnimation:(UIButton *)sender
{
    static int s_counter = 0;
    
    UIViewController *vc = [[UIViewController alloc] init];
    if (s_counter++ % 2 == 0)
    {
        vc.title = @"导航栏透明";
        vc.navigationBarTransparent = YES;
        vc.view.backgroundColor = [UIColor orangeColor];
    }
    else
    {
        vc.title = @"导航栏不透明";
        vc.view.backgroundColor = [UIColor lightGrayColor];
    }
    [self.navigationController pushViewController:vc animated:NO];
}

@end
