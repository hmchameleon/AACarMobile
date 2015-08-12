//
//  ResultsCell.h
//  AACarMobile
//
//  Created by Develop on 12.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Result.h"

@interface ResultsCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel *label;

-(void)setItem:(Result *)data;

@end
