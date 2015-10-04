//
//  ISAPIClient.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAPIClient.h"

#define _url_ @"http://jsonplaceholder.typicode.com"

@interface ISAPIClient ()

@property (nonatomic, strong) AFNetworkReachabilityManager *reachabilityManager;

@end

@implementation ISAPIClient

@dynamic reachabilityManager;

+ (instancetype)sharedClient {
    static ISAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ISAPIClient alloc] initWithBaseURL:[NSURL URLWithString:_url_]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        self.reachabilityManager = [AFNetworkReachabilityManager managerForDomain:[url absoluteString]];
        [self.reachabilityManager startMonitoring];
        [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            NSLog(@"reachability for domain change to:%ld", (long)status);
        }];
    }
    
    return self;
}

- (void)dealloc {
    [self.reachabilityManager stopMonitoring];
}


@end
