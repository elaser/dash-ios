//
//  Restaurant.h
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/12/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FastImageCache/FICEntity.h>

@interface Restaurant : NSObject <FICEntity>

@property NSString *name;
@property NSNumber *status;
@property NSString *cover_image_url;
@property NSString *restaurant_description;
@property NSNumber *restaurant_id;

+ (Restaurant *) buildRestaurantFromDictionary: (NSDictionary *) dictionary;

@end
