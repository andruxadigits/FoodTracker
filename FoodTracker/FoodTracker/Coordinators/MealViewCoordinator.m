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
@property (strong, nonatomic) MealTableViewCoordinator *mealTableViewCoordinator;
@end

@implementation MealViewCoordinator
-(instancetype) initWithPresenter:(UINavigationController *)presenter MealTableViewCoordinator:(MealTableViewCoordinator *)mealTableViewCoordinator Meal:(Meal *)meal{
    self.presenter = presenter;
    self.mealTableViewCoordinator = mealTableViewCoordinator;
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
    [self.mealTableViewCoordinator saveMeal:selectedMeal];
    [self.presenter popViewControllerAnimated:YES];
}



@end
