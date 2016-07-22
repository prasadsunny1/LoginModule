//
//  UploadYourRecipeViewController.h
//  LoginModule
//
//  Created by indianic on 22/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddIngredientViewController.h"

@interface UploadYourRecipeViewController : UIViewController  <protocolIngrident>
@property (weak, nonatomic) IBOutlet UIImageView *imgCoverImage;

@property (weak, nonatomic) IBOutlet UIButton *btnAddCoverImage;

@property (weak, nonatomic) IBOutlet UITextField *txtFRecipeName;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentVegNonVeg;

@property (weak, nonatomic) IBOutlet UITextView *txtRecipeDiscription;
@property (weak, nonatomic) IBOutlet UILabel *lblServes;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UISlider *sliderServes;

@property (weak, nonatomic) IBOutlet UISlider *sliderTime;

@property (weak, nonatomic) IBOutlet UIButton *btnAddIngredient;
@property (weak, nonatomic) IBOutlet UIButton *btnAddVideo;
@property (weak, nonatomic) IBOutlet UIButton *btnAddStep;

@property (weak, nonatomic) IBOutlet UIButton *btnUpload;




@end
