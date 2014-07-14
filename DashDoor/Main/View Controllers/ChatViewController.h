//
//  ChatViewController.h
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/13/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *chatTextField;
@property (weak, nonatomic) IBOutlet UITableView *chatTableView;

@end

@interface ChatTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *chatLabel;

@end