//
//  DataSource.m
//  AACarMobile
//
//  Created by Develop on 14.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource
{
    AFHTTPRequestOperation *_operation;
}

@synthesize results = _results;

-(id)init
{
    if(self = [super init])
    {
        _results = [NSMutableArray new];
    }
    return self;
}

-(void)uploadData
{
    NSLog(@"url %@",_url);
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:_url];
    if(_operation)
    {
        [_operation cancel];
        _operation = nil;
    }
    _operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    _operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [_operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *_operation, id localResponseObject)
     {
         [self response:localResponseObject];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
         [self responseError];
     }];
    [_operation start];
}

-(void)responseError
{
    NSLog(@"responseError");
    [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_UPLOADED_ERROR object:nil];
}

-(void)response:(id)result
{
    [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_RESULTS_UPLOADED object:nil];
}

@end
