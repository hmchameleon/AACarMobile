//
//  OrderViewController.h
//  AACarMobile
//
//  Created by Develop on 18.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Result.h"

@interface OrderViewController : UIViewController <UITextFieldDelegate>

-(IBAction)onOrderClick:(id)sender;
-(IBAction)onCancelClick:(id)sender;

-(void)setItem:(Result *) data;

@end
