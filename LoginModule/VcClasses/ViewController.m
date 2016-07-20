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

    
    
// Orignal Login Button
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    // Optional: Place the button in the center of your view.
    
    [_viewFacebookSignUp addSubview:loginButton];
    
    loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];
    
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

@end
