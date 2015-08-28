//
//  OrderViewController.h
//  AACarMobile
//
//  Created by Develop on 18.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Result.h"
#import "SendManager.h"

@protocol GoToRootView

-(void)setRootFlag:(BOOL)go;

@end

@interface OrderViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (nonatomic,weak) id<GoToRootView> delegate;  

@property (nonatomic,weak) IBOutlet UIView *topView;

@property (nonatomic,weak) IBOutlet UILabel *labelName;
@property (nonatomic,weak) IBOutlet UILabel *labelBrand;
@property (nonatomic,weak) IBOutlet UILabel *labelArt;
@property (nonatomic,weak) IBOutlet UILabel *labelSeller;
@property (nonatomic,weak) IBOutlet UILabel *labelAddress;
@property (nonatomic,weak) IBOutlet UILabel *labelPhone;
@property (nonatomic,weak) IBOutlet UIButton *orderButton;
@property (nonatomic,weak) IBOutlet UIButton *cancelButton;

-(IBAction)onOrderClick:(id)sender;
-(IBAction)onCancelClick:(id)sender;

-(void)setItem:(Result *) data;
-(void)setRootFlag:(BOOL)go;

@end
