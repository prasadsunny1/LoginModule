//
//  AddStepsViewController.h
//  LoginModule
//
//  Created by indianic on 22/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddStepsViewController : UIViewController <UIImagePickerControllerDelegate>

@property(nonatomic,strong) void (^_completionHandler)(NSMutableArray *someParameter);

@property (weak, nonatomic) IBOutlet UIImageView *imgStepImage;

@property (weak, nonatomic) IBOutlet UIButton *btnAddImage;

@property (weak, nonatomic) IBOutlet UITextView *txtStepDescription;

@property (weak, nonatomic) IBOutlet UIButton *btnAddStep;

@property (weak, nonatomic) IBOutlet UILabel *lblNumberOfSteps;






@end
