//
//  MatchesCell.m
//  AACarMobile
//
//  Created by Develop on 10.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "MatchesCell.h"
#import "constants.h"

@implementation MatchesCell
@synthesize labelBrand,labelName,labelNumber;

-(void)awakeFromNib
{
    UIImage *img = [UIImage imageNamed:@"directionIcon"];
    self.directionImageView.image = img;
}

-(void)setItem:(Match *)data
{
    labelBrand.text = [NSString stringWithFormat:@"Бренд %@",data.brand];
    NSString *strBrand =[NSString stringWithFormat:@"%@",data.brand];
    NSMutableAttributedString *atrBrandString = [[NSMutableAttributedString alloc] initWithString:@"Бренд: "];
    [atrBrandString addAttribute:NSForegroundColorAttributeName value:LIGHT_GREY_COLOR range:NSMakeRange(0,[atrBrandString length])];
    
    [atrBrandString appendAttributedString:[[NSAttributedString alloc] initWithString:strBrand]];
    [atrBrandString addAttribute:NSForegroundColorAttributeName value:DARK_GREY_COLOR range:NSMakeRange(atrBrandString.length -strBrand.length, strBrand.length)];
    
    labelBrand.attributedText = atrBrandString;
    
    labelName.text = [data.label capitalizedString];
    
    NSString *strNumber = [NSString stringWithFormat:@"%@",data.article];
    NSMutableAttributedString *atrNumberString = [[NSMutableAttributedString alloc] initWithString:@"Артикул: "];
    [atrNumberString addAttribute:NSForegroundColorAttributeName value:LIGHT_GREY_COLOR range:NSMakeRange(0,[atrNumberString length])];
    
    [atrNumberString appendAttributedString:[[NSAttributedString alloc] initWithString:strNumber]];
    [atrNumberString addAttribute:NSForegroundColorAttributeName value:DARK_GREY_COLOR range:NSMakeRange(atrNumberString.length -strNumber.length, strNumber.length)];
    
    labelNumber.attributedText = atrNumberString;
}

@end
