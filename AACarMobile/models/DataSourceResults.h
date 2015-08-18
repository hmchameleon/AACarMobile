//
//  DataSourceResults.h
//  AACarMobile
//
//  Created by Develop on 13.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSource.h"

@interface DataSourceResults : DataSource
{
    NSInteger _pageTotal;
    NSInteger _pageCurrent;
}

@property (nonatomic,strong) NSNumber *article;
@property (nonatomic,strong) NSString *brand;

- (void) uploadResults:(DataSourceEnum )option;

@end
