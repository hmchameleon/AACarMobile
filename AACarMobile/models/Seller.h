//
//  Seller.h
//  AACarMobile
//
//  Created by Develop on 17.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Seller : NSObject

@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSNumber *city;
@property (nonatomic,strong) NSString *city_name;
@property (nonatomic,strong) NSString *contact_info;
@property (nonatomic,strong) NSArray *coordinates;
@property (nonatomic,strong) NSString *email_order;
@property (nonatomic,strong) NSDictionary *messangers;
@property (nonatomic,strong) NSArray *metro;
@property (nonatomic,strong) NSString *company;
@property (nonatomic,strong) NSArray *phones;
@property (nonatomic,strong) NSNumber *region_id;
@property (nonatomic,strong) NSString *region_name;
@property (nonatomic,strong) NSString *site;
@property (nonatomic,strong) NSString *time_work;

@end

/*{
    "address": "Санкт-Петербург, г. Санкт-Петербург, ул. ул. Бестужевская, дом 54, литера З",
    "city": 2287,
    "city_name": "Санкт-Петербург",
    "contact_info": "",
    "coordinates": [
                    "59.977845",
                    "30.435703"
                    ],
    "email_order": "292@2.ru",
    "messangers": {
        "skype": "Omegapart"
    },
    "metro": [1, 2, 3],
    "company": "Редавто",
    "phones": [
               "8 8125431443"
               ],
    "region_id": 78,
    "region_name": "Санкт-Петербург",
    "site": "http://www.redauto.ru/",
    "time_work": "10:00-18:00"
}*/