//
//  LocationHandler.m
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/11/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import "LocationHandler.h"

@interface LocationHandler ()

@end

static LocationHandler *_sharedInstance = nil;

@implementation LocationHandler


+ (LocationHandler *) sharedInstance {
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        _sharedInstance = [[LocationHandler alloc] init];
        _sharedInstance.delegate = _sharedInstance;
        _sharedInstance.distanceFilter = 10.0f;
        _sharedInstance.desiredAccuracy = kCLLocationAccuracyBest;
        [_sharedInstance startUpdatingLocation];
    });
    return _sharedInstance;
}

#pragma mark - Availability
- (void)refreshLocation
{
    // Bit of a hack to get the current loation RIGHT NOW
    [self stopUpdatingLocation];
    [self startUpdatingLocation];
}

- (NSDictionary *) obtainLocation {
    [self refreshLocation];
    
    [self startUpdatingLocation];
    CLLocation *currentLocation = [self location];
    NSLog(@"currentLocation is %@", currentLocation);
    return !currentLocation ? nil : @{@"lat" : [NSString stringWithFormat:@"%.06f",currentLocation.coordinate.latitude], @"lng" : [NSString stringWithFormat:@"%.06f", currentLocation.coordinate.longitude]};
}

- (CLLocation *) obtainLocationAsCLLocation {
    [self refreshLocation];
    
    return [self location];
}


#pragma mark - CLLocationManagerDelegate
- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {

}


@end
