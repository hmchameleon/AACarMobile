//
//  CategoriesView.h
//  AACarMobile
//
//  Created by Develop on 21.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SetFilter

-(void)setValueFilter:(id)object forKey:(NSString *)key;

@end

@interface CategoriesView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic,weak) IBOutlet UIView *variableView;
@property (nonatomic,weak) id<SetFilter> delegate;

-(void)setItem:(NSArray *)data forKey:(NSString *)key;

@end
