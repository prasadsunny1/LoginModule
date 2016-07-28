//
//  AppDelegate.h
//  LoginModule
//
//  Created by indianic on 08/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate,GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;

-(BOOL)isInternetAvailable;
+(AppDelegate*)sharedInstance;
-(void)showAlertInController:(UIViewController*)controller WithMessage:(NSString*)strMessage;
- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error;
@end

