//
//  SellerViewController.h
//  AACarMobile
//
//  Created by Develop on 12.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Seller.h"

@interface SellerViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic,weak) IBOutlet UILabel *label;
@property (nonatomic, strong) Seller *seller;

-(IBAction)onMapClick:(id)sender;

-(void)setResult:(NSNumber *)idt;

@end
