//
//  ISAPIClient.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAPIClient.h"

@interface ISAPIClient ()

@property (nonatomic, strong) AFNetworkReachabilityManager *reachabilityManager;

@end

@implementation ISAPIClient

dynamic reachabilityManager;

- (instancetype)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        backgroundTasks = [NSMutableArray new];
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
