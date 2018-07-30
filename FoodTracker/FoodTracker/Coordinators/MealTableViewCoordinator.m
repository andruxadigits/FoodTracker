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
@property (strong, nonatomic) NSIndexPath *mealIndexPath;
@property (strong, nonatomic) Meal *meal;
@end
@implementation MealTableViewCoordinator

- (instancetype) initWithPresenter:(UINavigationController *)presenter meal:(Meal *)meal mealIndexPath:(NSIndexPath *)indexPath{
    self.presenter = presenter;
    self.meal = meal;
    self.mealIndexPath = indexPath;
    return self;
}
- (void) start {
    self.mealTableViewController = [[MealTableViewController alloc] initWithNibName:nil bundle:nil];
    [self.presenter pushViewController:self.mealTableViewController animated:true];
    self.mealTableViewController.delegate = self;
}
-(void) MealTableViewControllerDidSelectMeal:(Meal *)selectedMeal indexPath:(NSIndexPath *)indexPath{
    MealViewCoordinator *mealViewCoordinator = [[MealViewCoordinator alloc] initWithPresenter:self.presenter MealTableViewCoordinator:self Meal:selectedMeal];
    [mealViewCoordinator start];
    self.mealIndexPath = indexPath;
    self.mealViewCoordinator = mealViewCoordinator;    
}
-(void) saveMeal: (Meal *)selectedMeal {
    [self.mealTableViewController editingMeal:selectedMeal];
}
@end

