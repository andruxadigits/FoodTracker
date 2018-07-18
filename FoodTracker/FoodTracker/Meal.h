//
//  Meal.h
//  FoodTracker
//
//  Created by hello on 17/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Meal : NSObject <NSCoding>
@property (readonly,nonatomic) NSString *name;
@property (readonly,nonatomic) UIImage *photo;
@property (readonly,nonatomic) NSNumber *rating;
@property (readonly,nonatomic) NSArray *Paths;

-(instancetype)initWithName:(NSString *)name photo:(UIImage * )photo rating:(NSNumber *)rating;
+ (NSString *)archiveURL;
@end
