//
//  MatchesCell.h
//  AACarMobile
//
//  Created by Develop on 10.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Match.h"

@interface MatchesCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel *labelBrand;
@property (nonatomic,weak) IBOutlet UILabel *labelNumber;
@property (nonatomic,weak) IBOutlet UILabel *labelName;
@property (nonatomic,weak) IBOutlet UIImageView *directionImageView;

-(void) setItem:(Match *)data;

@end
