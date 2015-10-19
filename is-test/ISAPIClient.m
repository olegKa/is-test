//
//  ISAPIClient.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAPIClient.h"
#import "AFHTTPRequestOperation.h"

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
        self.reachabilityManager = [AFNetworkReachabilityManager sharedManager];
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

- (void)loadImageUrl:(NSString *)url withCompletion:(void (^)(BOOL success, UIImage *image))complectionBlock {
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
    requestOperation.responseSerializer = [AFImageResponseSerializer serializer];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Response: %@", responseObject);
        if (complectionBlock) {
            complectionBlock(YES, responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Image error: %@", error);
        if (complectionBlock) {
            complectionBlock(NO, nil);
        }
    }];
    [requestOperation start];
}

@end
