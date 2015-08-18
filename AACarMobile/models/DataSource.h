//
//  DataSource.h
//  AACarMobile
//
//  Created by Develop on 14.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NSObject+JTObjectMapping.h>
#import <AFNetworking.h>
#import "constants.h"

typedef enum{
    uploadReset = 0,
    uploadNext
}DataSourceEnum;

@interface DataSource : NSObject

@property (nonatomic, strong) NSMutableArray *results;
@property (nonatomic, strong) NSURL *url;

-(void)uploadData;
-(void)response:(id)result;

@end
