//
//  ViewController.m
//  LoginModule
//
//  Created by indianic on 08/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareView];
    
    //Google Sign-In Code
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    // Uncomment to automatically sign in the user.
    //[[GIDSignIn sharedInstance] signInSilently];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -UIDesign 

-(void)prepareView{
    
    
  
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 1;
    
    _txtFEmail.borderStyle = UITextBorderStyleNone;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, _txtFEmail.frame.size.height - borderWidth, _txtFEmail.frame.size.width, _txtFEmail.frame.size.height);
    border.borderWidth = borderWidth;
    [_txtFEmail.layer addSublayer:border];
    _txtFEmail.layer.masksToBounds = YES;
    
    
    
    border.frame = CGRectMake(0, _txtFPassword.frame.size.height - borderWidth, _txtFPassword.frame.size.width, _txtFPassword.frame.size.height);
    border.borderWidth = borderWidth;
    [_txtFPassword.layer addSublayer:border];
    _txtFPassword.layer.masksToBounds = YES;
    
    
    
    
//    _txtFEmail.borderStyle = UITextBorderStyleLine;
//    _txtFEmail.l
//    _txtFEmail.layer.borderColor= [UIColor whiteColor].CGColor;
//    _txtFEmail.layer.borderWidth=2;

    
}

#pragma mark -FBLogin Button Click


- (IBAction)btnFbloginAction:(UIButton *)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
         }
     }];
}
- (IBAction)btnGoogleLoginAction:(UIButton *)sender {
    [[GIDSignIn sharedInstance] signIn];

}


#pragma mark -login Authentication



-(void)validateUser{
    
    NSDictionary *headers = @{ @"content-type": @"application/json",
                               @"x-apikey": @"18961ebc916a47e54dae5dcb273d407508bbe",
                               @"cache-control": @"no-cache",
                               @"postman-token": @"75f6a352-914f-954f-19f7-b29dddaeade9" };
    
   NSString *email =@"email";
    NSString *url =[NSString stringWithFormat:@"https://recipeapp-6bbd.restdb.io/rest/profile?q={%@:%@}",email,_txtFEmail.text];
    NSURL *myurl = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:myurl
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    [request setAllHTTPHeaderFields:headers];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        
                                                        if(data){
                                                            NSLog(@"Successfully Logged in");
                                                        }
                                                        
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        NSLog(@"%@", httpResponse);
                                                    }
                                                }];
    [dataTask resume];
}

- (IBAction)btnLoginAction:(UIButton *)sender {
    
    [self validateUser];
    
}




@end
