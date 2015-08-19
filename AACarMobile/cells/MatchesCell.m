//
//  MatchesCell.m
//  AACarMobile
//
//  Created by Develop on 10.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "MatchesCell.h"

@implementation MatchesCell
@synthesize labelBrand,labelName,labelNumber;

-(void)setItem:(Match *)data
{
    labelBrand.text = data.brand;
    labelName.text = data.label;
    labelNumber.text = [NSString stringWithFormat:@"%@",data.article];
}

@end
