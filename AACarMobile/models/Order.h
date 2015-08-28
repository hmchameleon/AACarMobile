//
//  Order.h
//  AACarMobile
//
//  Created by Develop on 25.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Order : NSObject

@property (nonatomic,strong) NSString *product_id;
@property (nonatomic,strong) NSString *product_name;
@property (nonatomic,strong) NSString *first_name;
@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSString *callback;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *comment;

@end
/*
 "product_id":"11819581934",
 "product_name":"К-Т СМЕННОГО ЭЛЕМЕНТА МАСЛЯНОГО ФИЛЬТРА",
 "first_name":"Имя",
 "phone":"79000000",
 "callback":"0",
 "email":"test@test.test",
 "comment":"Комментарий"
 */