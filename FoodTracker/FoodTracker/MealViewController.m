//
//  mealViewController.m
//  FoodTracker
//
//  Created by hello on 12/07/2018.
//  Copyright © 2018 digits. All rights reserved.
//

#import "MealViewController.h"

@interface MealViewController ()
//MARK: Properties
@property (nonatomic) UIStackView *stackView;
@property (nonatomic) UITextField *nameTextField;
@property (nonatomic) UIImageView *photoImageView;
@property (nonatomic) RatingControl *ratingControl;
/*
 This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
 or constructed as part of adding a new meal.
 */
@end

@implementation MealViewController {
    UIImagePickerController *_imagePicker;
    UIImage *_selectedImage;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Handle the text field’s user input through delegate callbacks.
    //  self.nameTextField.delegate = self;
    
    if (self.meal != nil) {
        self.navigationItem.title = self.meal.name;
        self.stackView = [self setupStackView];
        [self.view addSubview:self.stackView];
        self.nameTextField = [self setupTextField];
        [self.stackView addArrangedSubview:self.nameTextField];
        self.photoImageView = [self setupPhotoImage];
        [self.stackView addArrangedSubview:self.photoImageView];
        self.ratingControl = [self setupRatingControl];
        [self.stackView addArrangedSubview:self.ratingControl];
        CGFloat height = MAX([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)/5;
        CGFloat spacing = height / 5;
        [self.nameTextField setFont:[UIFont systemFontOfSize:height/5]];
        [NSLayoutConstraint activateConstraints:@[
                                                  [self.stackView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:spacing],
                                                  [self.stackView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-spacing],
                                                  [self.stackView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:spacing],
                                                  [self.stackView.bottomAnchor constraintLessThanOrEqualToAnchor:self.view.bottomAnchor constant:-spacing],
                                                  [self.nameTextField.heightAnchor constraintEqualToConstant:height/3],
                                                  [self.nameTextField.trailingAnchor constraintEqualToAnchor:self.stackView.trailingAnchor],
                                                  [self.photoImageView.topAnchor constraintEqualToAnchor:self.nameTextField.bottomAnchor constant:spacing],
                                                  [self.photoImageView.heightAnchor constraintEqualToAnchor:self.photoImageView.widthAnchor],
                                                  [self.ratingControl.topAnchor constraintEqualToAnchor:self.photoImageView.bottomAnchor constant:spacing]
                                                  ]];
        
    }
    else {
        self.navigationItem.title = @"new meal";
        self.stackView = [self setupStackView];
        [self.view addSubview:self.stackView];
        self.nameTextField = [self setupTextField];
        [self.stackView addArrangedSubview:self.nameTextField];
        self.photoImageView = [self setupPhotoImage];
        [self.stackView addArrangedSubview:self.photoImageView];
        self.ratingControl = [self setupRatingControl];
        self.ratingControl.rating = 0;
        [self.stackView addArrangedSubview:self.ratingControl];
        CGFloat height = MAX([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)/5;
        CGFloat spacing = height / 5;
        [self.nameTextField setFont:[UIFont systemFontOfSize:height/5]];
        [NSLayoutConstraint activateConstraints:@[
                                                  [self.stackView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:spacing],
                                                  [self.stackView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-spacing],
                                                  [self.stackView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:spacing],
                                                  [self.stackView.bottomAnchor constraintLessThanOrEqualToAnchor:self.view.bottomAnchor constant:-spacing],
                                                  [self.nameTextField.heightAnchor constraintEqualToConstant:height/3],
                                                  [self.nameTextField.trailingAnchor constraintEqualToAnchor:self.stackView.trailingAnchor],
                                                  [self.photoImageView.topAnchor constraintEqualToAnchor:self.nameTextField.bottomAnchor constant:spacing],
                                                  [self.photoImageView.heightAnchor constraintEqualToAnchor:self.photoImageView.widthAnchor],
                                                  [self.ratingControl.topAnchor constraintEqualToAnchor:self.photoImageView.bottomAnchor constant:spacing]
                                                  ]];
        
    }
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(didSelectedSaveButton)];
    //   self.nameTextField,did
    [self updateSaveButtonState];
}
- (UITextField *) setupTextField {
    UITextField *nameTextField = [UITextField new];
    nameTextField.returnKeyType = UIReturnKeyDone;
    nameTextField.enablesReturnKeyAutomatically = YES;
    nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    nameTextField.text = self.meal.name;
    nameTextField.delegate = self;
    nameTextField.placeholder = @"Enter meal name";
    return nameTextField;
}
- (UIStackView *) setupStackView {
    UIStackView *stackView = [UIStackView new];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [stackView setAxis:UILayoutConstraintAxisVertical];
    stackView.alignment = UIStackViewAlignmentCenter;
    //    stackView.alignment = UIStackViewAlignmentCenter;
    return stackView;
}
- (UIImageView *) setupPhotoImage{
    UIImageView *photoImageView = [UIImageView new];
    if (self.meal!=nil)
        photoImageView.image = self.meal.photo; else
            photoImageView.image = [UIImage imageNamed:@"defaultPhoto"];
    photoImageView.contentMode = UIViewContentModeScaleAspectFit;
    photoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    photoImageView.semanticContentAttribute =UISemanticContentAttributeUnspecified;
    
    [photoImageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectImageFromPhotoLibrary:)];
    [singleTap setNumberOfTapsRequired:1];
    [photoImageView addGestureRecognizer:singleTap];
    return photoImageView;
}
- (UILabel *) setupMealNameLabel{
    UILabel *mealNameLabel = [UILabel new];
    mealNameLabel.text = self.meal.name;
    return mealNameLabel;
}
- (RatingControl *) setupRatingControl{
    RatingControl *ratingControl =[RatingControl new];
    ratingControl.rating = self.meal.rating.integerValue;
    return ratingControl;
}
//MARK: UITextFieldDelegate
- (void) textFieldDidBeginEditing:(UITextField *)textField {
    [self.navigationItem.rightBarButtonItem setEnabled:false];
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    // Hide the keyboard.
    [textField resignFirstResponder];
    return true;
}
- (void) textFieldDidEndEditing:(UITextField *)textField {
    [self updateSaveButtonState];
    [self navigationItem].title = textField.text;
}
- (void) didSelectedSaveButton {
    Meal *meal = [[Meal alloc] initWithName:self.nameTextField.text photo:self.photoImageView.image rating:[NSNumber numberWithInteger:self.ratingControl.rating]];
    [self dismissViewControllerAnimated:true completion:nil];
    [self.delegate MealViewControllerSaveButton:meal];
}

