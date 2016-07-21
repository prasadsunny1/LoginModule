//
//  SignUpViewController.m
//  LoginModule
//
//  Created by indianic on 20/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -Register Button Action

- (IBAction)btnRegisterAction:(UIButton *)sender {
    
    
    if([_txtFPassword.text isEqualToString:_txtFConfirmPassword.text] ){
        [self addUser];
    }
    
    
    
}



-(void)addUser{
    
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
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        NSLog(@"%@", httpResponse);
                                                    }
                                                }];
    [dataTask resume];
}


@end
