//
//  ApplicationCoordinator.h
//  FoodTracker
//
//  Created by hello on 25/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coordinator.h"
#import "MealTableViewCoordinator.h"
@interface ApplicationCoordinator: NSObject <Coordinator>
- (instancetype) init:(UIWindow *)window;
@end
