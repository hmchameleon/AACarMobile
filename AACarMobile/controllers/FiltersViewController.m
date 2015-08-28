//
//  FiltersViewController.m
//  AACarMobile
//
//  Created by Develop on 21.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "FiltersViewController.h"
#import "Filter.h"
#import "FiltersCell.h"
#import "constants.h"

@implementation FiltersViewController
{
    NSArray *_filtersKeys;
    NSInteger _filterIndex;
    NSMutableDictionary *_filter;
}

@synthesize filtersTableView,categoriesView, topView;

-(void)viewDidLoad
{
    [super viewDidLoad];
    if(!_filter)
        _filter = [[NSMutableDictionary alloc] init];
    _filtersKeys = [FILTER_DICT allKeys];
    [categoriesView setDelegate:self];
    [categoriesView setHidden:YES];
    
    [topView setBackgroundColor:GREEN_COLOR];
    CGSize size;
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        size.height = 64;
    }
    else
    {
        size.height = 44;
    }
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    //NSLog(@"%f %f %f %f", window.frame.origin)
    
    size.width = self.view.frame.size.width;
    [topView setFrame:CGRectMake(0.0, 0.0, size.width, size.height)];
    [filtersTableView setFrame:CGRectMake(0, size.height, window.frame.size.width, window.frame.size.height-size.height)];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //[self.view setBackgroundColor:GREEN_COLOR];
}

#pragma mark - table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_filtersKeys count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FiltersCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reusableFiltersCell"];
    
    NSString *originStr = [NSString stringWithFormat:@"%@", [FILTER_NAME_DICT objectForKey:_filtersKeys[indexPath.row]]];
    NSMutableAttributedString *str =[[NSMutableAttributedString alloc] initWithString:originStr];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithWhite:0 alpha:1] range:NSMakeRange(0,str.length)];
    if([_filter objectForKey:_filtersKeys[indexPath.row]])
    {
        
        NSArray *arr = (NSArray *)[CATEGORIES_NAME_DICT objectForKey:_filtersKeys[indexPath.row]];
        NSNumber *numb = [_filter objectForKey:_filtersKeys[indexPath.row]];
        NSUInteger index = [[FILTER_DICT objectForKey:_filtersKeys[indexPath.row]] indexOfObject:numb];
        
        NSMutableAttributedString *optionStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@",[arr objectAtIndex:index]]];
        [optionStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithWhite:0.5 alpha:1] range:NSMakeRange(0,[optionStr length])];
        [cell setItem:str withValue:optionStr];
    }
    else
    {
        NSMutableAttributedString *optionStr = [[NSMutableAttributedString alloc] initWithString:@"Не установлено"];
        [optionStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithWhite:0.5 alpha:1] range:NSMakeRange(0,[optionStr length])];
        [cell setItem:str withValue:optionStr];
    }
    cell.selectedBackgroundView = [UIView new];
    cell.selectedBackgroundView.backgroundColor = LIGHT_GREEN_COLOR;
    return cell;
}

#pragma mark - table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if([[FILTER_DICT objectForKey:_filtersKeys[indexPath.row]] isEqual: FL_NUMBER_VALUE])
    {
        [categoriesView setItem:@[@FL_INTEGER_VALUE] forKey:_filtersKeys[indexPath.row]];
    }
    else
    {
        [categoriesView setItem:[CATEGORIES_NAME_DICT objectForKey:_filtersKeys[indexPath.row]] forKey:_filtersKeys[indexPath.row]];
    }
    [categoriesView setHidden:NO];
}

#pragma mark - categoriesView delegate

-(void)setValueFilter:(id)object forKey:(NSString *)key
{
    [_filter setObject:object forKey:key];
    [self.filtersTableView reloadData];
    NSLog(@"dictionary filter %@",_filter);
}

#pragma mark - buttons action

-(IBAction)onCancelClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onSetClick:(id)sender
{
    [self.delegate setFilterToResult:_filter];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)initialFilter:(NSDictionary *)filter
{
    if(!_filter)
        _filter = [[NSMutableDictionary alloc] init];
    [_filter addEntriesFromDictionary:filter];
}

@end
