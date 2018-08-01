//
//  MealTableViewCell.h
//  FoodTracker
//
//  Created by hello on 17/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingControl.h"

@interface MealTableViewCell : UITableViewCell

@property (nonatomic) UIImageView *photoImageView;
@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) RatingControl *ratingControl;
@end
