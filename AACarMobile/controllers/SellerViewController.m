//
//  SellerViewController.m
//  AACarMobile
//
//  Created by Develop on 12.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "SellerViewController.h"

@implementation SellerViewController
{
    Result *_data;
}

@synthesize label;

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSString *str = [[NSString alloc] initWithFormat:@"%@\n%@",_data.brand,_data.product_name];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0] range:NSMakeRange(0, _data.brand.length)];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0] range:NSMakeRange(_data.brand.length, _data.product_name.length+1)];//data.brand.length+data.label.length
    //[str setAttributedString:[[NSAttributedString
    label.attributedText = attrStr;
}

-(void)setResult:(Result *)data
{
    _data = data;
}

-(IBAction)onMapClick:(id)sender
{
    [self performSegueWithIdentifier:@"mapSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

@end
