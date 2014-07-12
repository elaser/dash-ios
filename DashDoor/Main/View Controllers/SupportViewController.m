//
//  SupportViewController.m
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/12/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import "SupportViewController.h"
#import "Constants.h"

@interface SupportViewController ()

@end

@implementation SupportViewController

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
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:kDAShSupportURL]]];
    self.webView.scalesPageToFit = YES;
    self.title = @"DashDoor";
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

@end
