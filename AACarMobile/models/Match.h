//
//  Matches.h
//  AACarMobile
//
//  Created by Develop on 10.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Match : NSObject

@property (nonatomic,strong) NSNumber *idt;
@property (nonatomic,strong) NSNumber *value;
@property (nonatomic,strong) NSNumber *datat;
@property (nonatomic,strong) NSNumber *pid;
@property (nonatomic,strong) NSString *brand;
@property (nonatomic,strong) NSString *label;
@property (nonatomic,strong) NSString *brand_logo;

-(id) initWithDictionary:(NSDictionary *)data;

@end
/*
 {"query":"481582008",
  "suggestions":
    [
        {
        "id":"4815820080",
        "value":"4815820080",
        "data":"4815820080",
        "pid":"11563981870",
        "brand":"TOYOTA",
        "label":"\u041f\u0440\u043e\u043a\u043b\u0430\u0434\u043a\u0430 \u043f\u0440\u0443\u0436\u0438\u043d\u044b \u043d\u0438\u0436\u043d\u044f\u044f FR TOYOTA Toyota Caldina,",
        "brand_logo":"\/uploads\/all_brands\/TOYOTA.jpg"
        },
        {  
        "id":"4815820080",
        "value":"4815820080",
        "data":"4815820080",
        "pid":"11597901590",
        "brand":"TOYOTA",
        "label":"\u041f\u0440\u043e\u043a\u043b\u0430\u0434\u043a\u0430 \u043f\u0435\u0440\u0435\u0434\u043d\u0435\u0439 \u043f\u0440\u0443\u0436\u0438\u043d\u044b \u043d\u0438\u0436\u043d\u044f\u044f",
        "brand_logo":"\/uploads\/all_brands\/TOYOTA.jpg"
        },
        {
        "id":"4815820080",
        "value":"4815820080",
        "data":"4815820080",
        "pid":"11599251080",
        "brand":"TOYOTA",
        "label":"\u041f\u0440\u043e\u043a\u043b\u0430\u0434\u043a\u0430 \u043f\u0435\u0440\u0435\u0434\u043d\u0435\u0439 \u043f\u0440\u0443\u0436\u0438\u043d\u044b \u043d\u0438\u0436\u043d\u044f\u044f",
        "brand_logo":"\/uploads\/all_brands\/TOYOTA.jpg"
        },
        {
        "id":"4815820080",
        "value":"4815820080",
        "data":"4815820080",
        "pid":"11603197911","brand":"TOYOTA","label":"\u0414\u0435\u0442\u0430\u043b\u044c","brand_logo":"\/uploads\/all_brands\/TOYOTA.jpg"},{"id":"4815820080","value":"4815820080","data":"4815820080","pid":"11607290314","brand":"TOYOTA","label":"\u041f\u0420\u041e\u041a\u041b\u0410\u0414\u041a\u0410 \u041f\u0420\u0423\u0416\u0418\u041d\u042b","brand_logo":"\/uploads\/all_brands\/TOYOTA.jpg"},{"id":"4815820080","value":"4815820080","data":"4815820080","pid":"11608312345","brand":"TOYOTA","label":"\u0414\u0435\u0442\u0430\u043b\u044c","brand_logo":"\/uploads\/all_brands\/TOYOTA.jpg"},{"id":"48158-20080","value":"48158-20080","data":"48158-20080","pid":"11427335969","brand":"TOYOTA","label":"\u041f\u0420\u041e\u041a\u041b\u0410\u0414\u041a\u0410","brand_logo":"\/uploads\/all_brands\/TOYOTA.jpg"}]}
*/