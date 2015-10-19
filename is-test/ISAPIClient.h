//
//  ISAPIClient.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "ISAPIClient.h"

@interface ISAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;
- (void)loadImageUrl:(NSString *)url withCompletion:(void (^)(BOOL success, UIImage *image))complectionBlock;

@end
