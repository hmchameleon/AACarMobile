//
//  ViewController.h
//  AACarMobile
//
//  Created by Develop on 10.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchTableView.h"

@interface MatchViewController : UIViewController <UITextFieldDelegate, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet MatchTableView *tableView;
@property (nonatomic, weak) IBOutlet UITextField *textField;

-(IBAction) onSearchClick:(id)sender;

@end

