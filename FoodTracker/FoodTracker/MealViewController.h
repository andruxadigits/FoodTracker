//
//  MealViewController.h
//  FoodTracker
//
//  Created by hello on 12/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingControl.h"
#import "Meal.h"
//#import "MealTableViewController.h"
@import os.log;
@protocol MealViewControllerDelegate <NSObject>
-(void) MealViewControllerSaveButton: (Meal *)selectedMeal;
@end
@interface MealViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property(nonatomic) Meal *meal;
@property(weak,nonatomic) NSObject <MealViewControllerDelegate> *delegate;
//@property(weak,nonatomic) NSObject <MealTableViewControllerDelegate> *delegate;
@end
