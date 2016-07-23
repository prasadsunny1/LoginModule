//
//  UploadYourRecipeViewController.m
//  LoginModule
//
//  Created by indianic on 22/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import "UploadYourRecipeViewController.h"
#import "AddIngredientViewController.h"

@interface UploadYourRecipeViewController ()
{
    NSMutableDictionary *dictRecipe;

}
@end

@implementation UploadYourRecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dictRecipe=[[NSMutableDictionary alloc]init];
    //object of other class
    AddIngredientViewController *objaddIngredient =[[AddIngredientViewController alloc]init];
    objaddIngredient.delegate=self;
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

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
        }];
    }
}



#pragma mark -Button Actions



- (IBAction)btnAddCoverImage:(UIButton *)sender {
}


- (IBAction)btnAddIngredientsAction:(UIButton *)sender {
    
    
}

- (IBAction)btnAddVideoAction:(UIButton *)sender {
}

- (IBAction)btnAddStepsAction:(UIButton *)sender {
}


- (IBAction)btnUploadAction:(UIButton *)sender {
    [self CollectData];
    
}


#pragma mark -Delegate Methods


-(void)sendData{
    
    NSLog(@"delegate called");
    
}


#pragma mark -Collect Data-

-(void)CollectData{
    
}
@end
