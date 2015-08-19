//
//  OrderViewController.m
//  AACarMobile
//
//  Created by Develop on 18.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "OrderViewController.h"
#import "constants.h"

@interface OrderViewController ()
{
    NSInteger currentTag;
}
@end

@implementation OrderViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UITextField *bottom = (UITextField *)[self.view viewWithTag:BEGIN_TEXT_FIELD_TAG + COUNT_TEXT_FIELD - 1];
    CGRect contentRect = CGRectMake(0, 0, self.view.bounds.size.width, CGRectGetMaxY(bottom.frame)+200);
    [(UIScrollView *)self.view setContentSize:contentRect.size];
    currentTag = BEGIN_TEXT_FIELD_TAG;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard
{
    [self.view endEditing:YES];
    [(UIScrollView *)self.view setContentOffset:CGPointZero animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    int i;
    for(i=BEGIN_TEXT_FIELD_TAG;i<BEGIN_TEXT_FIELD_TAG + COUNT_TEXT_FIELD;i++)
    {
        [(UITextField*)[self.view viewWithTag:i] setDelegate:self];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[self.view viewWithTag:currentTag] becomeFirstResponder];
    //[(UIScrollView *)self.view setContentOffset:CGPointMake(0, 100) animated:YES];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField setBackgroundColor:[UIColor whiteColor]];
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
        [(UIScrollView *)self.view setContentOffset:CGPointMake(0, CGRectGetMaxY(textField.frame)-   100) animated:YES];
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
    }
    else
    {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"" message:@"Заполнены не все поля" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        av.show;
    }
}

-(IBAction)onCancelClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)setItem:(Result *)data
{
    
}

@end
