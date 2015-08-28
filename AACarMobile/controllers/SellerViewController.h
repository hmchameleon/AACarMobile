//
//  SellerViewController.h
//  AACarMobile
//
//  Created by Develop on 12.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Seller.h"

@interface SellerViewController : UIViewController <UIAlertViewDelegate, UITableViewDelegate  >

@property (nonatomic, weak) IBOutlet UITableView *myTableView;
@property (nonatomic, weak) IBOutlet UIButton *rootButton;
@property (nonatomic, strong) Seller *seller;

-(IBAction)onMapClick:(id)sender;
-(IBAction)onRootViewClick:(id)sender;

-(void)setResult:(NSNumber *)idt;



@end
