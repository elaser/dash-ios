//
//  MainViewController.m
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/10/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import "MainViewController.h"
#import "Constants.h"
#import  <FastImageCache/FICImageCache.h>
#import  "RESTHelper.h"
#import "Restaurant.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *restaurantArray;

@end

@implementation MainViewController

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
    self.restaurantArray = [NSMutableArray array];
    self.navigationController.navigationBar.barTintColor = UIColorFromHex(0xD6494A);
    [self refreshRestaurantList];
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

#pragma mark - UITableViewDataSource and UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _restaurantArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RestaurantTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"restaurant_cell"];
    Restaurant *resto = [_restaurantArray objectAtIndex:indexPath.row];
    if (cell) {
        if (resto.cover_image_url)
            [[FICImageCache sharedImageCache] retrieveImageForEntity:resto withFormatName:kFICRegularPictureName completionBlock:^(id<FICEntity> entity, NSString *formatName, UIImage *image) {
                cell.restaurantImageView.image = image;
            }];
        
        cell.restaurantNameLabel.text = resto.name;
        cell.restaurantCategoryLabel.text = resto.restaurant_description;
        cell.restaurantStatusLabel.text = resto.status.intValue > 0 ? @"Order" : @"Pre-order";
    }
    
    return cell;
}

/*
 * refreshRestaurantList - We make the call to the backend to obtain the restaurants
 */
- (void) refreshRestaurantList {
    [[RESTHelper sharedInstance] obtainRestaurantsWithSuccess:^(NSArray *restaurantArray) {
        _restaurantArray = [NSMutableArray arrayWithArray:restaurantArray];
        [_restaurantTableView reloadData];
    } failure:nil];
}


@end

@implementation RestaurantTableViewCell


@end