//MARK: UIImagePickerControllerDelegate
- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // Dismiss the picker if the user canceled.
    [self dismissViewControllerAnimated:true completion:nil];
}
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    _selectedImage = info[UIImagePickerControllerOriginalImage];
    self.photoImageView.image = _selectedImage;
    self.photoImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self dismissViewControllerAnimated:true completion:nil];
}
//:MARK: Navigation
- (IBAction)cancel:(UIBarButtonItem *)sender {
    UIViewController *isPresentingInAddMealMode = self.presentingViewController;
    UINavigationController *owningNavigationController = self.navigationController;
    if (isPresentingInAddMealMode) {
        [self dismissViewControllerAnimated:true completion:nil];
    }
    else
        if (owningNavigationController) {
            [owningNavigationController popViewControllerAnimated:true];
        }
    
}

//MARK: Actions

- (IBAction)selectImageFromPhotoLibrary:(UITapGestureRecognizer *)sender {
    
    // Hide the keyboard.
    [self.nameTextField resignFirstResponder];
    // UIImagePickerController is a view controller that lets a user pick media from their photo library.
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    _imagePicker.delegate = self;
    [self presentViewController:_imagePicker animated:YES completion:nil];
}

//MARK: Private Methods
-(void) updateSaveButtonState {
    NSString *text = self.nameTextField.text;
    [self.self.navigationItem.rightBarButtonItem setEnabled:[text length] != 0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
