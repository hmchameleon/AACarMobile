//
//  SearchButton.m
//  AACarMobile
//
//  Created by Develop on 26.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "SearchButton.h"
#import "NBImage.h"
#import "constants.h"


@implementation SearchButton

-(void)awakeFromNib
{
    UIImage *btnBg = [UIImage imageFromColor:GREEN_COLOR forSize:self.frame.size withCornerRadius:3.0];
    [self setBackgroundImage:btnBg forState:UIControlStateNormal];
    [self setBackgroundImage:btnBg forState:UIControlStateHighlighted];
}

@end
