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
@property (nonatomic,strong) NSString *brand;
@property (nonatomic,strong) NSNumber *brand_id;
@property (nonatomic,strong) NSNumber *article;
@property (nonatomic,strong) NSString *product_name;
@property (nonatomic,strong) NSNumber *clean_number;
@property (nonatomic,strong) NSNumber *sale;
@property (nonatomic,strong) NSNumber *quantity;
@property (nonatomic,strong) NSNumber *cost;
@property (nonatomic,strong) NSNumber *cost_rub;
@property (nonatomic,strong) NSNumber *delivery_time;
@property (nonatomic,strong) NSNumber *delivery;
@property (nonatomic,strong) NSNumber *update_date;
@property (nonatomic,strong) NSNumber *option_only_seller;
@property (nonatomic,strong) NSString *comment_cost;
@property (nonatomic,strong) NSNumber *discount;
@property (nonatomic,strong) NSNumber *type_price;

-(Result *)initWithDictionary:(NSDictionary *)data;

@end
/*[{"id":"11221427676",
 "brand":"BMW",
 "brand_id":"511",
 "article":"11427635557",
 "product_name":"",
 "clean_number":"11427635557",
 "sale":"1",
 "quantity":null,
 "cost":"542.73",
 "cost_rub":"556.30",
 "delivery_time":"",
 "delivery":null,
 "update_date":"1437347161",
 "option_only_seller":"1",
 "comment_cost":"При месячном обороте от 100000руб",
 "discount":"2",
 "type_price":"1",
 "user_id":"114473",
 "region_id":"77",
 "firstname":"Иван",
 "lastname":"Морозов",
 "name":"ООО «СОКОЛ-АВТО»",
 "city":"2097",
 "phones":"a:2:{i:0;s:42:\"8 4957907080, доб.(если есть): \";i:1;s:42:\"8 9167367010, доб.(если есть): \";}",
 "email_order":"ivan@sokolauto.ru",
 "metro":"a:3:{i:1;s:1:\"3\";i:2;s:1:\"5\";i:3;s:1:\"7\";}",
 "cross_flag":""},
 */