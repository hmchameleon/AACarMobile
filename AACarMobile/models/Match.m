//
//  Matches.m
//  AACarMobile
//
//  Created by Develop on 10.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "Match.h"

@implementation Match

@synthesize idt, value, datat, pid, brand, label, brand_logo;

-(id) initWithDictionary:(NSDictionary *)data
{
    if (self=[super init])
    {
        idt = data[@"id"];
        //value = data [@"value"];
        //datat = data [@"data"];
        pid = data[@"pid"];
        brand = data[@"brand"];
        label = data[@"label"];
        //brand_logo = data [@"brand_logo"];
    }
    return self;

}

@end
/*
"id":"4815820080",
"value":"4815820080",
"data":"4815820080",
"pid":"11563981870",
"brand":"TOYOTA",
"label":"\u041f\u0440\u043e\u043a\u043b\u0430\u0434\u043a\u0430 \u043f\u0440\u0443\u0436\u0438\u043d\u044b \u043d\u0438\u0436\u043d\u044f\u044f FR TOYOTA Toyota Caldina,",
"brand_logo":"\/uploads\/all_brands\/TOYOTA.jpg"*/