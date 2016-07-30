//
//  SearchByIngredientsViewController.h
//  IosRecipeApp2
//
//  Created by indianic on 24/07/16.
//  Copyright © 2016 indianic. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <BEMCheckBox.h>
#import "SearchIngredientsImageCollectionViewCell.h"
#import "Recipe.h"
#import "SearchVCTableViewController.h"
#import "IngredientResultVC.h"

@interface SearchByIngredientsViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource> {
    
    NSInteger rowCount;
    


}///
@property (strong,nonatomic) NSMutableSet *searchedResult;
@property (strong,nonatomic)  NSMutableString *finalString;
@property (strong,nonatomic) NSMutableArray *searchWords;
@property (strong,nonatomic) NSMutableSet *selectedNames;
@property (strong, nonatomic) IBOutlet UICollectionView *propForImgredientsImages;
@property (strong, nonatomic) IBOutlet UIButton *btnIngredientVCDone;

@property (strong, nonatomic) IBOutlet UISearchBar *propIngredientSearchBar;

@property (strong, nonatomic) NSMutableArray* arrCollection;

@property (strong, nonatomic) NSMutableArray* arrfilterCollection;

@property (nonatomic, assign) bool isFiltered;

@property (strong, nonatomic) Recipe *recipe;

- (IBAction)btnBack:(UIBarButtonItem *)sender;
- (IBAction)btnDone:(UIButton *)sender;

@end

