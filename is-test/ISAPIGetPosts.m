//
//  ISAPIGetPosts.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAPIGetPosts.h"
#import "ISPost.h"

@implementation ISAPIGetPosts

- (instancetype)initWithAction:(ISAPIAction *)action {
    if (self = [super initWithAction:action]) {
        _userId = NSNotFound;
    }
    return self;
}


- (void)executeGET {
    NSDictionary *parameters;
    
    if (self.userId != NSNotFound) {
        parameters = @{key_post_userId:@(self.userId)};
    }
    
    [self executeWithParameters:parameters success:^(NSArray *data) {
        for (NSDictionary *item in data) {
            [ISPost postWithData:item];
        }
        [[CoreDataController sharedController] saveContext];
    } failure:nil];
}

#pragma mark - Properties
- (void)setUserId:(NSUInteger)userId {
    _userId = userId;
//    if (self.action) {
//        self.action.objectId = userId;
//    }
}

@end
