//
//  MealViewCoordinator.h
//  FoodTracker
//
//  Created by hello on 26/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"
#import "MealViewController.h"
#import "MealTableViewController.h"
@interface MealViewCoordinator : NSObject <Coordinator>
-(instancetype) initWithPresenter:(UINavigationController *)presenter Meal:(Meal *)meal;
@end
