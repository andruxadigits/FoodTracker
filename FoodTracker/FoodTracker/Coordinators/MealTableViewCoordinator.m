//
//  MealTableViewCoordinator.m
//  FoodTracker
//
//  Created by hello on 25/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import "MealTableViewCoordinator.h"
#import "Coordinator.h"
#import "MealTableViewController.h"
#import "MealViewCoordinator.h"
@interface MealTableViewCoordinator()<MealTableViewControllerDelegate>
@property (nonatomic) UINavigationController *presenter;
@property (nonatomic) MealTableViewController *mealTableViewController;
@end
@implementation MealTableViewCoordinator
- (instancetype) initWithPresenter:(UINavigationController *)presenter {
    self = [super init];
    if (self)
        self.presenter = presenter;
    return self;
}
- (void) start {
    self.mealTableViewController = [[MealTableViewController alloc] initWithNibName:nil bundle:nil];
    self.mealTableViewController.delegate = self;
    [self.presenter pushViewController:self.mealTableViewController animated:true];
}
-(void) didSelectMealFromTalbeView:(Meal *)selectedMeal {
    MealViewCoordinator *mealViewCoordinator = [[MealViewCoordinator alloc] initWithPresenter:self.presenter Meal:selectedMeal];
    mealViewCoordinator.delegate = self;
    [mealViewCoordinator start];
}
-(void) saveMeal: (Meal *)selectedMeal {
    [self.mealTableViewController saveChangesInTableView:selectedMeal];
}
@end

