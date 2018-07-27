//
//  MealViewCoordinator.m
//  FoodTracker
//
//  Created by hello on 26/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import "MealViewCoordinator.h"
@interface MealViewCoordinator()
@property (strong, nonatomic) UINavigationController *presenter;
@property (strong, nonatomic) MealViewController *mealViewController;
@property (strong, nonatomic) MealTableViewController *mealTableViewController;
@property (strong, nonatomic) Meal *meal;

@end

@implementation MealViewCoordinator

-(instancetype) initWithPresenter:(UINavigationController *)presenter Meal:(Meal *)meal{
    self.presenter = presenter;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.presenter.navigationBar.heightAnchor  constraintEqualToConstant:10.0f],
                                              ]];
    self.meal = meal;
    return self;
}
-(void) start {
    MealViewController *mealViewController = [[MealViewController alloc] initWithNibName:nil bundle:nil];
    mealViewController.meal = self.meal;
    self.mealViewController = mealViewController;
    [self.presenter pushViewController:mealViewController animated:true];
    self.mealViewController = mealViewController;
}

@end
