//
//  MealViewCoordinator.m
//  FoodTracker
//
//  Created by hello on 26/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import "MealViewCoordinator.h"
#import "MealViewController.h"
#import "MealTableViewCoordinator.h"
#import "MealTableViewController.h"

@interface MealViewCoordinator () <MealViewControllerDelegate>
@property(nonatomic) UINavigationController *presenter;
@property(nonatomic) MealViewController *mealViewController;
@property(nonatomic) Meal *meal;
@end

@implementation MealViewCoordinator
- (instancetype)initWithPresenter:(UINavigationController *)presenter Meal:(Meal *)meal {
    self = [super init];
    if (self) {
        self.presenter = presenter;
        self.meal = meal;
    }
    return self;
}

- (void)start {
    MealViewController *mealViewController = [[MealViewController alloc] initWithNibName:nil bundle:nil];
    [mealViewController setMeal:self.meal];
    self.mealViewController = mealViewController;
    self.mealViewController.delegate = self;
    [self.presenter pushViewController:mealViewController animated:true];
}

- (void)selectedSaveButton:(Meal *)selectedMeal {
    [self.delegate saveMeal:selectedMeal];
    [self.mealViewController dismissViewControllerAnimated:true completion:nil];
    [self.presenter popViewControllerAnimated:YES];
}

@end
