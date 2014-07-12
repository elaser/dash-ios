//
//  RESTHelper.m
//  DashDoor
//
//  Created by Anderthan Hsieh on 7/11/14.
//  Copyright (c) 2014 ahsieh. All rights reserved.
//

#import "RESTHelper.h"
#import <AFNetworking/AFNetworking.h>
#import "Constants.h"

static RESTHelper *_sharedInstance;

@interface RESTHelper ()

@property NSMutableString *authenticationToken;
@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;

@end

@implementation RESTHelper

+ (RESTHelper *) sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[RESTHelper alloc] init];
        _sharedInstance.manager = [AFHTTPRequestOperationManager manager];
    });
    return _sharedInstance;
}

- (void) authenticateUserWithEmail:(NSString *)email withPassword:(NSString *)password success:(void (^)(NSString *token))success failure:(void (^)())failure {
    
    NSString *authURL = [NSString stringWithFormat:@"%@/auth-token/", kDAShBackendBaseURL];
    NSDictionary *loginDictionary = @{@"email": email, @"password":password};
    [_sharedInstance.manager POST:authURL parameters:loginDictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
        _sharedInstance.authenticationToken = responseObject[@"token"];
        [[NSUserDefaults standardUserDefaults] setObject:_sharedInstance.authenticationToken forKey:kDEFaultsAccessToken];
        [[NSUserDefaults standardUserDefaults] synchronize];
        success(_sharedInstance.authenticationToken);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure();
    }];
}

@end
