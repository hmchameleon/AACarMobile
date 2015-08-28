//
//  ResultViewController.h
//  AACarMobile
//
//  Created by Develop on 11.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderViewController.h"
#import "FiltersViewController.h"

@interface ResultViewController : UITableViewController <UIScrollViewDelegate, UIAlertViewDelegate, GoToRootView, SetFilterToResult>

-(IBAction)onBuyClick:(id)sender;
-(IBAction)onNameSellerClick:(id)sender;
-(IBAction)onFiltersClick:(id)sender;

- (void)setBrand:(NSString *)brand;
- (void)setArticle:(NSNumber *)article;
- (void)setRootFlag:(BOOL)go;

@end
