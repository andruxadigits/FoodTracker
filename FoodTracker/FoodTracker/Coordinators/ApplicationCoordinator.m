//
//  ApplicationCoordinator.m
//  FoodTracker
//
//  Created by hello on 25/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import "ApplicationCoordinator.h"
@interface ApplicationCoordinator()

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *rootViewController;
@property (nonatomic)  MealTableViewCoordinator *mealTableViewCoordinator;
@end

@implementation ApplicationCoordinator
- (instancetype) init:(UIWindow *)window {
    self.window = window;
    self.rootViewController = [ [UINavigationController alloc] init ];
    UIViewController *emptyViewController = [[UIViewController alloc] init];
    emptyViewController.view.backgroundColor = [UIColor whiteColor];
    [self.rootViewController pushViewController:emptyViewController animated:false];
    self.mealTableViewCoordinator = [[MealTableViewCoordinator alloc] initWithPresenter:self.rootViewController meal:nil];
    return self;
}
- (void) start {
    self.window.rootViewController = self.rootViewController;
    [self.mealTableViewCoordinator start];
    [self.window makeKeyAndVisible];
}
@end
