//
//  ViewController.m
//  AACarMobile
//
//  Created by Develop on 10.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "MatchViewController.h"
#import "DataStorage.h"
#import "constants.h"
#import "MatchesCell.h"
#import <MBProgressHUD.h>

@interface MatchViewController ()<UITableViewDataSource>
{
    NSArray *_matches;
    NSInteger _index;
}
@end

@implementation MatchViewController
@synthesize textField;

#pragma mark - init controllers

- (void)viewDidLoad {
    [super viewDidLoad];
    _matches = [NSArray new];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(notify:) name:EVENT_MATCHES_UPLOADED object:nil];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EVENT_MATCHES_UPLOADED object:nil];
}

-(void) notify:(NSNotification *) note
{
    if (![NSThread isMainThread])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self notify:note];
        });
        return;
    }
    
    _matches = [[DataStorage sharedManager] getMatches];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self.tableView reloadData];
}

#pragma mark - table functions

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _matches.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MatchesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reusableCell"];
    [cell setItem:_matches[indexPath.row]];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _index = indexPath.row;
    [self performSegueWithIdentifier:@"resultSegue" sender:self];
}

#pragma mark - actions

-(IBAction)onSearchClick:(id)sender
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [textField resignFirstResponder];
    [[DataStorage sharedManager] uploadsMatches:textField.text];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self onSearchClick:nil];
    
    return YES;
}

#pragma mark - prepare segues

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

@end
