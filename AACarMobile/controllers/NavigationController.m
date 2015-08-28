//
//  NavigationController.m
//  AACarMobile
//
//  Created by Develop on 24.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "NavigationController.h"
#import "constants.h"

@implementation NavigationController

-(void)viewDidLoad
{
    UIImage *imageBg = [UIImage imageFromColor:[UIColor colorWithRed:72.0/255 green:162.0/255 blue:17.0/255 alpha:1.0]
                                       forSize:CGSizeMake(320, (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) ? 64 : 44)
                              withCornerRadius:0];
    [self.navigationBar setBackgroundImage:imageBg forBarMetrics:UIBarMetricsDefault];
}

@end
