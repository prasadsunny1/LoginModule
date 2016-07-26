//
//  SignUpViewController.m
//  LoginModule
//
//  Created by indianic on 20/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import "SignUpViewController.h"
#import "Reachability.h"
#import "AppDelegate.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Register Button Action

- (IBAction)btnRegisterAction:(UIButton *)sender {
    
    if ([_txtFName.text isEqualToString:@""] || _txtFName.text.length == 0)
    {
        [[AppDelegate sharedInstance]showAlertInController:self WithMessage:@"Enter name"];
    }
    else if ([_txtFEmail.text isEqualToString:@""] || _txtFEmail.text.length == 0)
    {
        [[AppDelegate sharedInstance]showAlertInController:self WithMessage:@"Enter email"];
    }
    else if (![self isValidEmail:_txtFEmail.text] )
    {
        [[AppDelegate sharedInstance]showAlertInController:self WithMessage:@"Enter valid email"];
    }
    else if ([_txtFPassword.text isEqualToString:@""] || _txtFPassword.text.length == 0)
    {
        [[AppDelegate sharedInstance]showAlertInController:self WithMessage:@"Enter password"];
    }
    else if (![self isValidPassword:_txtFPassword.text] )
    {
        [[AppDelegate sharedInstance]showAlertInController:self WithMessage:@"Enter valid password"];
    }
    else if (![_txtFPassword.text isEqualToString:_txtFConfirmPassword.text])
    {
        [[AppDelegate sharedInstance]showAlertInController:self WithMessage:@"Password not Match"];
    }
    else
    {
        [self addUser];
    }
}

-(void)addUser
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary *headers = @{ @"x-apikey": @"18961ebc916a47e54dae5dcb273d407508bbe",
                               @"content-type": @"application/json",
                               @"cache-control": @"no-cache",
                               @"postman-token": @"57c41260-46db-41ca-9399-cbccae2e2e59" };
    NSDictionary *parameters = @{ @"name": _txtFName.text,
                                  @"email": _txtFEmail.text,
                                  @"password":_txtFPassword.text};
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://recipeapp-6bbd.restdb.io/rest/profile"]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    [request setHTTPBody:postData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                                                        
                                                        [self.navigationController popViewControllerAnimated:YES];
                                                    });
                                                                   
                                                    
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                       
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        NSLog(@"%@", httpResponse);
                                                    }
                                                }];
    [dataTask resume];
}


#pragma mark -validations

-(BOOL) isValidEmail:(NSString *)checkString
{
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    //Valid email address
    
    if ([emailTest evaluateWithObject:checkString] == YES)
    {
        return true;
    }
    else
    {
        NSLog(@"email not in proper format");
        return false;
    }
}

-(BOOL)isValidPassword : (NSString *)password{
    if (password.length<8 || password.length>15) {
        return false;
    }
    else{
        return true;
    }
}

@end
