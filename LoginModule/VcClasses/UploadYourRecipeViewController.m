//
//  UploadYourRecipeViewController.m
//  LoginModule
//
//  Created by indianic on 22/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import "UploadYourRecipeViewController.h"
#import "AddIngredientViewController.h"
#import "AddStepsViewController.h"

@interface UploadYourRecipeViewController ()
{
    
    UIImagePickerController *imagepicker;
    NSMutableArray  *arrAllRecipeData;
    NSMutableDictionary *dictTempRecipe;
    NSMutableArray *arrMutIngredient;
    NSMutableArray *arrMutSteps;
}
@end

@implementation UploadYourRecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    arrAllRecipeData=[NSMutableArray new];
    dictTempRecipe=[NSMutableDictionary new];
    arrMutIngredient=[NSMutableArray new];
    arrMutSteps=[NSMutableArray new];
    
    imagepicker=[[UIImagePickerController alloc]init];
    imagepicker.delegate=self;
    [imagepicker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    [imagepicker setAllowsEditing:YES];

// [_sliderTime addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];//    AddIngredientViewController *objaddIngredient =[[AddIngredientViewController alloc]init];
//    objaddIngredient.delegate=self;
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark  - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"AddIngredientViewControllerSegue"])
    {
        //Getting Values in Dictionary
        
        AddIngredientViewController *obj = segue.destinationViewController;
        [obj set_completionHandler:^(NSMutableArray *mutArr) {
            
            NSLog(@"%@",mutArr);
            arrMutIngredient=mutArr;
        }];
    }
    if ([segue.identifier isEqualToString:@"AddStepsViewControllerSegue"]) {
        
        AddStepsViewController *obj = segue.destinationViewController;
        [obj set_completionHandler:^(NSMutableArray *mutArr) {
            
            NSLog(@"%@",mutArr);
            arrMutSteps=mutArr;
        }];

    }
}



#pragma mark -Button Actions



- (IBAction)btnAddCoverImage:(UIButton *)sender {
    
    [self.navigationController presentViewController:imagepicker animated:true completion:nil];
}


- (IBAction)btnAddIngredientsAction:(UIButton *)sender {
    
    
}

- (IBAction)btnAddVideoAction:(UIButton *)sender {
}

- (IBAction)btnAddStepsAction:(UIButton *)sender {
}


- (IBAction)btnUploadAction:(UIButton *)sender {
    [self CollectData];
    NSLog(@"all recipe data  \n %@",arrAllRecipeData);

    
}


#pragma mark -Delegate Methods


-(void)sendData{
    
    NSLog(@"delegate called");
    
}


#pragma mark - Collect Data

-(void)CollectData{
    [dictTempRecipe setObject:_txtFRecipeName.text forKey:@"name"];
    [dictTempRecipe setObject:_imgCoverImage.image forKey:@"coverimage"];
    [dictTempRecipe setObject:[NSNumber numberWithInt:_segmentVegNonVeg.selectedSegmentIndex]forKey:@"nonveg"];
    [dictTempRecipe setObject:_txtRecipeDiscription.text forKey:@"recipe_discription"];
    [dictTempRecipe setObject:_lblServes.text  forKey:@"serves"];
    [dictTempRecipe setObject:_lblTime.text  forKey:@"time"];
    [dictTempRecipe setObject:arrMutIngredient forKey:@"ingredient"];
    [dictTempRecipe setObject:arrMutSteps forKey:@"steps"];
    
    [arrAllRecipeData addObject:dictTempRecipe];
    NSLog(@"all recipe data  \n %@",arrAllRecipeData);
    
}


#pragma mark UIcontrols Init and data fetching

//-(NSString*)isBonveg{
//    if (_segmentVegNonVeg.selectedSegmentIndex==0) {
//        return @"Veg";
//    }
//    else if (_segmentVegNonVeg.selectedSegmentIndex==0) {
//        return @"NonVeg";
//    }
//    else{
//        NSLog(@"could not fetch segment data");
//        return @"undefined";
//    }
//}

#pragma mark set Slider Behaviour

- (IBAction)timeSliderValueChanged:(UISlider *)sender {
    NSLog(@"slider value = %f", sender.value);
    _lblTime.text=[NSString stringWithFormat:@"%@",[NSNumber numberWithInt:(int)roundf(sender.value)]];
}


- (IBAction)servesSliderValueChanged:(UISlider *)sender {
    NSLog(@"slider value = %f", sender.value);
    _lblServes.text=[NSString stringWithFormat:@"%@",[NSNumber numberWithInt:(int)roundf(sender.value)]];
}

#pragma mark UIimagePikerViewDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"returened data %@",editingInfo);
    _imgCoverImage.image=image;
    
    
    
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
