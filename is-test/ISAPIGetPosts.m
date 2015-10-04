//
//  ISAPIGetPosts.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAPIGetPosts.h"

@implementation ISAPIGetPosts

- (instancetype)init {
    return [super initWithAction:[ISAPIAction actionWithMethod:ISAPIActionMethodPosts]];
}

- (instancetype)initWithPostId:(NSUInteger)postId {
    return [super initWithAction:[ISAPIAction actionWithActionMainMethod:ISAPIActionMethodPosts forObjectId:postId andDetailMethod:ISAPIActionMethodUnknown]];
}

@end
