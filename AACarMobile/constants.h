//
//  constants.h
//  AACarMobile
//
//  Created by Develop on 10.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#define API_URL                 @""
#define URL_MATCH               @"http://api.aacar.ru/rest/search?query="
#define URL_RESULT              @"http://api.aacar.ru/rest/products/%@/brand/%@?page=%ld&per-page=10"
#define URL_SELLER              @"http://api.aacar.ru/rest/data/seller-info/%@"

#define EVENT_MATCHES_UPLOADED  @"EVENT_MATCHES_UPLOADED"
#define EVENT_RESULTS_UPLOADED  @"EVENT_RESULTS_UPLOADED"
#define EVENT_UPLOADED          @"EVENT_UPLOADED"
#define EVENT_UPLOADED_ERROR    @"EVENT_UPLOADED_ERROR"

#define WAITING_MATCH           5

#define BEGIN_TEXT_FIELD_TAG    100
#define COUNT_TEXT_FIELD        4
#define TAG_OF_NUMBER_FIELD     103

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
