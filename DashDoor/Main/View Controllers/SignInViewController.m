//
//  SignInViewController.m
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/10/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import "SignInViewController.h"
#import <ECSlidingViewController/ECSlidingViewController.h>
#import "RESTHelper.h"
#import "Constants.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface SignInViewController () <UITextFieldDelegate>

@end

@implementation SignInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_emailAddressTextField becomeFirstResponder];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kDEFaultsAccessToken]) {
        [self goToMainScreen];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _emailAddressTextField.text = @"elaser212000@yahoo.com";
    _passwordTextField.text = @"password";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _emailAddressTextField) {
        [_passwordTextField becomeFirstResponder];
    }
    else if (textField == _passwordTextField) {
        [self attemptToSignIn];
    }
    return YES;
}

- (void) attemptToSignIn {
    if (_emailAddressTextField.text.length < 3) {
        [[[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter a valid e-mail address" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil] show];
    }
    else if (_passwordTextField.text.length < 3) {
        [[[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter a valid password" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil] show];
    }
    else {
        [SVProgressHUD showWithStatus:@"Logging In" maskType:SVProgressHUDMaskTypeGradient];
        //This means that everything is all good and we can make the appropriate REST call to the backend
        [[RESTHelper sharedInstance] authenticateUserWithEmail:_emailAddressTextField.text withPassword:_passwordTextField.text success:^(NSString *token) {
            [SVProgressHUD dismiss];
            [self goToMainScreen];
        } failure:^{
            [SVProgressHUD dismiss];
            [[[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Unable to login.  Please make sure all information is set correctly" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil] show];
        }];
    }
}

#pragma mark - Attempt to segue to actual content
- (void) goToMainScreen {
    ECSlidingViewController *slidingVC = (ECSlidingViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"slide_vc"];
    [self presentViewController:slidingVC animated:YES completion:nil];
}

@end
