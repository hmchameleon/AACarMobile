//
//  FiltersCell.m
//  AACarMobile
//
//  Created by Develop on 27.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "FiltersCell.h"

@implementation FiltersCell
{
    NSAttributedString *_filter;
    NSAttributedString *_value;
}

@synthesize nameFilter, valueFilter;

-(void)setItem:(NSAttributedString *)filter withValue:(NSAttributedString *)value
{
    _filter = filter;
    _value = value;
    nameFilter.attributedText = _filter;
    valueFilter.attributedText = _value;

}

@end
