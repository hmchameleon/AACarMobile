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
{
    Result *_data;
}

@property (nonatomic,weak) IBOutlet UILabel *labelBrand;
@property (nonatomic,weak) IBOutlet UILabel *labelCost;
@property (nonatomic,weak) IBOutlet UILabel *labelNumber;
@property (nonatomic,weak) IBOutlet UILabel *labelName;
@property (nonatomic,weak) IBOutlet UILabel *labelCount;
@property (nonatomic,weak) IBOutlet UILabel *labelTime;
@property (nonatomic,weak) IBOutlet UILabel *labelCommentCost;
@property (nonatomic,weak) IBOutlet UILabel *labelCity;
@property (nonatomic,weak) IBOutlet UILabel *labelPhone;

@property (nonatomic,weak) IBOutlet UIButton *nameSeller;
@property (nonatomic,weak) IBOutlet UIButton *buy;

-(void)setItem:(Result *)data;
- (Result *)getResult;

@end
