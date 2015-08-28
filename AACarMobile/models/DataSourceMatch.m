//
//  DataSourceMatch.m
//  AACarMobile
//
//  Created by Develop on 14.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "DataSourceMatch.h"
#import "Match.h"

@implementation DataSourceMatch

-(void)uploadsMatches:(NSString *)searchStr
{
    if(self.results)
        [self.results removeAllObjects];
    
    /*NSString* str1 = @"est un rêve en noir првиет";
     NSURL *url = [NSURL URLWithString:[str1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
     NSLog(@"%@", url);*/
    //NSString *formatedStr = [searchStr stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSString *formatedStr = [[NSString alloc] initWithFormat:@"%@%@",URL_MATCH,searchStr];
    self.url = [NSURL URLWithString:[formatedStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [self uploadData];
}

-(void)response:(id)result
{
    NSDictionary *mapping = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"idt", @"id",nil];
    NSSet * suggestions = (NSSet *)[result objectForKey:@"suggestions"];
    NSArray * array = [suggestions allObjects];
    for(int i = 0; i < array.count; i++) {
        Match *match = [Match objectFromJSONObject:array[i] mapping:mapping];
        [self.results addObject:match];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_MATCHES_UPLOADED object:nil];
}

-(void)responseError
{
    [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_MATCHES_ERROR object:nil];
}

@end
