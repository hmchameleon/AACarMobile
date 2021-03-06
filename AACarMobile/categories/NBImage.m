//
//  NBImage.m
//  AACarMobile
//
//  Created by Develop on 24.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "NBImage.h"

@implementation UIImage (NBImage)

+(UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContext(size);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    // Draw your image
    [image drawInRect:rect];
    
    // Get the image, here setting the UIImageView image
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage *)imageBorderFromColor:(UIColor *)color forSize:(CGSize)size borderWidth:(float)width withCornerRadius:(CGFloat)radius
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [color CGColor]);
    CGContextSetLineWidth(context, width);
    CGContextStrokeRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(size);
    
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];

    [image drawInRect:rect];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return image;
}

@end
