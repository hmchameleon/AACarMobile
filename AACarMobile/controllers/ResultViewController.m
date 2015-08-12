//
//  ResultViewController.m
//  AACarMobile
//
//  Created by Develop on 11.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "ResultViewController.h"
#import "constants.h"
#import "DataStorage.h"
#import <MBProgressHUD.h>
#import "ResultsCell.h"
#import "SellerViewController.h"

@implementation ResultViewController
{
    NSArray *_result;
    int _index;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    _result = [NSArray new];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(notifyResults:) name:EVENT_RESULTS_UPLOADED object:nil];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[DataStorage sharedManager] uploadsResults:@"asdad"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _result.count;
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ResultsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reusableResultsCell"];
    [cell setItem:_result[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _index = indexPath.row;
    [self performSegueWithIdentifier:@"sellerSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SellerViewController *vc = (SellerViewController *)segue.destinationViewController;
    [vc setResult:_result[_index]];
}

-(void)notifyResults:(NSNotification *)note
{
    if (![NSThread isMainThread])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self notifyResults:note];
        });
        return;
    }
    
    _result = [[DataStorage sharedManager] getResults];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self.tableView reloadData];
}

@end
