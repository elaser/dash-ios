//
//  Restaurant.m
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/12/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import "Restaurant.h"
#import <FastImageCache/FICUtilities.h>

@implementation Restaurant

@synthesize restaurant_id, restaurant_description, name, status, cover_image_url;

- (NSString *) UUID {
    CFUUIDBytes UUIDBytes = FICUUIDBytesFromMD5HashOfString([self.restaurant_id stringValue]);
    return FICStringWithUUIDBytes(UUIDBytes);
}

- (NSString *)sourceImageUUID {
    CFUUIDBytes sourceImageUUIDBytes = FICUUIDBytesFromMD5HashOfString(self.cover_image_url);
    NSString *sourceImageUUID = FICStringWithUUIDBytes(sourceImageUUIDBytes);
    
    return sourceImageUUID;
}

- (NSURL *)sourceImageURLWithFormatName:(NSString *)formatName {
    return [NSURL URLWithString:self.cover_image_url];
}

- (FICEntityImageDrawingBlock)drawingBlockForImage:(UIImage *)image withFormatName:(NSString *)formatName {
    FICEntityImageDrawingBlock drawingBlock = ^(CGContextRef context, CGSize contextSize) {
        CGRect contextBounds = CGRectZero;
        contextBounds.size = contextSize;
        CGContextClearRect(context, contextBounds);
        
        UIGraphicsPushContext(context);
        [image drawInRect:contextBounds];
        UIGraphicsPopContext();
    };
    
    return drawingBlock;
}


+ (Restaurant *) buildRestaurantFromDictionary: (NSDictionary *) restaurantDictionary {
    Restaurant *res = [[Restaurant alloc] init];
    if (res) {
        res.cover_image_url = restaurantDictionary[@"cover_img_url"];
        res.restaurant_description = restaurantDictionary[@"description"];
        res.restaurant_id = restaurantDictionary[@"id"];
        res.status = restaurantDictionary[@"is_open"];
        res.name = restaurantDictionary[@"name"];
    }
    return res;
}

@end
