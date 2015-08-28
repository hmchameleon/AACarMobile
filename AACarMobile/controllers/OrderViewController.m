//
//  OrderViewController.m
//  AACarMobile
//
//  Created by Develop on 18.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "OrderViewController.h"
#import "constants.h"
#import "Result.h"
#import "SendManager.h"
#import <MBProgressHUD.h>
#import "NBImage.h"
#import <YandexMobileMetrica.h>

@interface OrderViewController ()
{
    NSInteger currentTag;
    Result *_data;
}
@end

@implementation OrderViewController

@synthesize labelAddress,labelArt,labelBrand,labelName,labelPhone,labelSeller,orderButton,cancelButton, topView;

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UITextField *bottom = (UITextField *)[self.view viewWithTag:BEGIN_TEXT_FIELD_TAG + COUNT_TEXT_FIELD - 1];
    CGRect contentRect = CGRectMake(0, 0, self.view.bounds.size.width, CGRectGetMaxY(bottom.frame));
    [(UIScrollView *)self.view setContentSize:contentRect.size];
    currentTag = BEGIN_TEXT_FIELD_TAG;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
    
    NSMutableAttributedString *sellerStr = [[NSMutableAttributedString alloc] initWithString:@"Продавец: "];
    [sellerStr addAttribute:NSForegroundColorAttributeName value:LIGHT_GREY_COLOR range:NSMakeRange(0, sellerStr.length)];
    [sellerStr appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",_data.name]]];
    [labelSeller setAttributedText:sellerStr];
    
    NSMutableAttributedString *phoneStr = [[NSMutableAttributedString alloc] initWithString:@"Телефон: "];
    [phoneStr addAttribute:NSForegroundColorAttributeName value:LIGHT_GREY_COLOR range:NSMakeRange(0, phoneStr.length)];
    [phoneStr appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",_data.phones[0]]]];
    [labelPhone setAttributedText:phoneStr];
    
    NSMutableAttributedString *productStr = [[NSMutableAttributedString alloc] initWithString:@"Товар: "];
    [productStr addAttribute:NSForegroundColorAttributeName value:LIGHT_GREY_COLOR range:NSMakeRange(0, productStr.length)];
    [productStr appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",[_data.product_name capitalizedString]]]];
    [labelName setAttributedText:productStr];
    
    NSMutableAttributedString *brandStr = [[NSMutableAttributedString alloc] initWithString:@"Бренд: "];
    [brandStr addAttribute:NSForegroundColorAttributeName value:LIGHT_GREY_COLOR range:NSMakeRange(0, brandStr.length)];
    [brandStr appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",_data.brand]]];
    [labelBrand setAttributedText:brandStr];
    
    NSMutableAttributedString *artStr = [[NSMutableAttributedString alloc] initWithString:@"Артикул: "];
    [artStr addAttribute:NSForegroundColorAttributeName value:LIGHT_GREY_COLOR range:NSMakeRange(0, artStr.length)];
    [artStr appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",_data.article]]];
    [labelArt setAttributedText:artStr];
    
    
    NSMutableAttributedString *addressStr = [[NSMutableAttributedString alloc] initWithString:@"Адрес: "];
    [addressStr addAttribute:NSForegroundColorAttributeName value:LIGHT_GREY_COLOR range:NSMakeRange(0, addressStr.length)];
    [addressStr appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",_data.address]]];
    [labelAddress setAttributedText:addressStr];
    
    CGSize size;
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        size.height = 64;
    }
    else
    {
        size.height = 44;
    }
    size.width = self.view.frame.size.width;
    
    [topView setFrame:CGRectMake(0.0, 0.0, size.width, size.height)];
    [topView setBackgroundColor:GREEN_COLOR];
    
    int i;
    for(i=BEGIN_TEXT_FIELD_TAG;i<BEGIN_TEXT_FIELD_TAG + COUNT_TEXT_FIELD;i++)
    {
        [(UITextField*)[self.view viewWithTag:i] setDelegate:self];
    }

}

-(void)dismissKeyboard
{
    [self.view endEditing:YES];
    [(UIScrollView *)self.view setContentOffset:CGPointZero animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //[[self.view viewWithTag:currentTag] becomeFirstResponder];
    //[(UIScrollView *)self.view setContentOffset:CGPointMake(0, 100) animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [[SendManager sharedManager] destroyOperation];
    [super viewWillDisappear:animated];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField setBackgroundColor:[UIColor whiteColor]];
    [(UIScrollView *)self.view setContentOffset:CGPointMake(0, CGRectGetMaxY(textField.frame)-   200) animated:YES];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    currentTag = textField.tag;
    textField = (UITextField *)[self.view viewWithTag:(currentTag+1)];
    if(textField)
    {
        //[(UIScrollView *)self.view setContentOffset:CGPointMake(0, CGRectGetMaxY(textField.frame)-   200) animated:YES];
        [textField becomeFirstResponder];
        currentTag++;
    }
    else
        currentTag = BEGIN_TEXT_FIELD_TAG;
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField.tag == TAG_OF_NUMBER_FIELD)
    {
        int length = [self getLength:textField.text];
        //NSLog(@"Length  =  %d ",length);
        
        if(length == 10)
        {
            if(range.length == 0)
                return NO;
        }
        
        if(length == 3)
        {
            NSString *num = [self formatNumber:textField.text];
            textField.text = [NSString stringWithFormat:@"(%@) ",num];
            if(range.length > 0)
                textField.text = [NSString stringWithFormat:@"%@",[num substringToIndex:3]];
        }
        else if(length == 6)
        {
            NSString *num = [self formatNumber:textField.text];
            //NSLog(@"%@",[num  substringToIndex:3]);
            //NSLog(@"%@",[num substringFromIndex:3]);
            textField.text = [NSString stringWithFormat:@"(%@) %@-",[num  substringToIndex:3],[num substringFromIndex:3]];
            if(range.length > 0)
                textField.text = [NSString stringWithFormat:@"(%@) %@",[num substringToIndex:3],[num substringFromIndex:3]];
        }
        

    }
    return YES;
}

-(NSString*)formatNumber:(NSString*)mobileNumber
{
    
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    //NSLog(@"%@", mobileNumber);
    
    int length = [mobileNumber length];
    if(length > 10)
    {
        mobileNumber = [mobileNumber substringFromIndex: length-10];
        //NSLog(@"%@", mobileNumber);
        
    }
    
    
    return mobileNumber;
}


-(int)getLength:(NSString*)mobileNumber
{
    
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    int length = [mobileNumber length];
    
    return length;
    
    
}

#pragma mark - Actions

-(IBAction)onOrderClick:(id)sender
{
    int i;
    BOOL validText = YES;
    for(i=BEGIN_TEXT_FIELD_TAG;i<BEGIN_TEXT_FIELD_TAG + COUNT_TEXT_FIELD;i++)
    {
        if(([[(UITextField*)[self.view viewWithTag:i] text] isEqualToString:@""]) || ([(UITextField*)[self.view viewWithTag:i] text] == nil))
        {
            [(UITextField*)[self.view viewWithTag:i] setBackgroundColor:[UIColor colorWithRed:1.0 green:0.3 blue:0.3 alpha:0.3]];
            validText = NO;
        }
    }
    if(validText)
    {
        NSDate * now = [NSDate date];
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:[outputFormatter stringFromDate:now],@"time",_data.name,@"shop_name", _data.product_name, @"product_name",_data.cost_rub,@"cost_rub", nil];
        //NSString *message = @"openShop"//[NSString stringWithFormat:@"time:%@ company:%@ product_name:%@ cost_rub:%@",[outputFormatter stringFromDate:now], _data.name, _data.product_name,_data.cost_rub];
        [YMMYandexMetrica reportEvent:@"Buy Product"
                           parameters:dict
                            onFailure:nil];

        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:EVENT_ORDER_UPLOADED object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationError:) name:EVENT_ORDER_ERROR object:nil];
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        Order *order = [[Order alloc] init];
        [order setProduct_id:[NSString stringWithFormat:@"%@",_data.idt]];
        
        NSString *productName = [NSString stringWithFormat:@"%@",_data.product_name];
        productName = [productName stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        [order setProduct_name:productName];
        [order setFirst_name:[NSString stringWithFormat:@"%@",[(UITextField *)[self.view viewWithTag:100] text]]];
        //[order setFirst_name:[[NSString stringWithFormat:@"%@",[(UITextField *)[self.view viewWithTag:100] text]] stringByReplacingOccurrencesOfString:@" " withString:@""]];
        [order setPhone:[NSString stringWithFormat:@"%@",[(UITextField *)[self.view viewWithTag:102] text]]];
        [order setEmail:[NSString stringWithFormat:@"%@",[(UITextField *)[self.view viewWithTag:101] text]]];
        [order setCallback:@"0"];
        
        [[SendManager sharedManager] sendOrder:order];
    }
    else
    {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"" message:@"Заполнены не все поля" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [av show];
    }
}

-(void)notification:(NSNotification *)note
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"" message:@"Ваш заказ оформлен. Спасибо за покупку" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [av show];
}

-(void)notificationError:(NSNotification *)note
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"" message:[note.userInfo objectForKey:@"NSLocalizedDescription"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [av show];
}

-(IBAction)onCancelClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.delegate setRootFlag:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)setItem:(Result *)data
{
    _data = data;
}

@end
