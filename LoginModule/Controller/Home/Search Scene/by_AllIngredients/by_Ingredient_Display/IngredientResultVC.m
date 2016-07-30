//
//  IngredientResultVC.m
//  IosRecipeApp2
//
//  Created by indianic on 29/07/16.
//  Copyright © 2016 indianic. All rights reserved.
//

#import "IngredientResultVC.h"

@interface IngredientResultVC ()

@end

@implementation IngredientResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setting all needed values that are to be used and displayed with help of method defined in recipe.m
    
    _allData = [[NSMutableArray alloc] initWithObjects:
                     [[Recipe alloc] initWithName:@"Chole Puri" andImage:@"homecholepuri" andCookingTime: @"30 min" andServes:@"2-3" andLocation: @"India" andAuthor: @"Himani" andIngredients: [NSMutableArray arrayWithObjects:@"tomato gravy", @"olive oil", @"onion", @"garlic cloves", @"hot vegetable stock", @"salt and pepper", @"butter", nil] andingredientsQuantity:[NSMutableArray arrayWithObjects:@"2 cups",@"2tb",@"1",@"2",@"1.2l",@"a pinch",@"25g", nil]  andstepDescription: [NSMutableArray arrayWithObjects:@"rinse and soak the chole \n  (chickpeas) in enough \n water overnight",@"to give a dark color to \n the chana are added",@"season with salt \n and pressure cook the \n chana for 18 to 20 \n whistles",@"heat oil add \n ginger-garlic paste \n and saute till their raw \n aroma goes away",@"add tomatoes & \n saute them till \n they soften",@"add the cooked chole and garnish chole masala with coriander leaves", nil] andstepImages: [NSMutableArray arrayWithObjects:@"recipe1.1", @"recipe1.2",@"recipe1.3",@"recipe1.4",@"recipe1.5",@"recipe1.6", nil] andstepNos: [NSMutableArray arrayWithObjects: @"butter",@"Chilly Powder", nil]],
                     
                     [[Recipe alloc] initWithName:@"Pav Bhaji" andImage:@"homepavbhaji" andCookingTime: @"45 min" andServes:@"3-4" andLocation: @"India" andAuthor: @"Avani" andIngredients: [NSMutableArray arrayWithObjects:@"tomato gravy", @"olive oil",@"onion", @"garlic cloves", @"hot vegetable stock", @"salt and pepper", @"butter", nil] andingredientsQuantity:[NSMutableArray arrayWithObjects:@"2 cups",@"2tb",@"1",@"2",@"1.2l",@"a pinch",@"25g", nil] andstepDescription: [NSMutableArray arrayWithObjects:@"Steam or cook all the \n vegetables except onions, \n tomatoes and capsicum \n in a pressure cooker", @"In a pan, melt butter", @"add the ginger-garlic \n paste, tomato gravy, \n capsicums and onions", @"Then add the chilly \n powder, turmeric \n powder and pav \n bhaji masala", @"Now add the mashed vegetables", nil] andstepImages: [NSMutableArray arrayWithObjects:@"recipe2.1", @"recipe2.2",@"recipe2.3",@"recipe2.4", nil] andstepNos: [NSMutableArray arrayWithObjects: @"butter",@"Chilly Powder", nil]],
                     
                     [[Recipe alloc] initWithName:@"Panner Butter /n Masala" andImage:@"homepaneerbuttermasala" andCookingTime: @"1 hour" andServes:@"3-4" andLocation: @"India" andAuthor: @"Shell" andIngredients: [NSMutableArray arrayWithObjects:@"pavs", @"potatos", @"garlic cloves", @"ginger", @"grams chana floor", @"Vegetable oil", nil] andingredientsQuantity:[NSMutableArray arrayWithObjects:@"2",@"100g",@"2",@"2",@"150",@"2tb", nil] andstepDescription: [NSMutableArray arrayWithObjects:@"1 pack of Instant Noodle",@"Chilly Powder", nil] andstepImages: [NSMutableArray arrayWithObjects:@"recipe1.1", @"recipe1.2",@"recipe1.3",@"recipe1.4", nil] andstepNos: [NSMutableArray arrayWithObjects: @"butter",@"Chilly Powder", nil]],
                     
                     [[Recipe alloc] initWithName:@"Pani Puri" andImage:@"homepanipuri" andCookingTime: @"1 hour" andServes:@"13-14" andLocation: @"India" andAuthor: @"Himani" andIngredients: [NSMutableArray arrayWithObjects:@"panner", @"onion", @"butter", @"tomato gravy", @"dry mustard", @"Salt and pepper", nil] andingredientsQuantity:[NSMutableArray arrayWithObjects:@"400",@"1/4",@"1tb",@"2cups",@"1",@"a pinch", nil] andstepDescription: [NSMutableArray arrayWithObjects:@"1 pack of Instant Noodle",@"Chilly Powder", nil] andstepImages: [NSMutableArray arrayWithObjects:@"recipe1.1", @"recipe1.2",@"recipe1.3",@"recipe1.4", nil] andstepNos: [NSMutableArray arrayWithObjects: @"butter",@"Chilly Powder", nil]],
                     
                     [[Recipe alloc] initWithName:@"Tomato Soup" andImage:@"RecipeTomatoSoup" andCookingTime: @"40 mins" andServes:@"2-3" andLocation: @"India" andAuthor: @"Himani" andIngredients: [NSMutableArray arrayWithObjects:@"tomato gravy", @"hot water", @"garlic cloves", @"pepper", @"cream", nil] andingredientsQuantity:[NSMutableArray arrayWithObjects:@"1 cups",@"2 cups",@"1",@"a pinch",@"25g", nil] andstepDescription: [NSMutableArray arrayWithObjects:@"1 pack of Instant Noodle",@"Chilly Powder", nil] andstepImages: [NSMutableArray arrayWithObjects:@"recipe1.1", @"recipe1.2",@"recipe1.3",@"recipe1.4", nil] andstepNos: [NSMutableArray arrayWithObjects: @"butter",@"Chilly Powder", nil]],
                     
                     [[Recipe alloc] initWithName:@"Chocolate Cake" andImage:@"chocolatecake" andCookingTime: @"40 mins" andServes:@"7-8" andLocation: @"India" andAuthor: @"Himani" andIngredients: [NSMutableArray arrayWithObjects:@"tomato gravy", @"oil", @"onion chopped", @"garlic cloves", @"hot vegetable stock", @"salt and pepper", @"butter", nil] andingredientsQuantity:[NSMutableArray arrayWithObjects:@"2 cups",@"2tb",@"1",@"2",@"1.2l",@"a pinch",@"25g", nil] andstepDescription: [NSMutableArray arrayWithObjects:@"1 pack of Instant Noodle",@"Chilly Powder", nil] andstepImages: [NSMutableArray arrayWithObjects:@"recipe1.1", @"recipe1.2",@"recipe1.3",@"recipe1.4", nil] andstepNos: [NSMutableArray arrayWithObjects: @"butter",@"Chilly Powder", nil]],
                     [[Recipe alloc] initWithName:@"Coffee" andImage:@"coffee" andCookingTime: @"10 mins" andServes:@"1-2" andLocation: @"India" andAuthor: @"Himani" andIngredients: [NSMutableArray arrayWithObjects:@"whole milk", @"white chocolate chips", @"coffee", @"cream", nil] andingredientsQuantity:[NSMutableArray arrayWithObjects:@"2/3 cups",@"6tb",@"1tb",@"2tb", nil]andstepDescription: [NSMutableArray arrayWithObjects:@"Add instant \n coffee powder",@"Add hot water \n and milk",@"Add cream", nil] andstepImages: [NSMutableArray arrayWithObjects:@"recipecoffee1", @"recipecoffee2",@"recipecoffee3", nil] andstepNos: [NSMutableArray arrayWithObjects: @"butter",@"Chilly Powder", nil]],
                     [[Recipe alloc] initWithName:@"Pizza" andImage:@"pizza" andCookingTime: @"45 mins" andServes:@"4-5" andLocation: @"India" andAuthor: @"Himani" andIngredients: [NSMutableArray arrayWithObjects:@"cups flour", @"baking powder", @"teaspoon salt", @"beaten eggs", @"cup sugar", @"melted white chocolate", @"cup milk", nil] andingredientsQuantity:[NSMutableArray arrayWithObjects:@"3 1/4 cups",@"2tb",@"1/4",@"2",@"2/3 cup",@"2 ounce",@"1/2", nil] andstepDescription: [NSMutableArray arrayWithObjects:@"1 pack of Instant Noodle",@"Chilly Powder", nil] andstepImages: [NSMutableArray arrayWithObjects:@"recipe1.1", @"recipe1.2",@"recipe1.3",@"recipe1.4", nil] andstepNos: [NSMutableArray arrayWithObjects: @"butter",@"Chilly Powder", nil]],
                     
                     [[Recipe alloc] initWithName:@"Instant Noodles" andImage:@"maggi" andCookingTime: @"20 mins" andServes:@"4-5" andLocation: @"India" andAuthor: @"Himani" andIngredients: [NSMutableArray arrayWithObjects:@"Instant Noodle",@"Chilly Powder", nil] andingredientsQuantity:[NSMutableArray arrayWithObjects:@"1",@"a pinch", nil] andstepDescription: [NSMutableArray arrayWithObjects:@"1 pack of Instant Noodle",@"Chilly Powder", nil] andstepImages: [NSMutableArray arrayWithObjects:@"recipe1.1", @"recipe1.2",@"recipe1.3",@"recipe1.4", nil] andstepNos: [NSMutableArray arrayWithObjects: @"butter",@"Chilly Powder", nil]], nil];

    _finalResult = [NSMutableArray array];
    _ingredientsText = [[NSMutableArray alloc]init];
    _temp = [[NSMutableArray alloc]init];
    _thisData = [[NSMutableArray alloc]init];
 


    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"searched result set is %@", _searchedResult);
    for (NSString* searchString in _searchedResult) {
            [_finalResult addObject:searchString];
        }

  
      for (int i=0; i<_allData.count; i++)
      {
            Recipe *recipe = _allData[i];
            _ingredientsText = [[NSMutableArray alloc]init];
  
            for (NSString* andIngredients in recipe.ingredients)
            {
               
                [_ingredientsText addObject:andIngredients];
            }
          
           _ingredientsQuantity = [[NSMutableArray alloc]init];
            for (NSString* andingredientsQuantity in recipe.ingredientsQuantity)
            {
              [_ingredientsQuantity addObject:andingredientsQuantity];
            }
          
           _stepDescription = [[NSMutableArray alloc]init];
            for (NSString* andstepDescription in recipe.stepDescription)
            {
              [_stepDescription addObject:andstepDescription];
            }
          
           _stepImages = [[NSMutableArray alloc]init];
            for (NSString* andstepImages in recipe.stepImages)
            {
              [_stepImages addObject:andstepImages];
            }
          

            for (int i=0; i<_finalResult.count; i++)
            {
                BOOL isPresent;
                NSMutableString *smallCase = (NSMutableString*)[_finalResult[i] lowercaseString];

                if([_ingredientsText containsObject:smallCase])
                {
                    isPresent = true;
                 
                   
                    _matched = [[NSMutableArray alloc] initWithObjects:@{@"quantity":_ingredientsQuantity},@{@"name":recipe.name},@{@"time":recipe.cookingTime},@{@"serves":recipe.serves},@{@"location":recipe.location},@{@"cover":recipe.image},@{@"author":recipe.authorname},@{@"stepDesc":_stepDescription},@{@"stepImg":_stepImages},nil];

                    
                    
                   // NSLog(@"matched is %@",_matched);
                    
                    
                    [_temp addObject:_matched];
//                    NSLog(@"temp for 1 %@", _temp);
                    
                }
            }

       }
    
    for (int i =0; i<_temp.count; i++) {
        NSLog(@"temp for %d %@",i,_temp[i]);
    }
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //checking if person is on view controller or on search bar
    return _temp.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //instantiating custom cell of table view
    
    static NSString *CellIdentifier = @"IngredientResultTableViewCell";
    
    IngredientResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[IngredientResultTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
   
     
    NSLog(@"temp %@", [[_temp objectAtIndex:0]valueForKey:@"name"]);

        NSLog(@"temp %@", [[_temp objectAtIndex:indexPath.row] valueForKey:@"name"]);

   
    
 
    // Configure the cell...
    
    cell.backgroundColor = [UIColor whiteColor];
    
    //image view of cell
    cell.imgCover.image = [UIImage imageNamed:[_temp objectAtIndex:indexPath.row][@"cover"]];
    NSLog(@" image %@",[_temp objectAtIndex:indexPath.row][@"cover"]);
    
    //side view of cell
    cell.resultDescView.backgroundColor = [[UIColor brownColor]colorWithAlphaComponent:0.4];
    
    // recipe name label
    cell.ingresultRecipeName.text = [_temp objectAtIndex:indexPath.row][@"name"];
    NSLog(@"name %@",[_matched objectAtIndex:indexPath.row][@"name"]);
    cell.ingresultRecipeName.textColor = [UIColor whiteColor];
    cell.ingresultRecipeName.font = [UIFont fontWithName:@"Cochin-Italic" size:25.0f];
    cell.ingresultRecipeName.numberOfLines = 2;
    cell.ingresultRecipeName.textAlignment = NSTextAlignmentCenter;
    cell.ingresultRecipeName.userInteractionEnabled = false;
    
    //recipe cooking time label
    cell.ingresultRecipeCookTime.text = [_temp objectAtIndex:indexPath.row][@"time"];
    NSLog(@"time %@",[_temp objectAtIndex:indexPath.row][@"time"]);
    cell.ingresultRecipeCookTime.textColor = [UIColor whiteColor];
    cell.ingresultRecipeCookTime.font = [UIFont fontWithName:@"Cochin-Italic" size:20.0f];
    cell.ingresultRecipeCookTime.userInteractionEnabled = false;
    
    //recipe serves label
    cell.ingrrecipeResultServes.text = [_temp objectAtIndex:indexPath.row][@"serves"];
    cell.ingrrecipeResultServes.textColor = [UIColor whiteColor];
    cell.ingrrecipeResultServes.font = [UIFont fontWithName:@"Cochin-Italic" size:20.0f];
    cell.ingrrecipeResultServes.userInteractionEnabled = false;
    
    return cell;
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

@end
