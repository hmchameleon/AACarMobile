//
//  Result.m
//  AACarMobile
//
//  Created by Develop on 11.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "Result.h"

@implementation Result
@synthesize idt,brand,product_name,cost_rub;

-(Result *)initWithDictionary:(NSDictionary *)data
{
    if (self=[super init])
    {
        idt = [data valueForKey:@"id"];
        brand = [data valueForKey:@"brand"];
        product_name = [data valueForKey:@"product_name"];
        cost_rub = [data valueForKey:@"cost_rub"];
    }
    return self;
}

@end
