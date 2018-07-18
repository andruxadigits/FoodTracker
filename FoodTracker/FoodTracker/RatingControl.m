#import "RatingControl.h"

@interface RatingControl(){
    //MARK: Properties
    NSMutableArray *ratingButtons;
}
@property (nonatomic, assign) IBInspectable CGSize starSize;
@property (nonatomic, assign) IBInspectable int starCount;
@end


@implementation RatingControl

//MARK: Init
- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.starSize=CGSizeMake(44.0, 44.0);
        self.starCount=5;
        [self updateButtonSelectionStates];
        [self setupButtons];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        self.starSize=CGSizeMake(44.0, 44.0);
        self.starCount=5;
        [self setupButtons];
    }
    return self;
}
//MARK: Private Methods
-(void)setupButtons{
    for (int i=0;i<[ratingButtons count];i++)
    {
        [ratingButtons[i] removeArrangedSubview:ratingButtons[i]];
        [ratingButtons[i] removeFromSuperview];
    }
    [ratingButtons removeAllObjects];
    ratingButtons = [[NSMutableArray alloc] initWithCapacity:_starCount];
    for (int i=0;i<_starCount;i++){
        UIButton *button= [[UIButton alloc] init];
        UIImage *filledStar=[UIImage imageNamed:@"filledStar"];
        UIImage *emptyStar=[UIImage imageNamed:@"emptyStar"];
        UIImage *highlightedStar=[UIImage imageNamed:@"highlightedStar"];
        [button setImage:emptyStar forState:UIControlStateNormal];
        [button setImage:filledStar forState:UIControlStateSelected];
        [button setImage:highlightedStar forState:UIControlStateHighlighted];
        button.translatesAutoresizingMaskIntoConstraints =false;
        [button.heightAnchor constraintEqualToConstant:_starSize.height].active = true;
        [button.widthAnchor constraintEqualToConstant:_starSize.width].active = true;
        button.accessibilityLabel=@"Set (i+1) star rating";
        [button addTarget:self action:@selector(ratingButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addArrangedSubview:button];
        [ratingButtons addObject:button];
    }
    [self updateButtonSelectionStates];
}

-(void)setRating:(NSUInteger)rating {
    _rating = rating;
    [self updateButtonSelectionStates];
}

-(void) updateButtonSelectionStates{
    for (int i=0;i<_starCount;i++){
        [[ratingButtons objectAtIndex:i] setSelected:i<self.rating];
        
        NSString *hintString;
        if (i==self.rating){
            hintString=@"Tap to reset the rating to zero.";
        }else{
            hintString=nil;
        }
        
        NSString *valueString;
        switch (self.rating) {
            case 0:
                valueString=@"No ƒ set.";
                break;
            case 1:
                valueString=@"1 star set.";
            break;
            default:
            valueString=@"\rating stars set.";
                break;
        }
        [[ratingButtons objectAtIndex:i] setAccessibilityHint:hintString];
        [[ratingButtons objectAtIndex:i] setAccessibilityValue:valueString];
        
        }
}
//MARK: button Action
-(void) ratingButtonTapped:(UIButton *)button{
    NSUInteger index = [ratingButtons indexOfObject:button];
    NSUInteger selectedRating = index+1;
    if (selectedRating==self.rating){
        self.rating = 0;
    }else{
        self.rating=selectedRating;
    }
    [self updateButtonSelectionStates];
}
@end
