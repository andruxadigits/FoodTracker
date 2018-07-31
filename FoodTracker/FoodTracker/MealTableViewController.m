//
//  MealTableViewController.m
//  FoodTracker
//
//  Created by hello on 17/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import "MealTableViewController.h"

@interface MealTableViewController ()
{
    //MARK: Properties
    NSMutableArray *meals;
    
}

@end
@implementation MealTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Your meals";
    [self.tableView registerClass:[MealTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MealTableViewCell class])];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    NSMutableArray *savedMeals= [self loadMeals];
    if (savedMeals!=nil)
    {
        meals=[[NSMutableArray alloc] initWithCapacity:savedMeals.count];
        [meals addObjectsFromArray:savedMeals];
    }
    else
    {
        [self loadSampleMeals];
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didSelectAddButton)];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//MARK: Private Methods

- (void) loadSampleMeals {
    meals = [[NSMutableArray alloc] initWithCapacity:3];
    UIImage *photo1 = [UIImage imageNamed:@"meal1"];
    UIImage *photo2 = [UIImage imageNamed:@"meal2"];
    UIImage *photo3 = [UIImage imageNamed:@"meal3"];
    Meal *meal1 = [[Meal alloc] initWithName:@"donuts" photo:photo1 rating:@4];
    Meal *meal2 = [[Meal alloc] initWithName:@"pork steak" photo:photo2 rating:@5];
    Meal *meal3 = [[Meal alloc] initWithName:@"potatoes with cutlet" photo:photo3 rating:@3];
    [meals addObject:meal1];
    [meals addObject:meal2];
    [meals addObject:meal3];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return meals.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MealTableViewCell *mealCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MealTableViewCell class]) forIndexPath:indexPath];
    Meal *meal = [meals objectAtIndex:indexPath.row];
    mealCell.photoImageView.image = meal.photo;
    mealCell.nameLabel.text = meal.name;
    mealCell.ratingControl.rating = meal.rating.integerValue;
    return mealCell;
}

//MARK: Actions

- (void) editingMeal:(Meal *)meal{
    NSIndexPath *selectedIndexPath=self.tableView.indexPathForSelectedRow;
    if (selectedIndexPath)
    {
        //Update an existing meal.
        meals[selectedIndexPath.row] = meal;
        [self.tableView reloadRowsAtIndexPaths:@[selectedIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else {
        //Add a new meal.
        NSIndexPath *newIndexPath;
        newIndexPath=[NSIndexPath indexPathForRow:meals.count inSection:0];
        [meals addObject:meal];
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic ];
    }
    [self saveMeals];
}

-(void) saveMeals {
    BOOL isSuccessfulSave=[NSKeyedArchiver archiveRootObject:meals toFile:[Meal archiveURL]];
    if (isSuccessfulSave) {
        os_log_debug(OS_LOG_DEFAULT, "Meals successfully saved.");
    }
    else {
        os_log_error(OS_LOG_DEFAULT, "Failed to save meals...");
    }
}
-(NSMutableArray *) loadMeals {
    NSMutableArray *Data=[NSKeyedUnarchiver unarchiveObjectWithFile:[Meal archiveURL]];
    NSInteger n = [Data count];
    if (n==0) return nil;
    return Data;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Meal *meal = [meals objectAtIndex:indexPath.row];
    [self.delegate MealTableViewControllerDidSelectMeal:meal];
    
}

- (void) didSelectAddButton{
    Meal *meal = [[Meal alloc] initWithName:@"" photo:nil rating:nil];
    [self.delegate MealTableViewControllerDidSelectMeal:meal];
}
//MARK:Navigation

//In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    UIViewController *viewController = [segue destinationViewController];
    if ([viewController isKindOfClass:[MealViewController class]]) {
        MealViewController *mealDetailViewController = (MealViewController *)viewController;
        MealTableViewCell *selectedMealCell =sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedMealCell];
        Meal *selectedMeal = [meals objectAtIndex:indexPath.row];
        mealDetailViewController.meal=selectedMeal;
    }
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


// Override to support editing the table view.

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [meals removeObjectAtIndex:indexPath.row];
        [self saveMeals];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */



@end
