//
//  DataStorage.m
//  AACarMobile
//
//  Created by Develop on 10.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "DataStorage.h"
#import "Match.h"
#import "constants.h"
#import "JSONKit.h"
#import <AFNetworking.h>
#import "Result.h"
#import <NSObject+JTObjectMapping.h>

@implementation DataStorage
{
    NSMutableArray *_match;
    NSMutableArray *_result;
}


static DataStorage *instance;

+(DataStorage *)sharedManager
{
    @synchronized (self){
        if(instance == nil)
        {
            instance = [[self alloc] init];
        }
    }
    return instance;
}

-(id) init
{
    self = [super init];
    _match = [NSMutableArray new];
    _result = [NSMutableArray new];
    instance = self;
    return self;
}

#pragma mark - matches

-(void)uploadsMatches:(NSString *)searchStr
{
    if(_match)
        [_match removeAllObjects];
    
    NSURL *url = [[NSURL alloc] initWithString:[[NSString alloc] initWithFormat:@"%@%@",URL_MATCH,searchStr]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary *mapping = [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"idt", @"id",nil];
         NSSet * suggestions = (NSSet *)[responseObject objectForKey:@"suggestions"];
         NSArray * array = [suggestions allObjects];
         for(int i = 0; i < array.count; i++) {
             Match *match = [Match objectFromJSONObject:array[i] mapping:mapping];
             [_match addObject:match];
         }
         [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_MATCHES_UPLOADED object:nil];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
         return;
     }];
    [operation start];
}

-(NSArray *)getMatches
{
    return _match;
}

#pragma mark - result

-(void)uploadsResults:(NSString *)searchResult
{
    if(_result)
        [_result removeAllObjects];
    
    /*NSURL *url = [[NSURL alloc] initWithString:[[NSString alloc] initWithFormat:@"%@%@",URL_RESULT,searchResult]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSSet * suggestions = (NSSet *)[responseObject objectForKey:@"suggestions"];
         NSArray * array = [suggestions allObjects];
         for(int i = 0; i < array.count; i++) {
             Match *match = [[Match alloc] initWithDictionary:array[i]];
             [_match addObject:match];
         }
         [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_MATCHES_UPLOADED object:nil];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
         return;
     }];
    [operation start];
    */
    
    NSString *result = @"[{\"id\":\"11221427676\",\"brand\":\"BMW\",\"brand_id\":\"511\",\"article\":\"11427635557\",\"product_name\":\"\",\"clean_number\":\"11427635557\",\"sale\":\"1\",\"quantity\":null,\"cost\":\"542.73\",\"cost_rub\":\"556.30\",\"delivery_time\":\"\",\"delivery\":null,\"update_date\":\"1437347161\",\"option_only_seller\":\"1\",\"comment_cost\":\"При месячном обороте от 100000руб\",\"discount\":\"2\",\"type_price\":\"1\",\"user_id\":\"114473\",\"region_id\":\"77\",\"firstname\":\"Иван\",\"lastname\":\"Морозов\",\"name\":\"ООО «СОКОЛ-АВТО»\",\"city\":\"2097\",\"phones\":\"a:2:{i:0;s:42:\\\"8 4957907080, доб.(если есть): \\\";i:1;s:42:\\\"8 9167367010, доб.(если есть): \\\";}\",\"email_order\":\"ivan@sokolauto.ru\",\"metro\":\"a:3:{i:1;s:1:\\\"3\\\";i:2;s:1:\\\"5\\\";i:3;s:1:\\\"7\\\";}\",\"cross_flag\":\"\"},{\"id\":\"11222765515\",\"brand\":\"BMW\",\"brand_id\":\"511\",\"article\":\"11427635557\",\"product_name\":\"\",\"clean_number\":\"11427635557\",\"sale\":\"1\",\"quantity\":\"5.00\",\"cost\":\"496.65\",\"cost_rub\":\"509.07\",\"delivery_time\":null,\"delivery\":null,\"update_date\":\"1437353401\",\"option_only_seller\":\"1\",\"comment_cost\":\"При месячном обороте от 100000руб\",\"discount\":\"2\",\"type_price\":\"0\",\"user_id\":\"114473\",\"region_id\":\"77\",\"firstname\":\"Иван\",\"lastname\":\"Морозов\",\"name\":\"ООО «СОКОЛ-АВТО»\",\"city\":\"2097\",\"phones\":\"a:2:{i:0;s:42:\\\"8 4957907080, доб.(если есть): \\\";i:1;s:42:\\\"8 9167367010, доб.(если есть): \\\";}\",\"email_order\":\"ivan@sokolauto.ru\",\"metro\":\"a:3:{i:1;s:1:\\\"3\\\";i:2;s:1:\\\"5\\\";i:3;s:1:\\\"7\\\";}\",\"cross_flag\":\"\"}]";
    NSArray *array = [result objectFromJSONString];
    NSDictionary *mapping = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"idt", @"id",nil];
    for(int i = 0; i<array.count;i++)
    {
        //Result *result = [[Result alloc] initWithDictionary:array[i]];
        Result *result = [Result objectFromJSONObject:array[i] mapping:mapping];
        [_result addObject:result];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_RESULTS_UPLOADED object:nil];
}

-(NSArray *)getResults
{
    return _result;
}

@end





































