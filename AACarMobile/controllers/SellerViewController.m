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

@implementation SellerViewController
{
    NSNumber *_user_id;
    BOOL _reload;
    NSNumber *_s_idt;
}

@synthesize label;

@synthesize seller = _seller;

-(void)viewDidLoad
{
    _reload = YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(updateView) name:EVENT_RESULTS_UPLOADED object:nil];
    [nc addObserver:self selector:@selector(notifyError:) name:EVENT_UPLOADED_ERROR object:nil];
    if(_reload)
    {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [self updateSeller:_user_id];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self name:EVENT_RESULTS_UPLOADED object:nil];
    [nc removeObserver:self name:EVENT_UPLOADED_ERROR object:nil];
}

- (void) updateView
{
    NSString *str = [[NSString alloc] initWithFormat:@"%@\n%@",_seller.company,_seller.contact_info];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0] range:NSMakeRange(0, _seller.company.length)];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0] range:NSMakeRange(_seller.company.length, _seller.contact_info.length+1)];//data.brand.length+data.label.length
    //[str setAttributedString:[[NSAttributedString
    label.attributedText = attrStr;
    _reload = NO;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MapViewController *mvc = (MapViewController *) segue.destinationViewController;
    [mvc setAnnotation:_seller];
}

- (void)updateSeller:(NSNumber *)idt
{
    if(_s_idt!=idt)
    {
        NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:URL_SELLER, idt]];
        NSLog(@"url seller:%@",url);
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFJSONResponseSerializer serializer];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             _seller = [Seller objectFromJSONObject:responseObject mapping:nil];
             [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_RESULTS_UPLOADED object:nil];
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
             [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_UPLOADED_ERROR object:nil];
         }];
        [operation start];
        _s_idt = idt;
    }
    else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_RESULTS_UPLOADED object:nil];
    }
}

#pragma mark - UIAllertViewDelegate

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
