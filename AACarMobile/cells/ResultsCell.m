//
//  ResultsCell.m
//  AACarMobile
//
//  Created by Develop on 12.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "ResultsCell.h"
#import "Result.h"
#import "constants.h"
#import "NBImage.h"

@implementation ResultsCell

@synthesize labelBrand,labelCity,labelCommentCost,labelNumber,labelName,labelCost,labelCount,labelPhone,labelTime,nameSeller,buy;

-(void)setItem:(Result *)data
{
    _data = data;
    
    NSMutableAttributedString *brandStr = [[NSMutableAttributedString alloc] initWithString:@"Бренд: "];
    [brandStr addAttribute:NSForegroundColorAttributeName value:LIGHT_GREY_COLOR range:NSMakeRange(0, brandStr.length)];
    [brandStr appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",data.brand]]];
    labelBrand.attributedText = brandStr;
    
    NSMutableAttributedString *cityStr = [[NSMutableAttributedString alloc] initWithString:@"Адрес: "];
    [cityStr addAttribute:NSForegroundColorAttributeName value:LIGHT_GREY_COLOR range:NSMakeRange(0, cityStr.length)];
    [cityStr appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",data.address]]];
    labelCity.attributedText = cityStr;
    
    if(data.quantity)
    {
        NSMutableAttributedString *quantityStr = [[NSMutableAttributedString alloc] initWithString:@"Количество: "];
        [quantityStr addAttribute:NSForegroundColorAttributeName value:LIGHT_GREY_COLOR range:NSMakeRange(0, quantityStr.length)];
        [quantityStr appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld",(long)[data.quantity integerValue]]]];
        labelCount.attributedText = quantityStr;
    }
    else
        labelCount.text = [NSString stringWithFormat:@"Нет в продаже"];
    
    
    labelCommentCost.text = data.comment_cost;
    
    NSMutableAttributedString *costStr = [[NSMutableAttributedString alloc] initWithString:@"Цена: "];
    [costStr addAttribute:NSForegroundColorAttributeName value:LIGHT_GREY_COLOR range:NSMakeRange(0, costStr.length)];
    NSString *dataStr = [NSString stringWithFormat:@"%@",data.cost_rub];
    [costStr appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",dataStr]]];
    [costStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:19.0] range:NSMakeRange(costStr.length - dataStr.length, dataStr.length)];
    [costStr appendAttributedString:[[NSAttributedString alloc] initWithString:@" руб."]];
    labelCost.attributedText = costStr;
    
    
    labelName.text = [[NSString stringWithFormat:@"%@",data.product_name] capitalizedString]  ;
    labelPhone.text = data.phones[0];
    labelTime.text = data.delivery_time;
    labelNumber.text = [NSString stringWithFormat:@"%@",data.article];
    
    [nameSeller setTitle:[NSString stringWithFormat:@"Продавец %@",data.name] forState:UIControlStateNormal ];
    [nameSeller setTitle:[NSString stringWithFormat:@"Продавец %@",data.name] forState:UIControlStateHighlighted];
    [nameSeller setTitleColor:GREEN_COLOR forState:UIControlStateNormal];
    [nameSeller setTitleColor:GREEN_COLOR forState:UIControlStateHighlighted];
    
    [buy setBackgroundImage:[UIImage imageFromColor:GREEN_COLOR forSize:buy.frame.size withCornerRadius:3.5] forState:UIControlStateNormal];
    [buy setBackgroundImage:[UIImage imageFromColor:GREEN_COLOR forSize:buy.frame.size withCornerRadius:3.5] forState:UIControlStateHighlighted];
}

- (Result *)getResult;
{
    return _data;
}

@end
