//
//  ViewController.h
//  LoginModule
//
//  Created by indianic on 08/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *txtFEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtFPassword;
@property (strong, nonatomic) IBOutlet UIButton *btnLogin;
@property (strong, nonatomic) IBOutlet UIButton *btnSignUp;

@property (strong, nonatomic) IBOutlet UIButton *btnGoogleSignUp;

@property (weak, nonatomic) IBOutlet UIView *viewFacebookSignUp;

@end

