//
//  ResultViewController.m
//  AACarMobile
//
//  Created by Develop on 11.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "ResultViewController.h"
#import "constants.h"
#import <MBProgressHUD.h>
#import "ResultsCell.h"
#import "SellerViewController.h"
#import "DataSourceResults.h"

#import "UIViewController+NBNavButtonViewControllers.h"

@interface ResultViewController ()
{
    BOOL isLoading;
    BOOL _rootFlag;
    Result *_rslt;
    NSDictionary *_filter;
}

@end

@implementation ResultViewController
{
    NSArray *_result;
    int _index;
    DataSourceResults *_dataSource;
    BOOL _load;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        _dataSource = [[DataSourceResults alloc] init];
        
        isLoading = false;
    }
    
    return self;
}

- (void)setBrand:(NSString *)brand
{
    _dataSource.brand = brand;
}

-(void)setArticle:(NSNumber *)article
{
    _dataSource.article = article;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setupBackButton];
    _result = [NSArray new];
    _load = NO;
    _rootFlag = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(_rootFlag)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
        _rootFlag = NO;
    }
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(notifyResults:) name:EVENT_RESULTS_UPLOADED object:nil];
    [nc addObserver:self selector:@selector(notifyError:) name:EVENT_RESULTS_ERROR object:nil];
    if(!_load)
    {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [self updateSource:uploadReset];
        _load=YES;
    }
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [_dataSource destroyOperation];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self name:EVENT_RESULTS_UPLOADED object:nil];
    [nc removeObserver:self name:EVENT_RESULTS_ERROR object:nil];
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
    cell.selectedBackgroundView = [UIView new];
    cell.selectedBackgroundView.backgroundColor = LIGHT_GREEN_COLOR;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _rslt = _result[indexPath.row];
    [self performSegueWithIdentifier:@"sellerSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"sellerSegue"])
    {
        SellerViewController *vc = (SellerViewController *)segue.destinationViewController;
        if (_rslt != nil)
            [vc setResult:_rslt.user_id];
    }
    else if([segue.identifier isEqualToString:@"orderSegue"])
    {
        OrderViewController *vc = (OrderViewController *)segue.destinationViewController;
        vc.delegate = self;
        if(_rslt !=nil)
            [vc setItem:_rslt];
    }
    else if([segue.identifier isEqualToString:@"filtersSegue"])
    {
        FiltersViewController *vc = (FiltersViewController *)segue.destinationViewController;
        [vc initialFilter:_filter];
        [vc setDelegate:self];
    }
}

- (void) updateSource:(DataSourceEnum)option
{
    isLoading = true;
    
    [_dataSource uploadResults:option withFilters:_filter];
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
    
    _result = [_dataSource results];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self.tableView reloadData];
    isLoading = false;
}

-(void)notifyError:(NSNotification *)note
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Ошибка" message:@"Ошибка при получении данных" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [av show];
    NSLog(@"resultError");
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (isLoading)
    {
        return;
    }
    
    CGPoint contentOffset =  scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize contentSize = scrollView.contentSize;
    UIEdgeInsets contentInset = scrollView.contentInset;
    NSLog(@"contentOffset = %f %f\n bounds = %f %f %f %f \n contentSize = %f %f \n contentInset = %f %f %f %f ",contentOffset.x,contentOffset.y,bounds.origin.x,bounds.origin.y,bounds.size.height,bounds.size.width,contentSize.height,contentSize.width,contentInset.bottom,contentInset.left,contentInset.right,contentInset.top);
    
    float reload_distance  = 10;
    float y = contentOffset.y + bounds.size.height+reload_distance;
    
    if(y>contentSize.height)
    {
        [self updateSource:uploadNext];
    }
}

#pragma mark - UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - buttons active

-(IBAction)onNameSellerClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    ResultsCell * cell = nil;
    
    cell = (ResultsCell *)[[btn superview] superview];

    _rslt = [cell getResult];
    [self performSegueWithIdentifier:@"sellerSegue" sender:self];
}

-(IBAction)onBuyClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    ResultsCell * cell = nil;
    
    cell = (ResultsCell *)[[btn superview] superview];
    
    _rslt = [cell getResult];
    [self performSegueWithIdentifier:@"orderSegue" sender:self];
}


-(IBAction)onFiltersClick:(id)sender
{
    [self performSegueWithIdentifier:@"filtersSegue" sender:self];
}

#pragma mark - root protocol
-(void)setRootFlag:(BOOL)go
{
    _rootFlag = go;
}

#pragma mark filters delegate

-(void)setFilterToResult:(NSDictionary *)dict
{
    _filter = dict;
    _load = NO;
}

@end
