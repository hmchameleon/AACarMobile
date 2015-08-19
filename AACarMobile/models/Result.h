//
//  Result.h
//  AACarMobile
//
//  Created by Develop on 11.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Result : NSObject

@property (nonatomic,strong) NSNumber *idt;
@property (nonatomic,strong) NSNumber *article;
@property (nonatomic,strong) NSNumber *clean_number;
@property (nonatomic,strong) NSString *brand;
@property (nonatomic,strong) NSNumber *brand_id;
@property (nonatomic,strong) NSString *product_name;
@property (nonatomic,strong) NSNumber *city;
@property (nonatomic,strong) NSNumber *sale;
@property (nonatomic,strong) NSNumber *quantity;
@property (nonatomic,strong) NSNumber *cost_rub;
@property (nonatomic,strong) NSString *delivery_time;
@property (nonatomic,strong) NSNumber *delivery;
@property (nonatomic,strong) NSNumber *update_date;
@property (nonatomic,strong) NSNumber *option_only_seller;
@property (nonatomic,strong) NSString *comment_cost;
@property (nonatomic,strong) NSNumber *discount;
@property (nonatomic,strong) NSNumber *type_price;
@property (nonatomic,strong) NSNumber *user_id;
@property (nonatomic,strong) NSArray *phones;
@property (nonatomic,strong) NSString *name;

@end
/*
 {
 "count": 1,
 "page": 4,
 "page_count": 22,
 "results": [
 {
 "id": 11336927782,
 "article": "11427635557",
 "clean_number": "11427635557",
 "brand": "BMW",
 "brand_id": 511,
 "product_name": "К-т сменного элемента масляного фильтра 11427635557",
 "city": 1783,
 "cost_rub": "773.89",
 "comment_cost": "",
 "cross_flag": 0,
 "delivery": 8,
 "delivery_time": "11 дней",
 "discount": 0,
 "email_order": "drcar@drcar.ru",
 "firstname": "Сергей",
 "lastname": "Егоров",
 "name": "DrCar.ru",
 "metro": [],
 "option_only_seller": 0,
 "phones": [
 "8 4955019355",
 "8 9060986060"
 ],
 "quantity": null,
 "region_id": 50,
 "sale": 0,
 "type_price": 1,
 "update_date": 1436995469,
 "user_id": 114376
 }
 ]
 }
 */