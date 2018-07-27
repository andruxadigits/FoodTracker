#import "RatingControl.h"

@interface RatingControl()
@property (nonatomic, assign) IBInspectable CGSize starSize;
@property (nonatomic, assign) IBInspectable int starCount;
@end


@implementation RatingControl{
    NSMutableArray *_ratingButtons;
    CGFloat _imageSize;
}

//MARK: Init
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imageSize = 90.0;
        self.starSize = CGSizeMake(44.0, 44.0);
        self.starCount = 5;
        self.spacing = 8;
        [self updateButtonSelectionStates];
        CGFloat screenWidth = MIN([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
        CGFloat totalWidth =_imageSize + (self.starCount + 1 ) * self.spacing + self.starSize.width * self.starCount;
        if (screenWidth < totalWidth) {
            CGFloat newStarSize =(screenWidth - (_imageSize + (self.starCount + 1) * self.spacing)) / self.starCount;
            self.starSize = CGSizeMake(newStarSize,newStarSize);
        }
        [self setupButtons];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _imageSize = 90.0;
        self.starSize = CGSizeMake(44.0, 44.0);
        self.starCount = 5;
        self.spacing = 8;
        [self updateButtonSelectionStates];
        CGFloat screenWidth = MIN([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
        CGFloat totalWidth =_imageSize + (self.starCount + 1 ) * self.spacing + self.starSize.width * self.starCount;
        if (screenWidth < totalWidth) {
            CGFloat newStarSize =(screenWidth - (_imageSize + (self.starCount + 1) * self.spacing)) / self.starCount;
            self.starSize = CGSizeMake(newStarSize,newStarSize);
        }
        [self setupButtons];
    }
    return self;
}

//MARK: Private Methods
-(void)setupButtons{
    for (int i = 0;i < [_ratingButtons count];i++) {
        [_ratingButtons[i] removeArrangedSubview:_ratingButtons[i]];
        [_ratingButtons[i] removeFromSuperview];
    }
    [_ratingButtons removeAllObjects];
    _ratingButtons = [[NSMutableArray alloc] initWithCapacity:_starCount];
    for (int i = 0;i < _starCount;i++) {
        UIButton *button = [[UIButton alloc] init];
        UIImage *filledStar = [UIImage imageNamed:@"filledStar"];
        UIImage *emptyStar = [UIImage imageNamed:@"emptyStar"];
        UIImage *highlightedStar = [UIImage imageNamed:@"highlightedStar"];
        [button setImage:emptyStar forState:UIControlStateNormal];
        [button setImage:filledStar forState:UIControlStateSelected];
        [button setImage:highlightedStar forState:UIControlStateHighlighted];
        button.translatesAutoresizingMaskIntoConstraints =false;
        [button.heightAnchor constraintEqualToConstant:self.starSize.height].active = true;
        [button.widthAnchor constraintEqualToConstant:self.starSize.width].active = true;
        button.accessibilityLabel=@"Set (i+1) star rating";
        [button addTarget:self action:@selector(ratingButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addArrangedSubview:button];
        [_ratingButtons addObject:button];
    }
}

-(void)setRating:(NSUInteger)rating {
    _rating = rating;
    [self updateButtonSelectionStates];
}

-(void) updateButtonSelectionStates {
    for (int i = 0;i < _starCount;i++) {
        [[_ratingButtons objectAtIndex:i] setSelected:i < self.rating];
        
        NSString *hintString;
        if (i == self.rating) {
            hintString = @"Tap to reset the rating to zero.";
        }
        else{
            hintString = nil;
        }
        
        NSString *valueString;
        switch (self.rating) {
            case 0:
                valueString = @"No ƒ set.";
                break;
            case 1:
                valueString = @"1 star set.";
                break;
            default:
                valueString = @"\rating stars set.";
                break;
        }
        [[_ratingButtons objectAtIndex:i] setAccessibilityHint:hintString];
        [[_ratingButtons objectAtIndex:i] setAccessibilityValue:valueString];
        
    }
}
//MARK: button Action
-(void) ratingButtonTapped:(UIButton *)button {
    NSUInteger index = [_ratingButtons indexOfObject:button];
    NSUInteger selectedRating = index + 1;
    if (selectedRating == self.rating) {
        self.rating = 0;
    }
    else {
        self.rating = selectedRating;
    }
    [self updateButtonSelectionStates];
}
@end
