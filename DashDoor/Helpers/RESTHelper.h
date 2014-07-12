//
//  RESTHelper.h
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/11/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RESTHelper : NSObject

+ (RESTHelper *) sharedInstance;

- (void) authenticateUserWithEmail:(NSString *)email withPassword:(NSString *)password success:(void (^)(NSString *token))success failure:(void (^)())failure;

@end
