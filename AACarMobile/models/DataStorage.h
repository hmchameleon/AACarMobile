//
//  DataStorage.h
//  AACarMobile
//
//  Created by Develop on 10.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStorage : NSObject

+(DataStorage *)sharedManager;

-(void)uploadsMatches:(NSString *)searchStr;
-(NSArray *)getMatches;

-(void)uploadsResults:(NSString *)searchResult;
-(NSArray *)getResults;

@end
