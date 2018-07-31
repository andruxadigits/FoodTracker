//
//  MealTableViewController.h
//  FoodTracker
//
//  Created by hello on 17/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Meal.h"
#import "MealTableViewCell.h"
#import "MealViewController.h"
@import os.log;
@protocol MealTableViewControllerDelegate <NSObject>
-(void) MealTableViewControllerDidSelectMeal:(Meal *)selectedMeal;
-(void) saveMeal: (Meal *)selectedMeal;
@end
@interface MealTableViewController : UITableViewController 
@property (strong,nonatomic) NSObject <MealTableViewControllerDelegate> *delegate;
- (void) editingMeal:(Meal *)meal ;
@end
