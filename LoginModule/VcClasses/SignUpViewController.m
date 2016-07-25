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
@interface SignUpViewController ()
{
    UIAlertController *alert;
    BOOL errorFlag;
    NSString *errorString;
}
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    errorFlag=false;
    errorString=[NSString new];
    
    //alertView initializing
   alert  =[UIAlertController alertControllerWithTitle:@"OOPS" message:@"messege" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    
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



#pragma mark -UIDesign





#pragma mark -Register Button Action

- (IBAction)btnRegisterAction:(UIButton *)sender {
        
        if([[AppDelegate sharedInstance] isInternetAvailable])
        {
            if ([self isNameValid:_txtFName.text]) {
                errorFlag=true;
                [errorString stringByAppendingString:@"Name Invalid \n"];
            }
            if ([self isValidEmail:_txtFEmail.text]) {
                errorFlag=true;
                [errorString stringByAppendingString:@"Email Invalid \n"];
            }
            if ([self isValidPassword:_txtFPassword.text]) {
                errorFlag=true;
                [errorString stringByAppendingString:@"Password Invalid \n"];
            }
            if (_txtFPassword.text != _txtFConfirmPassword.text) {
                errorFlag=true;
                [errorString stringByAppendingString:@"Password Does not Match \n"];
            }
            if (errorFlag) {
                [alert setTitle:@"Please Correct"];
                [alert setMessage:errorString];
                [self presentViewController:alert animated:true completion:nil];
            }
            else{
                [self addUser];
            }
        }
        else{
            errorString=@"Internet Not Available";
            [alert setTitle:@"Internet Not Availible"];
            [alert setMessage:@"Please Check Your Internet Connection"];
            [self presentViewController:alert animated:true completion:nil];
            
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


#pragma mark -validations

-(BOOL) isValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

//http://stackoverflow.com/questions/15132276/password-validation-in-uitextfield-in-ios
-(BOOL)isValidPassword:(NSString *)password{
    
    BOOL lowerCaseLetter = '\0',upperCaseLetter = '\0',digit = '\0',specialCharacter = 0;
    if([password length] >= 10)
    {
        for (int i = 0; i < [password length]; i++)
        {
            unichar c = [password characterAtIndex:i];
            if(!lowerCaseLetter)
            {
                lowerCaseLetter = [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:c];
            }
            if(!upperCaseLetter)
            {
                upperCaseLetter = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:c];
            }
            if(!digit)
            {
                digit = [[NSCharacterSet decimalDigitCharacterSet] characterIsMember:c];
            }
            if(!specialCharacter)
            {
                specialCharacter = [[NSCharacterSet symbolCharacterSet] characterIsMember:c];
            }
        }
        
        if(specialCharacter && digit && lowerCaseLetter && upperCaseLetter)
        {
            return true;
        }
        else
        {
            return false;
        }
        
    }
    else
    {
        return false;
    }
}



-(BOOL)isNameValid :(NSString *)name{
    
    
    NSString *Regex = @"[a-zA-Z][a-zA-Z ]*";
    NSPredicate *TestResult = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",Regex];
    
    if ([TestResult evaluateWithObject:name] == true)
    {
        
        return true;
    }
    else
    {
        return false;
       
    }
}

@end
