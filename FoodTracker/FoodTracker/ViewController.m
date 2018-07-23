//
//  ViewController.m
//  FoodTracker
//
//  Created by hello on 12/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//MARK: Properties
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *mealNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet RatingControl *ratingControl;
@property (readwrite,weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
/*
 This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
 or constructed as part of adding a new meal.
 */
@end

@implementation ViewController
{
    UIImagePickerController *_imagePicker;
    UIImage *_selectedImage;
}
//MARK: UITextFieldDelegate
- (void) textFieldDidBeginEditing:(UITextField *)textField{
    [self.saveButton setEnabled:false];
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    // Hide the keyboard.
    [textField resignFirstResponder];
    return true;
}
- (void) textFieldDidEndEditing:(UITextField *)textField{
    self.mealNameLabel.text=textField.text;
    [self updateSaveButtonState];
    [self navigationItem].title=textField.text;
}

//MARK: UIImagePickerControllerDelegate
- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // Dismiss the picker if the user canceled.
    [self dismissViewControllerAnimated:true completion:nil];
}
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    _selectedImage= info[UIImagePickerControllerOriginalImage];
    self.photoImageView.image = _selectedImage;
    self.photoImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self dismissViewControllerAnimated:true completion:nil];
}
//:MARK: Navigation
- (IBAction)cancel:(UIBarButtonItem *)sender {
    UIViewController *isPresentingInAddMealMode = self.presentingViewController;
    UINavigationController *owningNavigationController = self.navigationController;
    if (isPresentingInAddMealMode){
        [self dismissViewControllerAnimated:true completion:nil];
    }
    else if (owningNavigationController)
    {
        [owningNavigationController popViewControllerAnimated:true];
    }
    
}

//MARK: Actions
- (IBAction)setDefaultLabelText:(UIButton *)sender {
    self.mealNameLabel.text = @"Default Text";
}
- (IBAction)selectImageFromPhotoLibrary:(UITapGestureRecognizer *)sender {
    
    // Hide the keyboard.
    [self.nameTextField resignFirstResponder];
    // UIImagePickerController is a view controller that lets a user pick media from their photo library.
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    _imagePicker.delegate = self;
    [self presentViewController:_imagePicker animated:YES completion:nil];
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [super prepareForSegue:segue sender:sender];
    UIBarButtonItem *button;
    if ((button=sender)&&(button==self.saveButton)) {
        NSString *name = _nameTextField.text;
        UIImage *photo = _photoImageView.image;
        NSNumber *rating = [NSNumber numberWithInteger:_ratingControl.rating];
        self.meal=[[Meal alloc] initWithName:name photo:photo rating:rating];
    }else
    {
                return;
    }
    
}
//MARK: Private Methods
-(void) updateSaveButtonState{
    NSString *text=self.nameTextField.text;
    [self.saveButton setEnabled:[text length]!=0];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Handle the text field’s user input through delegate callbacks.
    self.nameTextField.delegate = self;
    if (self.meal!=nil){
        self.navigationItem.title = self.meal.name;
        self.nameTextField.text = self.meal.name;
        self.photoImageView.image = self.meal.photo;
        self.photoImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.ratingControl.rating = self.meal.rating.integerValue;
    }
    
    [self updateSaveButtonState];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
