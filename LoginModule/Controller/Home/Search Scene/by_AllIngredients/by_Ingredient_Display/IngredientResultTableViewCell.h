//
//  IngredientResultTableViewCell.h
//  IosRecipeApp2
//
//  Created by indianic on 29/07/16.
//  Copyright © 2016 indianic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IngredientResultTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgCover;
@property (strong, nonatomic) IBOutlet UIView *resultDescView;
@property (strong, nonatomic) IBOutlet UILabel *ingresultRecipeName;
@property (strong, nonatomic) IBOutlet UILabel *ingresultRecipeCookTime;
@property (strong, nonatomic) IBOutlet UILabel *ingrrecipeResultServes;
@property (strong, nonatomic) IBOutlet UIButton *btnfavourite;
- (IBAction)btnFavourite:(UIButton *)sender;

@end
