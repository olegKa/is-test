//
//  ISAPIGetComments.m
//  is-test
//
//  Created by OLEG KALININ on 04.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAPIGetComments.h"
#import "ISComment.h"

@implementation ISAPIGetComments

- (instancetype)initWithAction:(ISAPIAction *)action {
    if (self = [super initWithAction:action]) {
        _postId = NSNotFound;
    }
    return self;
}


- (void)executeGET {
    NSDictionary *parameters;
    
    if (self.postId != NSNotFound) {
        parameters = @{key_comment_postId:@(self.postId)};
    }
    
    [self executeWithParameters:parameters success:^(NSArray *data) {
        for (NSDictionary *item in data) {
            [ISComment commentWithData:item];
        }
        [[CoreDataController sharedController] saveContext];
    } failure:nil];
}

#pragma mark - Properties
- (void)setPostId:(NSUInteger)postId {
    _postId = postId;
}

@end
