//
//  NBImage.h
//  AACarMobile
//
//  Created by Develop on 24.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NBImage)

+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius;
+(UIImage *)imageBorderFromColor:(UIColor *)color forSize:(CGSize)size borderWidth:(float)width withCornerRadius:(CGFloat)radius;

@end
