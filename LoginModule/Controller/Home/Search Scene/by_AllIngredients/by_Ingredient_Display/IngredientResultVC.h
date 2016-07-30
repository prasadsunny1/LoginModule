//
//  IngredientResultVC.h
//  IosRecipeApp2
//
//  Created by indianic on 29/07/16.
//  Copyright © 2016 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"
#import "SearchByIngredientsViewController.h"
#import "SearchVCTableViewController.h"
#import "IngredientResultTableViewCell.h"

@interface IngredientResultVC : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *propingRecipeTBView;
@property (strong, nonatomic) Recipe *recipe;
@property (strong,nonatomic) NSMutableSet *searchedResult;
@property (strong,nonatomic) NSMutableArray *finalResult;
@property (strong,nonatomic) NSMutableArray *allData;
@property (strong,nonatomic) NSMutableArray *temp;
@property (strong,nonatomic) NSMutableArray *matched;
@property (strong,nonatomic) NSMutableArray *ingredientsText;
@property (strong,nonatomic) NSMutableArray *ingredientsQuantity;
@property (strong,nonatomic) NSMutableArray *stepDescription;
@property (strong,nonatomic) NSMutableArray *stepImages;

@property (strong,nonatomic) NSMutableArray *thisData;

@end
