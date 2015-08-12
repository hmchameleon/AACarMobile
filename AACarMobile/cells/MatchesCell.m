//
//  MatchesCell.m
//  AACarMobile
//
//  Created by Develop on 10.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "MatchesCell.h"

@implementation MatchesCell
@synthesize label;

-(void)setItem:(Match *)data
{
    //label.text = [data valueForKey:@"brand"];
    NSString *str = [[NSString alloc] initWithFormat:@"%@\n%@",data.brand,data.label];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0] range:NSMakeRange(0, data.brand.length)];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0] range:NSMakeRange(data.brand.length, data.label.length+1)];//data.brand.length+data.label.length
    //[str setAttributedString:[[NSAttributedString
    label.attributedText = attrStr;
    
}

@end
