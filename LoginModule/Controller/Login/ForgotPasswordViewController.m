//
//  ForgotPasswordViewController.m
//  LoginModule
//
//  Created by indianic on 26/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController (){
    UIAlertController *alert;
}

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //alertView initializing
    alert  =[UIAlertController alertControllerWithTitle:@"OOPS" message:@"messege" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    
    
    
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
#pragma mark -Get Password Web Service Call

-(void)getPasswordWebService{
    
    NSDictionary *headers = @{ @"content-type": @"application/json",
                               @"x-apikey": @"18961ebc916a47e54dae5dcb273d407508bbe",@"cache-control": @"no-cache",
                               @"postman-token": @"75f6a352-914f-954f-19f7-b29dddaeade9" };
    
    
    //    NSString *email=@"email";
    //    NSString *password=@"password";
    NSString *url =[NSString stringWithFormat:@"https://recipeapp-6bbd.restdb.io/rest/profile?q={\"email\":\"%@\"}",_txtFEmail.text];
    
    NSLog(@"\n\n URL :    %@",url);
    NSLog(@"utf %@",[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
    
    NSURL *myurl = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:myurl
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    
    
    
    NSLog(@"\n\n MYURL :   %@",myurl);
    [request setHTTPMethod:@"GET"];
    [request setAllHTTPHeaderFields:headers];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        NSLog(@"%@",data);
                                                        NSArray *aArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                                                        NSLog(@" Dict : %@",aArray);
                                                        
                                                        if(aArray.count){
                                                            
                                                            NSDictionary *aDict = aArray[0];
                                                            
                                                            NSLog(@"Successfully Logged in");
                                                            
                                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                                
                                                                [alert setTitle:@"Your PassWord"];
                                                                [alert setMessage:aDict[@"password"]];
                                                                [self presentViewController:alert animated:true completion:nil];
                                                                
                                                                
                                                                
                                                                
                                                            });
                                                            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                            NSLog(@"%@", httpResponse);
                                                        }else{
                                                            
                                                            NSLog(@" Wrong Username or Password");
                                                        }
                                                        
                                                    }
                                                }];
    [dataTask resume];
    
}

#pragma mark -Button Action

- (IBAction)btnGetPasswordAction:(UIButton *)sender {
    
    [self getPasswordWebService];
    
}
@end
