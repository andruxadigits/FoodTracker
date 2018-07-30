//
//  MealTableViewCell.m
//  FoodTracker
//
//  Created by hello on 17/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import "MealTableViewCell.h"

@implementation MealTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.nameLabel = [self setupNameLabel];
        [self.contentView addSubview:self.nameLabel];
        self.ratingControl = [self setupRatingControl];
        [self.contentView addSubview:self.ratingControl];
        self.photoImageView = [self setupPhotoImage];
        [self.contentView addSubview:self.photoImageView];
        CGFloat cellHeight = MAX([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)/6;
        CGFloat cellSpacing = cellHeight / 10;
        [self.nameLabel setFont:[UIFont systemFontOfSize:cellHeight/5]];
        
        [NSLayoutConstraint activateConstraints:@[
                                                  [self.contentView.heightAnchor  constraintEqualToConstant:cellHeight],
                                                 
                                                  [self.photoImageView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor  constant: cellSpacing],
                                                  [self.photoImageView.heightAnchor constraintEqualToAnchor:self.contentView.heightAnchor],
                                                  [self.photoImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
                                                  [self.photoImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor],
                                                  [self.photoImageView.widthAnchor constraintEqualToAnchor:self.photoImageView.heightAnchor],
                                                  
                                                  [self.nameLabel.leftAnchor constraintEqualToAnchor:self.photoImageView.rightAnchor constant:cellSpacing],
                                                  [self.nameLabel.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-cellSpacing],
                                                  [self.nameLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:cellSpacing],
                                                  [self.nameLabel.heightAnchor constraintEqualToConstant:cellHeight/3],
                                                  
                                                  [self.ratingControl.leftAnchor constraintEqualToAnchor:self.photoImageView.rightAnchor constant:cellSpacing],
                                                  [self.ratingControl.topAnchor constraintEqualToAnchor:self.nameLabel.bottomAnchor constant:cellSpacing],
                                                  [self.ratingControl.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-cellSpacing],
                                                  
                                                  ]];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (UIImageView *) setupPhotoImage{
    UIImageView *photoImage =[UIImageView new];
    photoImage.translatesAutoresizingMaskIntoConstraints = NO;
    photoImage.contentMode = UIViewContentModeScaleAspectFit;
    return photoImage;
}
- (UILabel *) setupNameLabel{
    UILabel *nameLabel =[UILabel new];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    return nameLabel;
}
- (RatingControl *) setupRatingControl{
    RatingControl *ratingControl =[RatingControl new];
    ratingControl.userInteractionEnabled = NO;
    ratingControl.translatesAutoresizingMaskIntoConstraints = NO;
    ratingControl.contentMode  = UIViewContentModeScaleAspectFit;
    return ratingControl;
}

@end
