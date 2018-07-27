//
//  MealTableViewCell.m
//  FoodTracker
//
//  Created by hello on 17/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import "MealTableViewCell.h"

@implementation MealTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.photoImageView = [self setupPhotoImage];
    self.nameLabel = [self setupNameLabel];
    self.ratingControl = [self setupRatingControl];
    [self.heightAnchor constraintEqualToConstant:90].active = true;
    
    // Initialization code
}
- (UIImageView *) setupPhotoImage{
    //todo:
    // NSLayoutConstraints read read and read
    UIImageView *photoImage =[[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 90.0f, 90.0f)];
    [self addSubview:photoImage];
    return photoImage;
}
- (UILabel *) setupNameLabel{
    UILabel *nameLabel =[[UILabel alloc] initWithFrame:CGRectMake(100, 8, 250, 20)];
    [self addSubview:nameLabel];
    return nameLabel;
}
- (RatingControl *) setupRatingControl{
    RatingControl *ratingControl =[[RatingControl alloc] initWithFrame:CGRectMake(100, 40, 250, 40)];
    [self addSubview:ratingControl];
    return ratingControl;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
