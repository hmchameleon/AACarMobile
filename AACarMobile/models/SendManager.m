//
//  SendManager.m
//  AACarMobile
//
//  Created by Develop on 20.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "SendManager.h"
#import "constants.h"
#import <NSObject+JTObjectMapping.h>
#import <AFNetworking.h>
#import "constants.h"

@implementation SendManager
{
    AFHTTPRequestOperation *_operation;
}

static SendManager *instance;

+(SendManager *)sharedManager
{
    @synchronized (self)
    {
        if(instance == nil)
        {
            instance = [[self alloc] init];
        }
    }
    return instance;
}

-(void)sendOrder:(Order *)data
{
    NSString *orderString = [NSString stringWithFormat:@"\"product_id\":\"%@\",\"product_name\":\"%@\",\"first_name\":\"%@\",\"phone\":\"%@\",\"callback\":\"%@\",\"email\":\"%@\",\"comment\":\"%@\"",data.product_id,data.product_name,data.first_name,data.phone,data.callback,data.email,data.comment];
    NSLog(@"string order: %@",orderString);
    NSURL *url = [[NSURL alloc] initWithString:[[NSString stringWithFormat:URL_ORDER,orderString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding ]];
    NSLog(@"order url: %@",url);
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    _operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    _operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [_operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *_operation, id localResponseObject)
     {
         [self response:localResponseObject];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error+++: %@", error);
         [self responseError:error];
     }];
    [_operation start];
}

-(void)response:(id)result
{
    [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_ORDER_UPLOADED object:nil];
}

-(void)responseError:(NSError *)error
{
    [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_ORDER_ERROR object:nil userInfo:[error userInfo]];// userInfo:error];
}

-(void)destroyOperation
{
    [_operation cancel];
}

@end
/*
 "product_id":"11819581934",
 "product_name":"К-Т СМЕННОГО ЭЛЕМЕНТА МАСЛЯНОГО ФИЛЬТРА",
 "first_name":"Имя",
 "phone":"79000000",
 "callback":"0",
 "email":"test@test.test",
 "comment":"Комментарий"
 */