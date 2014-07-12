//
//  MainSliderViewController.m
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/12/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import "MainSliderViewController.h"

@interface MainSliderViewController ()

@end

@implementation MainSliderViewController

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

#pragma mark - Override methods
- (void)configureLeftMenuButton:(UIButton *)button
{
    CGRect frame = button.frame;
    frame = CGRectMake(0, 0, 25, 13);
    button.frame = frame;
    button.backgroundColor = [UIColor clearColor];
    [button setImage:[UIImage imageNamed:@"simpleMenuButton"] forState:UIControlStateNormal];
}


- (NSString *)segueIdentifierForIndexPathInLeftMenu:(NSIndexPath *)indexPath
{
    NSString *identifier = @"";
    switch (indexPath.row) {
        case 0:
            identifier = @"firstRow";
            break;
        case 1:
            identifier = @"secondRow";
            break;
    }
    
    return identifier;
}

- (AMPrimaryMenu)primaryMenu
{
    return AMPrimaryMenuLeft;
}


// Enabling Deepness on left menu
- (BOOL)deepnessForLeftMenu
{
    return YES;
}

// Enabling darkness while left menu is opening
- (CGFloat)maxDarknessWhileLeftMenu
{
    return 0.5;
}

@end
