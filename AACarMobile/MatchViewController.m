//
//  ViewController.m
//  AACarMobile
//
//  Created by Develop on 10.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "MatchViewController.h"
#import "DataSourceMatch.h"
#import "constants.h"
#import "MatchesCell.h"
#import <MBProgressHUD.h>
#import "ResultViewController.h"

@interface MatchViewController ()<UITableViewDataSource>
{
    NSArray *_matches;
    NSInteger _index;
    DataSourceMatch *_dataSource;
    NSTimer *_timer;
}
@end

@implementation MatchViewController
@synthesize textField,beginnerView,beginnerLabel;

#pragma mark - init controllers

- (void)viewDidLoad {
    [super viewDidLoad];
    _matches = [NSArray new];
    _dataSource = [[DataSourceMatch alloc] init];
    
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(notify:) name:EVENT_RESULTS_UPLOADED object:nil];
    [nc addObserver:self selector:@selector(notifyError:) name:EVENT_UPLOADED_ERROR object:nil];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EVENT_RESULTS_UPLOADED object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EVENT_UPLOADED_ERROR object:nil];
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

    [MBProgressHUD hideHUDForView:self.view animated:YES];
    _matches = _dataSource.results;
    if(_matches.count == 0)
    {
        beginnerLabel.text = @"По данному запросу ничего не найдено";
        [self.beginnerView setHidden:NO];
    }
    else
    {
        [self.tableView reloadData];
        [self.beginnerView setHidden:YES];
    }
}

-(void)notifyError:(NSDictionary *)note
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Ошибка" message:@"Ошибка при получении данных" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [av show];
    NSLog(@"matchError");
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if ([textField isFirstResponder])// && [touch view] != textField)
        [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];}

-(IBAction)onSearchClick:(id)sender
{
    if([textField.text  isEqual:@""])
    {
        [beginnerView setHidden:NO];
        [beginnerLabel setText:@"Введите в строке поиска название искомой запчасти"];
        [textField resignFirstResponder];
        return;
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [textField resignFirstResponder];
    [_dataSource uploadsMatches:textField.text];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self onSearchClick:nil];
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _timer = [NSTimer scheduledTimerWithTimeInterval: WAITING_MATCH
                                              target: self
                                            selector:@selector(onTick)
                                            userInfo: nil repeats:NO];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [_timer invalidate];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [_timer invalidate];
    if(!(([string isEqual:@""]) && range.location==0))
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval: WAITING_MATCH
                                              target: self
                                            selector:@selector(onTick)
                                            userInfo: nil repeats:NO];
    }
    else
    {
        [beginnerLabel setText:@"Введите в строке поиска название искомой запчасти"];
        [beginnerView setHidden:NO];
    }
    return true;
}

-(void)onTick
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_timer invalidate];
    [_dataSource uploadsMatches:textField.text];
}

#pragma mark - prepare segues

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ResultViewController *rvc = (ResultViewController *)segue.destinationViewController;
    [rvc setBrand:[_matches[_index] brand]];
    [rvc setArticle:[_matches[_index] article]];
}

@end
