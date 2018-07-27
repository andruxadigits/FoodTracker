//
//  MealTableViewCoordinator.m
//  FoodTracker
//
//  Created by hello on 25/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import "MealTableViewCoordinator.h"
@interface MealTableViewCoordinator()<MealTableViewControllerDelegate>
@property (strong, nonatomic) UINavigationController *presenter;
@property (strong, nonatomic) MealTableViewController *mealTableViewController;
@property (strong, nonatomic) MealViewCoordinator *mealViewCoordinator;
@end
@implementation MealTableViewCoordinator

- (instancetype) initWithPresenter:(UINavigationController *)presenter {
    self.presenter = presenter;
    return self;
}
- (void) start {
    self.mealTableViewController = [[MealTableViewController alloc] initWithNibName:nil bundle:nil];
    [self.presenter pushViewController:self.mealTableViewController animated:true];
    self.mealTableViewController.delegate = self;
}
-(void) MealTableViewControllerDidSelectMeal:(Meal *)selectedMeal {
    MealViewCoordinator *mealViewCoordinator = [[MealViewCoordinator alloc] initWithPresenter:self.presenter Meal:selectedMeal];
    [mealViewCoordinator start];
    self.mealViewCoordinator = mealViewCoordinator;
    
}
@end

