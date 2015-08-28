//
//  DataSourceResults.m
//  AACarMobile
//
//  Created by Develop on 13.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "DataSourceResults.h"
#import "Result.h"

@implementation DataSourceResults
{
}

@synthesize results = _results;

-(id)init
{
    if (self = [super init])
    {
        _results = [NSMutableArray new];
        _pageCurrent = 0;
        _pageTotal = 0;
    }
    
    return self;
}

- (void) uploadResults:(DataSourceEnum )option withFilters:(NSDictionary *)filters
{
    BOOL end=NO;
    switch (option) {
        case uploadReset:
            _pageCurrent = 1;
            if(_results)
            {
                [_results removeAllObjects];
            }
            break;
        
        case uploadNext:
            if(_pageCurrent < _pageTotal)
                _pageCurrent++;
            else
                end=YES;
            break;
        default:
            break;
    }
    
    if(!end)
    {
        NSString *strFilters = [self dictionaryToString:filters];
        //NSLog(@"url %@",[[NSString alloc] initWithFormat:URL_RESULT,_article, _brand ,_pageCurrent,strFilters]);
        self.url = [[NSURL alloc] initWithString:[[[NSString alloc] initWithFormat:URL_RESULT,_article, _brand ,_pageCurrent,strFilters] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding ]];
        [self uploadData];
    }
}

-(void)response:(id)result
{
    NSDictionary *mapping = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"idt", @"id",nil];
    _pageTotal = [[result objectForKey:@"page_count"] integerValue];
    NSSet * suggestions = (NSSet *)[result objectForKey:@"results"];
    NSArray * array = [suggestions allObjects];
    for(int i = 0; i < array.count; i++) {
        Result *match = [Result objectFromJSONObject:array[i] mapping:mapping];
        [_results addObject:match];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_RESULTS_UPLOADED object:nil];
}

-(void)responseError
{
    [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_RESULTS_ERROR object:nil];
}

-(NSString *)dictionaryToString:(NSDictionary *)dict
{
    NSMutableString *str = [[NSMutableString alloc] init];
    NSArray *keys = [dict allKeys];
    for (int i = 0; i<[keys count]; i++) {
        [str appendFormat:@"\"%@\":%@,",keys[i],[dict objectForKey:keys[i]] ];
    }
    if (keys.count != 0) {
        [str deleteCharactersInRange:NSMakeRange(str.length -1 , 1)];
    }
    NSLog(@"str %@",str);
    return str;
}

@end
