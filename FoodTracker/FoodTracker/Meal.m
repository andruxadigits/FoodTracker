//
//  Meal.m
//  FoodTracker
//
//  Created by hello on 17/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import "Meal.h"

@interface Meal()
@property (readwrite,nonatomic) NSString *name;
@property (readwrite,nonatomic) UIImage *photo;
@property (readwrite,nonatomic) NSNumber *rating;
@property (readwrite,nonatomic) NSArray *Paths;

@end
//MARK: types
static NSString *const kNameKey = @"name";
static NSString *const kPhotoKey = @"photo";
static NSString *const kRatingKey = @"rating";

@implementation Meal
-(instancetype)initWithName:(NSString *)name photo:(UIImage * )photo rating:(NSNumber *)rating{
    self = [super init];
    if (self) {
        if (!([name length]==0)){}else
            return nil;
        if ((rating>=0)&&(rating.integerValue<=5)){}else
            return nil;
        self.name = name;
        self.photo = photo;
        self.rating = rating;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSString *name = [aDecoder decodeObjectForKey:kNameKey];
    UIImage *photo = [aDecoder decodeObjectForKey:kPhotoKey];
    NSNumber *rating = [aDecoder decodeObjectForKey:kRatingKey];
    return [self initWithName:name photo:photo rating:rating];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kNameKey];
    [aCoder encodeObject:self.photo forKey:kPhotoKey];
    [aCoder encodeObject:self.rating forKey:kRatingKey];
}
+ (NSArray *)Path{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);;
}
+ (NSString *)documentDirectoryPath{
    return [[Meal Path] objectAtIndex:0];
}
+ (NSString *)archiveURL{
    return [[Meal documentDirectoryPath] stringByAppendingPathComponent:@"meals"];
}


@end
