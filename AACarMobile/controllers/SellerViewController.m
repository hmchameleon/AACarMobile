//
//  SellerViewController.m
//  AACarMobile
//
//  Created by Develop on 12.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "SellerViewController.h"
#import "constants.h"
#import <AFNetworking.h>
#import <NSObject+JTObjectMapping.h>
#import <MBProgressHUD.h>
#import "MapViewController.h"
#import "UIViewController+NBNavButtonViewControllers.h"
#import "SellerCell.h"
#import <YandexMobileMetrica.h>

@implementation SellerViewController
{
    NSNumber *_user_id;
    BOOL _reload;
    NSNumber *_s_idt;
    NSArray *_propertyes;
    NSArray *_propertyesImages;
    AFHTTPRequestOperation *_operation;
}

@synthesize myTableView,rootButton;

@synthesize seller = _seller;

-(void)viewDidLoad
{
    _reload = YES;
    [rootButton setBackgroundColor:GREEN_COLOR];
}

-(void)viewWillAppear:(BOOL)animated
{
    NSDate * now = [NSDate date];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:[outputFormatter stringFromDate:now],@"time",_seller.company,@"company", nil];
    [YMMYandexMetrica reportEvent:@"Open Shop"
                        parameters:dict
                        onFailure:nil];
    
    
    [super viewWillAppear:animated];
    [self setupBackButton];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(updateView) name:EVENT_SELLER_UPLOADED object:nil];
    [nc addObserver:self selector:@selector(notifyError:) name:EVENT_SELLER_ERROR object:nil];
    if(_reload)
    {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [self updateSeller:_user_id];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_operation cancel];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self name:EVENT_SELLER_UPLOADED object:nil];
    [nc removeObserver:self name:EVENT_SELLER_ERROR object:nil];
}

- (void) updateView
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    _reload = NO;
    [myTableView reloadData];
}

-(void)notifyError:(NSDictionary *)note
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Ошибка" message:@"Ошибка при получении данных" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [av show];
    NSLog(@"sellerError");
}

-(void)setResult:(NSNumber *)idt
{
    if(idt!=_user_id)
        _reload = YES;
    _user_id = idt;
}

-(IBAction)onMapClick:(id)sender
{
    [self performSegueWithIdentifier:@"mapSegue" sender:self];
}

-(IBAction)onRootViewClick:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqual:@"mapSegue"])
    {
        MapViewController *mvc = (MapViewController *) segue.destinationViewController;
        [mvc setAnnotation:_seller];
    }
    /*    else if()
    {
        
    }*/
}

- (void)updateSeller:(NSNumber *)idt
{
    if(_s_idt!=idt)
    {
        NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:URL_SELLER, idt]];
        NSLog(@"url seller:%@",url);
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        
        _operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        _operation.responseSerializer = [AFJSONResponseSerializer serializer];
        [_operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             _seller = [Seller objectFromJSONObject:responseObject mapping:nil];
             [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_SELLER_UPLOADED object:nil];
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
             [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_SELLER_ERROR object:nil];
         }];
        [_operation start];
        _s_idt = idt;
    }
    else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_SELLER_UPLOADED object:nil];
    }
}

#pragma mark - UIAllertViewDelegate

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - table view delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    _propertyes =[_seller modelAsArray];
    _propertyesImages = [_seller modelsImageAsArray];
    return [_propertyes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SellerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sellerCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_propertyes[indexPath.row]];
    cell.imageView.image = _propertyesImages[indexPath.row];
    cell.selectedBackgroundView = [UIView new];
    cell.selectedBackgroundView.backgroundColor = LIGHT_GREEN_COLOR;
    
    cell.imageView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin);
    
    [cell.textLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [cell.textLabel setNumberOfLines:0];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat marginVertical =20.0;
    CGSize constraint = CGSizeMake(300, 20000.0f);
    
    UIFont *font = [UIFont systemFontOfSize:14];
    
    //CGSize size = [[_propertyes[indexPath.row] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet] ]
    //               sizeWithFont:font
    //               constrainedToSize:constraint];
    
    CGSize size = [[_propertyes[indexPath.row] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                                                                 sizeWithFont:font
                                                             constrainedToSize:constraint
                   lineBreakMode:NSLineBreakByWordWrapping];
    
    return size.height + font.lineHeight + marginVertical;
    
    //return MAX(size.height + font.lineHeight + marginVertical, minHeight);
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"log %@",[_seller modelKeysAsArray][indexPath.row]);
    //NSLog(@"propertyes :%@ object:%@",_propertyes[indexPath.row],_seller.address);
    if([[_seller modelKeysAsArray][indexPath.row] isEqualToString:@"address"])
        [self performSegueWithIdentifier:@"mapSegue" sender:self];
    
    else if([[_seller modelKeysAsArray][indexPath.row] isEqualToString:@"phones"])
    {
        NSString *telephoneString=[_propertyes[indexPath.row] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSMutableString *str1=[[NSMutableString alloc] initWithString:telephoneString];
        [str1 setString:[str1 stringByReplacingOccurrencesOfString:@"(" withString:@""]];
        [str1 setString:[str1 stringByReplacingOccurrencesOfString:@")" withString:@""]];
        [str1 setString:[str1 stringByReplacingOccurrencesOfString:@"-" withString:@""]];
        [str1 setString:[str1 stringByReplacingOccurrencesOfString:@" " withString:@""]];
        NSLog(@"tel %@",str1);
        telephoneString = [@"telprompt://" stringByAppendingString:str1];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telephoneString]];
    }
    else if ([[_seller modelKeysAsArray][indexPath.row] isEqualToString:@"site"])
    {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",_propertyes[indexPath.row]]];
        NSLog(@"site %@",url);
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
