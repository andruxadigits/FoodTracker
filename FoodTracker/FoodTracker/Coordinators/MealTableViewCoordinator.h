//
//  MealTableViewCoordinator.h
//  FoodTracker
//
//  Created by hello on 25/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coordinator.h"
@interface MealTableViewCoordinator : NSObject <Coordinator>
- (instancetype) initWithPresenter:(UINavigationController *)presenter;
@end
