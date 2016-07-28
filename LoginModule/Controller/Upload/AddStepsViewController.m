//
//  AddStepsViewController.m
//  LoginModule
//
//  Created by indianic on 22/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import "AddStepsViewController.h"

@interface AddStepsViewController ()
{
    NSMutableArray *arrMutSteps;
    NSMutableDictionary *dictMutStep;
    int intstepNumber;
    UIImage *stepImage;
    NSString *strSteptepDescription;
    
    UIImagePickerController *imagepicker;
    
}
@end

@implementation AddStepsViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    //initializing all instance objects
    
    arrMutSteps =[NSMutableArray new];
    dictMutStep= [NSMutableDictionary new];
    intstepNumber =0;
    stepImage =[UIImage new];
    strSteptepDescription =[NSString new];
    imagepicker=[UIImagePickerController new];
    
    
    //initializing ImagePickerController
    
    imagepicker=[[UIImagePickerController alloc]init];
    imagepicker.delegate=self;
    [imagepicker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    [imagepicker setAllowsEditing:YES];
    
    
    // Do any additional setup after loading the view.
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
#pragma mark -UIimagePikerViewDelegate-

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"returened data %@",editingInfo);
    _imgStepImage.image=image;
    stepImage=image;
    
    
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark -Button Actions-

- (IBAction)btnSelectImageAction:(UIButton *)sender {
    

    [self presentViewController:imagepicker animated:YES completion:nil];
}


- (IBAction)btnAddStepAction:(UIButton *)sender {
    if ([self validateInputs]) {
        
    
    [dictMutStep setObject:[NSNumber numberWithInt:intstepNumber] forKey:@"stepNumber"];
    [dictMutStep setObject:_imgStepImage.image forKey:@"stepImage"];
    [dictMutStep setObject:_txtStepDescription.text forKey:@"stepDescription"];
    [arrMutSteps addObject:dictMutStep];
    dictMutStep =[NSMutableDictionary new];
    intstepNumber++;
        
    _txtStepDescription.text=@"";
    _imgStepImage.image=nil;
    _lblNumberOfSteps.text=[NSString stringWithFormat:@"%d",intstepNumber];
        NSLog(@"arr print %@",arrMutSteps);
    }
    else{
        NSLog(@"Please enter Something");
    }
}

- (IBAction)barBtnDoneAction:(UIBarButtonItem*)sender {
    if (self._completionHandler)
    {
        
        self._completionHandler(arrMutSteps);
        
    }
}

#pragma mark -Other Methods-

-(BOOL)validateInputs{
    if (_imgStepImage.image==nil || _txtStepDescription.text==nil|| [_txtStepDescription.text isEqual:@""] ) {
        return false;
    }
    else{
        return true;
    }
}
//
@end
