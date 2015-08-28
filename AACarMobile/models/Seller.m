//
//  Seller.m
//  AACarMobile
//
//  Created by Develop on 17.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "Seller.h"
#import <NSObject+JTObjectMapping.h>
#import <AFNetworking.h>
#import "constants.h"

@implementation Seller
{
    NSArray *keys;
    NSDictionary *dict;
    NSMutableArray *images;
}

-(id)init
{
    if(self =[super init])
    {
        keys = [[NSArray alloc] initWithObjects:@"company", @"address", @"phones",@"time_work", @"site", @"messangers", @"contact_info", nil];
        dict = @{
                               @"address" : @"placeIcon",
                               @"phones"  : @"phoneIcon",
                               @"company"    : @"userIcon",
                               @"time_work":@"clockIcon",
                               @"site"    : @"globeIcon",
                               @"messangers":@"placeholder",
                               @"contact_info":@"infoIcon",
                               };
        images = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSArray *)modelKeysAsArray
{
    //NSArray *array = [[NSArray alloc] initWithObjects:@"company", @"address", @"phones",@"time_work", @"site", @"messangers", @"contact_info", nil];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    int i;
    id object;
    for(i=0;i<keys.count;i++)
    {
        if((object =[self valueForKey:keys[i]])!=nil)
        {
            if([keys[i] isEqualToString:@"phones"])
            {
                for(int i=0;i<[[self valueForKey:@"phones"] count];i++)
                {
                    [array addObject:@"phones"];
                }
            }
            else if([keys[i] isEqualToString:@"messangers"])
            {
                for(int i = 0;i<[self.messangers count];i++)
                {
                    [array addObject:@"messangers"];
                }
            }
            else
                [array addObject:keys[i]];
        }
    }
    return  array;
}

-(NSArray *)modelsImageAsArray
{
    [self modelAsArray];
    return images;
}

-(NSArray *)modelAsArray
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSArray *modelKeys = self.modelKeysAsArray;
    int i;
    [images removeAllObjects];
    for(i=0;i<modelKeys.count; i++)
    {
        if([modelKeys[i] isEqualToString:@"phones"])
        {
            int j;
            for(j=0;j<[self.phones count];j++)
            {
                [array addObject:self.phones[j]];
                i++;
                [images addObject:[UIImage imageNamed:[dict objectForKey:@"phones"]]];
            }
            i--;
        }
        else if([modelKeys[i] isEqualToString:@"messangers"])
        {
            if([self.messangers objectForKey:@"skype"])
            {
                [array addObject:[NSString stringWithFormat:@"skype: %@",[self.messangers objectForKey:@"skype"]]];
                [images addObject:[UIImage imageNamed:[dict objectForKey:@"company"]]];
            }
            if([self.messangers objectForKey:@"icq"])
            {
                [array addObject:[NSString stringWithFormat:@"icq: %@",[self.messangers objectForKey:@"icq"]]];
                [images addObject:[UIImage imageNamed:[dict objectForKey:@"company"]]];
            }

        }
        else
        {
            [array addObject:[self valueForKey:modelKeys[i]]];
            [images addObject:[UIImage imageNamed:[dict objectForKey:modelKeys[i]]]];
        }
    }
    
    return array;
}

-(NSArray *)modelAsArrayObject
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    NSArray *modelKeys = [self modelKeysAsArray];
    for (int i = 0; modelKeys.count; i++)
    {
        if([modelKeys[i] isEqualToString:@"phones"])
        {
            int j;
            for(j=0;j<[self.phones count];j++)
            {
                SellersProperty *property = [[SellersProperty alloc] init];
                property.name = @"phones";
                property.value = self.phones[j];
                property.myImage = [UIImage imageNamed:[dict objectForKey:modelKeys[i]]];
                [array addObject:property];
                i++;
            }
            i--;
        }
        
        else if([modelKeys[i] isEqualToString:@"messangers"])
        {
            if([self.messangers objectForKey:@"skype"])
            {
                SellersProperty *property = [[SellersProperty alloc] init];
                property.name = @"messangers";
                property.value = [NSString stringWithFormat:@"skype: %@",[self.messangers objectForKey:@"skype"]];
                property.myImage = [UIImage imageNamed:[dict objectForKey:modelKeys[i]]];
                [array addObject:property];
            }
            if([self.messangers objectForKey:@"icq"])
            {
                SellersProperty *property = [[SellersProperty alloc] init];
                property.name = @"messangers";
                property.value = [NSString stringWithFormat:@"icq: %@",[self.messangers objectForKey:@"icq"]];
                property.myImage = [UIImage imageNamed:[dict objectForKey:modelKeys[i]]];
                [array addObject:property];
            }
        }
        else
        {
            SellersProperty *property = [[SellersProperty alloc] init];
            property.name = modelKeys[i];
            property.value = [self valueForKey:modelKeys[i]];
            property.myImage = [UIImage imageNamed:[dict objectForKey:modelKeys[i]]];
            [array addObject:property];
        }
    }
    
    return array;
}

@end
/*
 @property (nonatomic,strong) NSString *address;
 @property (nonatomic,strong) NSNumber *city;
 @property (nonatomic,strong) NSString *city_name;
 @property (nonatomic,strong) NSString *contact_info;
 @property (nonatomic,strong) NSArray *coordinates;
 @property (nonatomic,strong) NSString *email_order;
 @property (nonatomic,strong) NSDictionary *messangers;
 @property (nonatomic,strong) NSArray *metro;
 @property (nonatomic,strong) NSString *company;
 @property (nonatomic,strong) NSArray *phones;
 @property (nonatomic,strong) NSNumber *region_id;
 @property (nonatomic,strong) NSString *region_name;
 @property (nonatomic,strong) NSString *site;
 @property (nonatomic,strong) NSString *time_work;
*/