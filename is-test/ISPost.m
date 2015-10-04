//
//  ISPost.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISPost.h"
#import "ISComment.h"
#import "ISUser.h"

@implementation ISPost

+ (instancetype)postWithData:(NSDictionary *)data {
    ISPost *post = [ISPost objectForEntity:entity_posts withId:[data[key_post_id] integerValue]];
    ISUser *user = [ISUser objectForEntity:entity_user withId:[data[key_post_userId] integerValue]];
    
    if (!user) {
        NSAssert(NO, @"User with userId:%@ not found for postId:%@", data[key_post_userId],  data[key_post_id]);
    }
    
    if (!post) {
        post = [NSEntityDescription insertNewObjectForEntityForName:entity_posts inManagedObjectContext:[CoreDataController sharedController].managedObjectContext];
    }
    
    post.id = data[key_post_id];
    post.userId = data[key_post_userId];
    post.title = data[key_post_title];
    post.body = data[key_post_body];
    
    post.user = user;
    [user addPostsObject:post];
    
    return post;
}

@end
