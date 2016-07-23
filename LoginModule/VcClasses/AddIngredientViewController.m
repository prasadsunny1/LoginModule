//
//  AddIngredientViewController.m
//  LoginModule
//
//  Created by indianic on 22/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import "AddIngredientViewController.h"

@interface AddIngredientViewController ()
{
    NSMutableArray *arrMutIngredient;
    NSMutableDictionary *dictMutIngredient;

}
-(BOOL)validateTextFields;
@end

@implementation AddIngredientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrMutIngredient = [NSMutableArray new];
    dictMutIngredient = [NSMutableDictionary new];
    
    
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
#pragma mark -Table Delegate Methods-

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrMutIngredient.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *acell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    acell.textLabel.text=arrMutIngredient[indexPath.row][@"name"];
    acell.detailTextLabel.text=arrMutIngredient[indexPath.row][@"quantity"];
  
    return acell;
}


#pragma mark -Button Action-

- (IBAction)btnAddAction:(UIButton *)sender {
    
    if ([self validateTextFields]) {
        
    [dictMutIngredient setObject:_txtFQuantity.text forKey:@"quantity"];
    [dictMutIngredient setObject:_txtFIngredientName.text forKey:@"name"];
    [arrMutIngredient addObject:dictMutIngredient];
        dictMutIngredient = [NSMutableDictionary new];
    [_tableIngredient reloadData];
    

        _txtFQuantity.text=@"";
        _txtFIngredientName.text=@"";
        
    }
    

}

- (IBAction)btnDoneAction:(UIBarButtonItem *)sender {
    
    if (self._completionHandler)
    {
        
        self._completionHandler(arrMutIngredient);
        [self.navigationController popViewControllerAnimated:true];
    }
}


#pragma mark -Collect Data-
-(void)CollectData{
  //not used now
  
}

#pragma mark -Other Method-
-(BOOL)validateTextFields{
    if ([_txtFIngredientName.text isEqual:@""] || [_txtFIngredientName.text isEqual:@" "] || [_txtFQuantity.text isEqual:@""] || [_txtFQuantity.text isEqual:@""]) {
        return false;
    }
    else{
        return true;
    }
}
@end
