//
//  MainViewController.h
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/10/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *restaurantTableView;

@end


@interface RestaurantTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *restaurantImageView;
@property (weak, nonatomic) IBOutlet UILabel *restaurantNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *restaurantCategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *restaurantStatusLabel;

@end