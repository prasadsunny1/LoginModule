//
//  ViewController.m
//  LoginModule
//
//  Created by indianic on 08/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "AppDelegate.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface ViewController ()
{
    NSMutableDictionary *loginData;
    NSString *emailFromFacebook;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareView];
    //
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor colorWithRed:159.0f/255.0f
 green:7.0f/255.0f blue:18.0f/255.0f alpha:1];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:159.0f/255.0f
                                                                             green:7.0f/255.0f blue:18.0f/255.0f alpha:1];
    //
    loginData =[NSMutableDictionary new];
    
    //Google Sign-In Code
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    
    _txtFEmail.text = @"prasadsunny1@gmail.com";
    _txtFPassword.text = @"qwerty123";
    
    emailFromFacebook =[NSString new];
    
    // Uncomment to automatically sign in the user.
    //[[GIDSignIn sharedInstance] signInSilently];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -UIDesign 

-(void)prepareView{
    
    
  
//    CALayer *border = [CALayer layer];
//    CGFloat borderWidth = 1;
//    
//    _txtFEmail.borderStyle = UITextBorderStyleNone;
//    border.borderColor = [UIColor whiteColor].CGColor;
//    border.frame = CGRectMake(0, _txtFEmail.frame.size.height - borderWidth, _txtFEmail.frame.size.width, _txtFEmail.frame.size.height);
//    border.borderWidth = borderWidth;
//    [_txtFEmail.layer addSublayer:border];
//    _txtFEmail.layer.masksToBounds = YES;
//    
//    
//    CALayer *passwordborder =[CALayer layer];
//    _txtFPassword.borderStyle = UITextBorderStyleNone;
//    passwordborder.borderColor = [UIColor whiteColor].CGColor;
//    passwordborder.frame = CGRectMake(0, _txtFPassword.frame.size.height - borderWidth, _txtFPassword.frame.size.width, _txtFPassword.frame.size.height);
//    passwordborder.borderWidth = borderWidth;
//    [_txtFPassword.layer addSublayer:passwordborder];
//    _txtFPassword.layer.masksToBounds = YES;
    
    _viewLoginField.layer.cornerRadius=10.0;
    _viewLoginField.layer.shadowColor=[UIColor blackColor].CGColor;
    

    
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
             NSLog(@"%@",result);
             NSLog(@"Logged in");
         }
     }];
}
- (IBAction)btnGoogleLoginAction:(UIButton *)sender {
    [[GIDSignIn sharedInstance] signIn];

}


#pragma mark -login Authentication



-(void)callLoginWebService{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSDictionary *headers = @{ @"content-type": @"application/json",
                               @"x-apikey": @"18961ebc916a47e54dae5dcb273d407508bbe",@"cache-control": @"no-cache",
    @"postman-token": @"75f6a352-914f-954f-19f7-b29dddaeade9" };


//    NSString *email=@"email";
//    NSString *password=@"password";
    NSString *url =[NSString stringWithFormat:@"https://recipeapp-6bbd.restdb.io/rest/profile?q={\"email\":\"%@\",\"password\":\"%@\"}",_txtFEmail.text,_txtFPassword.text];
    
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
                                                        
                                                       
                                                        
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            
                                                            if([aDict[@"email"] isEqualToString:emailFromFacebook ]){
                                                                
                                                                [MBProgressHUD hideHUDForView:self.view animated:YES];
                                                                
                                                                [self performSegueWithIdentifier:@"LoginSuccessSegue" sender:nil];
                                                                
                                                            }else if(YES){
                                                                
                                                            }
                                                            
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







//Facebook login WebService

-(void)callFacebookLoginWebService{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSDictionary *headers = @{ @"content-type": @"application/json",
                               @"x-apikey": @"18961ebc916a47e54dae5dcb273d407508bbe",@"cache-control": @"no-cache",
                               @"postman-token": @"75f6a352-914f-954f-19f7-b29dddaeade9" };
    
    
    //    NSString *email=@"email";
    //    NSString *password=@"password";
    NSString *url =[NSString stringWithFormat:@"https://recipeapp-6bbd.restdb.io/rest/profile?q={\"email\":\"%@\"}",emailFromFacebook];
    
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
                                                            
                                                            
                                                            
                                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                                
                                                                if([aDict[@"email"] isEqualToString:_txtFEmail.text ] && [aDict[@"password"] isEqualToString:_txtFPassword.text ]){
                                                                    
                                                                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                                                                    
                                                                    [self performSegueWithIdentifier:@"LoginSuccessSegue" sender:nil];
                                                                    
                                                                }
                                                                
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




#pragma mark button Action


- (IBAction)btnForgotPasswordAction:(UIButton *)sender {
    
    
    
}





- (IBAction)btnLoginAction:(UIButton *)sender {
    
//    if([[AppDelegate sharedInstance] isInternetAvailable])
//    {
        if ([self NSStringIsValidEmail:_txtFEmail.text]) {
                [self callLoginWebService];
        }
        else{
            
            UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Invalid Email" message:@"Please check email you have entered" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        
//    }
//    else
//    {
//        UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Oops" message:@"Internet Not Available" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *okAction =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//        [alert addAction:okAction];
//        [self presentViewController:alert animated:YES completion:nil];
//        
//    }

    
}


#pragma mark -validations

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}



@end
