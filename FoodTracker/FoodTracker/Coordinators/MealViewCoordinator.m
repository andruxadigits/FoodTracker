//
//  MealViewCoordinator.m
//  FoodTracker
//
//  Created by hello on 26/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import "MealViewCoordinator.h"
@interface MealViewCoordinator()<MealViewControllerDelegate>
@property (strong, nonatomic) UINavigationController *presenter;
@property (strong, nonatomic) MealViewController *mealViewController;
@property (strong, nonatomic) Meal *meal;
@end
@implementation MealViewCoordinator
-(instancetype) initWithPresenter:(UINavigationController *)presenter Meal:(Meal *)meal{
    self.presenter = presenter;
    self.meal = meal;
    return self;
}
-(void) start {
    MealViewController *mealViewController = [[MealViewController alloc] initWithNibName:nil bundle:nil];
    [mealViewController setMeal:self.meal];
    self.mealViewController = mealViewController;
    [self.presenter pushViewController:mealViewController animated:true];
    self.mealViewController.delegate = self;
    
}
-(void) MealViewControllerSaveButton: (Meal *)selectedMeal {
    [self.delegate saveMeal:selectedMeal];
    [self.mealViewController  dismissViewControllerAnimated:true completion:nil];
    [self.presenter popViewControllerAnimated:YES];
}

@end
