//
//  CustomTextFiled.m
//  AACarMobile
//
//  Created by Develop on 26.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "CustomTextFiled.h"
#import "NBImage.h"
#import "constants.h"

@implementation CustomTextFiled

-(void)awakeFromNib
{
    [self setBorderStyle:UITextBorderStyleNone];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIImage *txtFieldBg = [UIImage imageBorderFromColor:GREEN_COLOR forSize:self.frame.size borderWidth:1.0 withCornerRadius:3.0];
    [self setBackground:txtFieldBg];
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 10 , 0 );
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 10 , 0);
}

@end
