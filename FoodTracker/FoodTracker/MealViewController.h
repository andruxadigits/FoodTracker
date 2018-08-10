//
//  MealViewController.h
//  FoodTracker
//
//  Created by hello on 12/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Meal;

@import os.log;

@protocol MealViewControllerDelegate <NSObject>
- (void)selectedSaveButton:(Meal *)selectedMeal;
@end

@interface MealViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property(nonatomic) Meal *meal;
@property(nonatomic) NSObject <MealViewControllerDelegate> *delegate;
@end
