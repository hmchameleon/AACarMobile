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

- (void) uploadResults:(DataSourceEnum )option
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
        //http://api.aacar.ru/rest/products/11427635557/brand/BMW?page=2&per-page=50
        
        NSString *brand = [_brand stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        self.url = [[NSURL alloc] initWithString:[[NSString alloc] initWithFormat:URL_RESULT,_article, brand ,(long)_pageCurrent]];
        NSLog(@"url %@ %@",_article,_brand);
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
    
    [super response:result];
}

- (void)fail:(NSError *)error
{
    //
}

@end
