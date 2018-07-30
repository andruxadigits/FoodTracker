//
//  MealViewCoordinator.h
//  FoodTracker
//
//  Created by hello on 26/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coordinator.h"
#import "MealViewController.h"
#import "MealTableViewCoordinator.h"
@interface MealViewCoordinator : NSObject <Coordinator>
-(instancetype) initWithPresenter:(UINavigationController *)presenter MealTableViewCoordinator:(NSObject *)mealTableViewCoordinator Meal:(Meal *)meal;
@end
