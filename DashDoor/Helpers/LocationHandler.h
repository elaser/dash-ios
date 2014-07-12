//
//  LocationHandler.h
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/11/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationHandler : CLLocationManager <CLLocationManagerDelegate>

+ (LocationHandler *) sharedInstance;
- (void)refreshLocation;
- (NSDictionary *) obtainLocation;
- (CLLocation *) obtainLocationAsCLLocation;

@end
