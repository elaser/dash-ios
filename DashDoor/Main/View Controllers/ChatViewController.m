//
//  ChatViewController.m
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/13/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import "ChatViewController.h"
#import <Firebase/Firebase.h>
#import "Constants.h"

@interface ChatViewController () <UITextFieldDelegate, UITableViewDataSource, UITableViewDataSource>

@property (strong, nonatomic) Firebase *chatHandler;
@property (strong, nonatomic) NSMutableArray *chatArray;

@end

@implementation ChatViewController

@synthesize chatHandler = _chatHandler;
@synthesize chatTextField = _chatTextField;
@synthesize chatArray = _chatArray;
@synthesize chatTableView = _chatTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) dealloc {
    _chatHandler = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_chatTextField becomeFirstResponder];
    _chatArray = [NSMutableArray array];
    [self setupFirebaseHandler];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Firebase Setup
- (void) setupFirebaseHandler {
    _chatHandler = [[Firebase alloc] initWithUrl:[NSString stringWithFormat:@"%@/%@", kDAShFirebaseURL, @"chat"]];
    [_chatHandler observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
        //Need to go and grab the array
        NSLog(@"snapshot.value is %@", snapshot.value);
        [_chatArray addObject:snapshot.value];
        [_chatTableView reloadData];
        if (_chatArray.count > 0)
            [_chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_chatArray.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }];
    
}

- (void) pushToFirebase {
    if (_chatTextField.text.length > 0) {
        [_chatHandler.childByAutoId setValue:_chatTextField.text];
        _chatTextField.text = @"";
    }
}

#pragma mark - IBActions

- (IBAction)clickSendButton:(id)sender {
    [self pushToFirebase];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self pushToFirebase];
    return NO;
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

#pragma mark - UITableViewDelegate And UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _chatArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chat_cell"];
    if (cell) {
        cell.chatLabel.text = [_chatArray objectAtIndex:indexPath.row];
    }
    return cell;
}

@end

@implementation ChatTableViewCell

@end
