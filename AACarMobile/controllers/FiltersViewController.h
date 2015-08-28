//
//  FiltersViewController.h
//  AACarMobile
//
//  Created by Develop on 21.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoriesView.h"

@protocol SetFilterToResult

-(void)setFilterToResult:(NSDictionary *)dict;

@end

@interface FiltersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, SetFilter>

@property (nonatomic,weak) IBOutlet UIView *topView;

@property (nonatomic,weak) id<SetFilterToResult> delegate;
@property (nonatomic,weak) IBOutlet UITableView *filtersTableView;
@property (nonatomic,weak) IBOutlet CategoriesView      *categoriesView;

-(IBAction)onCancelClick:(id)sender;
-(IBAction)onSetClick:(id)sender;

-(void)initialFilter:(NSDictionary *)filter;

@end
