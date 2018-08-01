//
//  MealTableViewController.h
//  FoodTracker
//
//  Created by hello on 17/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Meal;
@import os.log;
@protocol MealTableViewControllerDelegate <NSObject>
-(void) didSelectMealFromTalbeView:(Meal *)selectedMeal;
-(void) saveMeal: (Meal *)selectedMeal;
@end
@interface MealTableViewController : UITableViewController 
@property (nonatomic) NSObject <MealTableViewControllerDelegate> *delegate;
- (void) saveChangesInTableView:(Meal *)changedMeal;
@end
