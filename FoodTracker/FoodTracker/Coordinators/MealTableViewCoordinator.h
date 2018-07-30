//
//  MealTableViewCoordinator.h
//  FoodTracker
//
//  Created by hello on 25/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coordinator.h"
#import "MealTableViewController.h"
#import "MealViewCoordinator.h"
@interface MealTableViewCoordinator : NSObject <Coordinator>
- (instancetype) initWithPresenter:(UINavigationController *)presenter meal:(Meal *)meal mealIndexPath:(NSIndexPath *)indexPath;
-(void) saveMeal: (Meal *)selectedMeal;
@end
