//
//  Order.m
//  AACarMobile
//
//  Created by Develop on 25.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "Order.h"

@implementation Order

-(id)init
{
    if(self=[super init])
    {
        self.product_id = @"";
        self.product_name = @"";
        self.phone = @"";
        self.first_name = @"";
        self.email = @"";
        self.comment = @"";
        self.callback = @"";
    }
    return self;
}

@end
