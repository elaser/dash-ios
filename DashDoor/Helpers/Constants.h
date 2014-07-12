//
//  Constants.h
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/11/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

extern NSString *const kDAShSecureBackendBaseURL;
extern NSString *const kDAShUnsecureBackendBaseURL;
extern NSString *const kDAShDriverURL;
extern NSString *const kDAShSupportURL;

extern NSString *const kDEFaultsAccessToken;

extern NSString *const kFICRegularPictureName;

#define UIColorFromHex(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]

@end
