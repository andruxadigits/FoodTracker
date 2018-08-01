//
//  ApplicationCoordinator.m
//  FoodTracker
//
//  Created by hello on 25/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import "ApplicationCoordinator.h"
#import "MealTableViewCoordinator.h"
@interface ApplicationCoordinator()
@property (nonatomic) UIWindow *window;
@property (nonatomic) UINavigationController *rootViewController;
@property (nonatomic) MealTableViewCoordinator *mealTableViewCoordinator;
@end

@implementation ApplicationCoordinator
- (instancetype) initWithWindow:(UIWindow *)window {
    self = [super init];
    if (self) {
        self.window = window;
        self.rootViewController = [ [UINavigationController alloc] init ];
        UIViewController *emptyViewController = [[UIViewController alloc] init];
        emptyViewController.view.backgroundColor = [UIColor whiteColor];
        [self.rootViewController pushViewController:emptyViewController animated:false];
        self.mealTableViewCoordinator = [[MealTableViewCoordinator alloc] initWithPresenter:self.rootViewController];
    }
    return self;
}
- (void) start {
    self.window.rootViewController = self.rootViewController;
    [self.mealTableViewCoordinator start];
    [self.window makeKeyAndVisible];
}
@end
