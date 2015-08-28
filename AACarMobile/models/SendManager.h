//
//  SendManager.h
//  AACarMobile
//
//  Created by Develop on 20.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Order.h"

@interface SendManager : NSObject

+(SendManager *)sharedManager;
-(void) sendOrder:(Order *)data;
-(void)destroyOperation;

@end
