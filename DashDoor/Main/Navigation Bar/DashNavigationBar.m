//
//  DashNavigationBar.m
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/12/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import "DashNavigationBar.h"
#import "Constants.h"

@interface DashNavigationBar ()
{
	UIView* _underlayView;
}

- (UIView*) underlayView;

@end

@implementation DashNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tintColor = [UIColor whiteColor];
}

- (void) didAddSubview:(UIView *)subview
{
	[super didAddSubview:subview];
    
	if(subview != _underlayView)
	{
		UIView* underlayView = self.underlayView;
		[underlayView removeFromSuperview];
		[self insertSubview:underlayView atIndex:1];
	}
}

- (UIView*) underlayView
{
	if(_underlayView == nil)
	{
		const CGFloat statusBarHeight = 20;    //  Make this dynamic in your own code...
		const CGSize selfSize = self.frame.size;
        
		_underlayView = [[UIView alloc] initWithFrame:CGRectMake(0, -statusBarHeight, selfSize.width, selfSize.height + statusBarHeight)];
		[_underlayView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
		[_underlayView setBackgroundColor:UIColorFromHex(0xD6494A)];
		[_underlayView setAlpha:1];
		[_underlayView setUserInteractionEnabled:NO];
        [self setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Avenir" size:17],
                                       NSForegroundColorAttributeName: [UIColor whiteColor]}];
	}
    
	return _underlayView;
}

@end
