//
//  SignUpViewController.h
//  LoginModule
//
//  Created by indianic on 20/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtFName;
@property (weak, nonatomic) IBOutlet UITextField *txtFEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtFPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtFConfirmPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnRegister;

@end
