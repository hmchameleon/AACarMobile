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

@synthesize labelBrand,labelCity,labelCommentCost,labelNumber,labelName,labelCost,labelCount,labelPhone,labelTime,nameSeller,buy;

-(void)setItem:(Result *)data
{
    _data = data;
    labelBrand.text = data.brand;
    labelCity.text = [NSString stringWithFormat:@"%@",data.city];
    labelCount.text = [NSString stringWithFormat:@"%@",data.quantity];
    labelCommentCost.text = data.comment_cost;
    labelCost.text = [NSString stringWithFormat:@"%@",data.cost_rub];
    labelName.text = data.product_name;
    labelPhone.text = data.phones[0];
    labelTime.text = data.delivery_time;
    labelNumber.text = [NSString stringWithFormat:@"%@",data.article];
    
    [nameSeller setTitle:data.name forState:UIControlStateNormal ];
    [nameSeller setTitle:data.name forState:UIControlStateHighlighted];
}

- (Result *)getResult;
{
    return _data;
}

@end
