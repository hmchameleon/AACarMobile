//
//  SellerCell.m
//  AACarMobile
//
//  Created by Develop on 27.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "SellerCell.h"

@implementation SellerCell
@synthesize textLabel,imageView;

-(void)setItem:(NSString *)info withImage:(UIImage *)image
{
    textLabel.text = info;
    imageView.image = image;
}

@end
