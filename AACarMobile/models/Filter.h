//
//  Filter.h
//  AACarMobile
//
//  Created by Develop on 21.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FL_INTEGER_VALUE -1
#define FL_NUMBER_VALUE [NSNumber numberWithInt: FL_INTEGER_VALUE]

#define FILTER_DICT @{ \
@"delivery":     @[@"\"\"",@2,@5,@7,@8],\
@"sale":         @[@"\"\"",@0,@1],\
@"type_price":   @[@"\"\"",@0,@1],\
}

#define FILTER_NAME_DICT @{\
@"delivery":    @"срок доставки",\
@"sale":        @"тип продажи",\
@"type_price":  @"наличие/заказ",\
}

#define CATEGORIES_NAME_DICT @{\
@"delivery":    @[@"Не установлено",@"до 2х дней",@"до 5 дней",@"до 7 дней", @"более 7ми дней"],\
@"sale":        @[@"Не установлено",@"розница",@"оптом"],\
@"type_price":  @[@"Не установлено",@"наличие на складе",@"под заказ"],\
}

@interface Filter : NSObject

@property (nonatomic,weak) NSNumber *region_id;
@property (nonatomic,weak) NSNumber *user_id;
@property (nonatomic,weak) NSNumber *delivery;
@property (nonatomic,weak) NSNumber *sale;
@property (nonatomic,weak) NSNumber *type_price;

@end
