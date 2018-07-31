//
//  AppDelegate.h
//  FoodTracker
//
//  Created by hello on 12/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplicationCoordinator.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) ApplicationCoordinator *applicationCoordinator;

@end

