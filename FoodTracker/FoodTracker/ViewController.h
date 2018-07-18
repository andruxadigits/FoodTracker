//
//  ViewController.h
//  FoodTracker
//
//  Created by hello on 12/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingControl.h"
#import "Meal.h"
@import os.log;

@interface ViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property Meal *meal;

@end

