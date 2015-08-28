//
//  constants.h
//  AACarMobile
//
//  Created by Develop on 10.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#define APP_API_KEY             @"171673cb-0c64-43d4-b1fa-d7f766dfd181"

#define API_URL                 @""
#define URL_MATCH               @"http://api.aacar.ru/rest/search?query="
//http://api.aacar.ru/rest/products/08118463001EE/brand/HONDA%20MOTO?page=1&per-page=10&filters={"delivery":7}
#define URL_RESULT              @"http://api.aacar.ru/rest/products/%@/brand/%@?&page=%d&per-page=10&filters={%@}"
#define URL_SELLER              @"http://api.aacar.ru/rest/data/seller-info/%@"
#define URL_ORDER               @"http://api.aacar.ru/rest/data/send-order?data={%@}"

#define EVENT_UPLOADED          @"EVENT_UPLOADED"
#define EVENT_UPLOADED_ERROR    @"EVENT_UPLOADED_ERROR"

#define EVENT_MATCHES_UPLOADED  @"EVENT_MATCHES_UPLOADED"
#define EVENT_RESULTS_UPLOADED  @"EVENT_RESULTS_UPLOADED"
#define EVENT_SELLER_UPLOADED   @"EVENT_SELLER_UPLOADED"
#define EVENT_ORDER_UPLOADED    @"EVEN_ORDER_UPLOADED"

#define EVENT_MATCHES_ERROR     @"EVENT_MATCHES_ERROR"
#define EVENT_RESULTS_ERROR     @"EVENT_RESULTS_ERROR"
#define EVENT_SELLER_ERROR      @"EVENT_SELLER_ERROR"
#define EVENT_ORDER_ERROR       @"EVENT_ORDER_ERROR"

#define WAITING_MATCH           1

#define BEGIN_TEXT_FIELD_TAG    100
#define COUNT_TEXT_FIELD        3
#define TAG_OF_NUMBER_FIELD     102

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#define DARK_GREY_COLOR                             ([UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1.0f])
#define LIGHT_GREY_COLOR                            ([UIColor colorWithWhite:0.5 alpha:1])
#define GREEN_COLOR                                 ([UIColor colorWithRed:72.0f/255.0f green:162.0f/255.0f blue:17.0f/255.0f alpha:1.0f])
#define LIGHT_GREEN_COLOR                           ([UIColor colorWithRed:190.0f/255.0f green:255.0f/255.0f blue:171.0f/255.0f alpha:1.0f])