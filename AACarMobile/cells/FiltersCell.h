//
//  FiltersCell.h
//  AACarMobile
//
//  Created by Develop on 27.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FiltersCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel *nameFilter;
@property (nonatomic,weak) IBOutlet UILabel *valueFilter;

-(void) setItem:(NSAttributedString *)filter withValue:(NSAttributedString *)value;

@end
