//
//  ViewController.h
//  AACarMobile
//
//  Created by Develop on 10.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchTableView.h"
#import "SearchButton.h"
#import "CustomTextFiled.h"

@interface MatchViewController : UIViewController <UITextFieldDelegate, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet MatchTableView *tableView;
@property (nonatomic, weak) IBOutlet SearchButton *searchButton;
@property (nonatomic, weak) IBOutlet CustomTextFiled *textField;
@property (nonatomic ,weak) IBOutlet UIView *beginnerView;
@property (nonatomic, weak) IBOutlet UILabel *beginnerLabel;

-(IBAction) onSearchClick:(id)sender;

@end

