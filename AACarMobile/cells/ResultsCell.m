//
//  ResultsCell.m
//  AACarMobile
//
//  Created by Develop on 12.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "ResultsCell.h"
#import "Result.h"
@implementation ResultsCell

@synthesize label;

-(void)setItem:(Result *)data
{
    //label.text = [data valueForKey:@"brand"];
    NSString *str = [[NSString alloc] initWithFormat:@"%@\n%@\n%@",data.brand,data.product_name,data.cost_rub];
    NSMutableAttributedString *astr = [[NSMutableAttributedString alloc] initWithString:str];
    [astr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0] range:NSMakeRange(0, data.brand.length)];
    [astr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0] range:NSMakeRange(data.brand.length,data.product_name.length+1)];
    [astr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0] range:NSMakeRange(data.brand.length + data.product_name.length+1 ,str.length - (data.brand.length + data.product_name.length+1))];
    /*NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0] range:NSMakeRange(0, data.brand.length)];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0] range:NSMakeRange(data.brand.length, data.product_name.length+1)];//data.brand.length+data.label.length
    //[str setAttributedString:[[NSAttributedString*/
    //label.attributedText = attrStr;
    label.attributedText = astr;
    
}


@end
