//
//  SearchByIngredientsViewController.m
//  IosRecipeApp2
//
//  Created by indianic on 24/07/16.
//  Copyright © 2016 indianic. All rights reserved.
//

#import "SearchByIngredientsViewController.h"

@interface SearchByIngredientsViewController ()

@end

@implementation SearchByIngredientsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _selectedNames=[NSMutableSet new];
    _searchedResult = [NSMutableSet new];
   
    //hello
    // navigation bar methods
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"Cochin-Italic" size:21], NSForegroundColorAttributeName: [UIColor redColor]}
    ;


    // registering collection view delegate
    _propIngredientSearchBar.delegate = (id)self;
    
    
    // defining variables of ingredient name, image and selected stated with help of method declared in recipe.m
    _arrCollection = [[NSMutableArray alloc]initWithObjects:[[Recipe alloc]initwithIngredientName:@"Broccoli" andIngredientImage: @"Broccoli" andCheckSelected:@"no"],[[Recipe alloc]initwithIngredientName:@"Cabbage" andIngredientImage: @"Cabbage" andCheckSelected:@"no"],[[Recipe alloc]initwithIngredientName:@"Carrot" andIngredientImage: @"Carrot" andCheckSelected:@"no"],[[Recipe alloc]initwithIngredientName:@"Cauliflower" andIngredientImage: @"Cauliflower" andCheckSelected:@"no"],[[Recipe alloc]initwithIngredientName:@"Corn" andIngredientImage: @"Corn" andCheckSelected:@"no"],[[Recipe alloc]initwithIngredientName:@"Cucumber" andIngredientImage: @"Cucumber" andCheckSelected:@"no"],[[Recipe alloc]initwithIngredientName:@"Eggplant" andIngredientImage: @"Eggplant" andCheckSelected:@"no"],[[Recipe alloc]initwithIngredientName:@"GreenBean" andIngredientImage: @"GreenBean" andCheckSelected:@"no"],[[Recipe alloc]initwithIngredientName:@"Mushroom" andIngredientImage: @"Mushroom" andCheckSelected:@"no"],[[Recipe alloc]initwithIngredientName:@"Onion" andIngredientImage: @"Onion" andCheckSelected:@"no"],[[Recipe alloc]initwithIngredientName:@"Potato" andIngredientImage: @"Potato" andCheckSelected:@"no"],[[Recipe alloc]initwithIngredientName:@"Tomato" andIngredientImage: @"Tomato" andCheckSelected:@"no"], nil];
    
   //setting collection view hidden on load
    _propForImgredientsImages.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setPropIngredientSearchBar:nil];
    [super viewDidUnload];
}

#pragma mark- BMCheckBox Method

-(void)didTapCheckBox:(BEMCheckBox *)checkBox{
   
    _propForImgredientsImages.hidden = NO;
    
    
}

#pragma mark - collection view datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
     
   
    if(self.isFiltered)
        rowCount = _arrfilterCollection.count;
    else
        rowCount = _arrCollection.count;
    
    return rowCount;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SearchIngredientsImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SearchIngredientsImageCollectionViewCell" forIndexPath:indexPath];
    
    cell.layer.cornerRadius = 15.0f;
    cell.layer.masksToBounds = YES;
    
    Recipe *recipe;
    if(_isFiltered)
        recipe = [_arrfilterCollection objectAtIndex:indexPath.row];
    else
        recipe = [_arrCollection objectAtIndex:indexPath.row];
    
    cell.imgSearchByIngredients.image = [UIImage imageNamed:recipe.ingredientsImages];
    cell.lblSearchByIngredientName.text = recipe.ingredientsNames;
 

    

        if ([recipe.isSelected  isEqual: @"yes"])
       {
            cell.alpha=0.5f;
           
           [_selectedNames addObject: recipe.ingredientsNames];

       }
        else if([recipe.isSelected  isEqual: @"no"])
        {
            
            cell.alpha=1.0f;

                [_selectedNames removeObject:recipe.ingredientsNames];
            
            
            [_searchedResult removeObject:recipe.ingredientsNames];
         }
    
    
       for (NSMutableString *imgNames in _selectedNames)
       {
           [_searchedResult addObject:imgNames];
       }
    
//    NSLog(@"selected names are %@", _selectedNames);
//    NSLog(@"searched result for image %@", _searchedResult);
    return cell;
}


#pragma mark - search filtering method

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    
    //searching ie filtering searched content from table methods
    
  
   _searchWords = (NSMutableArray *)[text componentsSeparatedByString:@","];
   
    NSString *searchString;
    
    for (int i =0;i<_searchWords.count;i++){
        
        searchString = _searchWords[i];
    }

    if(_searchWords.count == 0)
    {
        _isFiltered = FALSE;
    }
    else
    {
        _isFiltered = true;
        _arrfilterCollection = [[NSMutableArray alloc] init];
        
        for (Recipe *recipe in _arrCollection)
        {
            NSRange nameRange = [recipe.ingredientsNames rangeOfString:searchString options:NSCaseInsensitiveSearch];
            NSRange descriptionRange = [recipe.description rangeOfString:searchString options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound || descriptionRange.location != NSNotFound)
            {
                [_arrfilterCollection addObject:recipe];
            }
        }
    }
    
    [self.propForImgredientsImages reloadData];
    

    for (NSMutableString *searchedNames in _searchWords)
    {
        [_searchedResult addObject:searchedNames];
    }
    
//    NSLog(@"searchedResult set is %@", _searchedResult);
    
}



#pragma mark- collection view delegate methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
     Recipe *recipe;
    
    if(_isFiltered)
        recipe = [_arrfilterCollection objectAtIndex:indexPath.row];
    else
        recipe = [_arrCollection objectAtIndex:indexPath.row];


    if ([recipe.isSelected  isEqual: @"yes"])
    {
        recipe.isSelected = @"no";
    }
    else if([recipe.isSelected  isEqual: @"no"])
    {
        recipe.isSelected = @"yes";
    }


    [_propForImgredientsImages reloadData];
    
}


#pragma mark - navigation pop method

- (IBAction)btnBack:(UIBarButtonItem *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnDone:(UIButton *)sender {
    
    IngredientResultVC *ingrVC = [self.storyboard instantiateViewControllerWithIdentifier:@"IngredientResultVC"];
    [self.navigationController pushViewController:ingrVC animated:YES];
    Recipe *recipe;
    ingrVC.recipe = recipe;
    ingrVC.searchedResult = _searchedResult;
 
}
@end
