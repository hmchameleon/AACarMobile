//
//  NBNavButtonViewControllers.m
//  AACarMobile
//
//  Created by Develop on 26.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "UIViewController+NBNavButtonViewControllers.h"

@implementation UIViewController (NBNavButtonViewControllers)

-(void)setupBackButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 26, 26)];
    [backButton setImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
    [backButton setShowsTouchWhenHighlighted:TRUE];
    [backButton addTarget:self.navigationController action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBackItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.hidesBackButton = TRUE;
    self.navigationItem.leftBarButtonItem = barBackItem;
}

@end
