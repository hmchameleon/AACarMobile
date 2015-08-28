//
//  CategoriesView.m
//  AACarMobile
//
//  Created by Develop on 21.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "CategoriesView.h"
#import "Filter.h"
#import "constants.h"

@implementation CategoriesView
{
    NSArray *_data;
    NSString *_returnKey;
}

@synthesize tableView,variableView;

- (void) awakeFromNib
{
    [super awakeFromNib];
    //[self.];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setHidden:YES];
}

-(void)setItem:(NSArray *)data forKey:(NSString *)key
{
    _returnKey = key;
    _data=data;
    if((_data.count == 1) && (_data[0] == FL_NUMBER_VALUE))
    {
        [tableView setHidden:YES];
        [variableView setHidden:NO];
        
    }
    else
    {
        [tableView setHidden:NO];
        [variableView setHidden:YES];
        [tableView reloadData];
    }
}

#pragma mark table view datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_data count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reusableFiltersCell"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reusableFiltersCell"];
    }
    //cell.textLabel.text = [FILTER_NAME_DICT objectForKey:_filtersKeys[indexPath.row]];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_data[indexPath.row]];
    cell.selectedBackgroundView = [UIView new];
    cell.selectedBackgroundView.backgroundColor = LIGHT_GREEN_COLOR;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate setValueFilter:[FILTER_DICT objectForKey:_returnKey][indexPath.row]  forKey:_returnKey];
    [self setHidden:YES];
}

@end
