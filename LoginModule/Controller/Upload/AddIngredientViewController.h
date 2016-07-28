//
//  AddIngredientViewController.h
//  LoginModule
//
//  Created by indianic on 22/07/16.
//  Copyright © 2016 creativeIOS. All rights reserved.
//

#import <UIKit/UIKit.h>


//@protocol protocolIngrident <NSObject>
//
//-(void)sendData;
//
//@end

@interface AddIngredientViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) void (^_completionHandler)(NSMutableArray *someParameter);
//@property (strong,nonatomic)  id  <protocolIngrident> delegate;

@property (weak, nonatomic) IBOutlet UITextField *txtFIngredientName;

@property (weak, nonatomic) IBOutlet UITextField *txtFQuantity;

@property (weak, nonatomic) IBOutlet UIButton *btnAdd;

@property (weak, nonatomic) IBOutlet UITableView *tableIngredient;

@end
