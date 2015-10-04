//
//  ISComment.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISComment.h"
#import "ISPost.h"

@implementation ISComment

+ (instancetype)commentWithData:(NSDictionary *)data {
    ISComment *comment = [ISComment objectForEntity:entity_comments withId:[data[key_comment_id] integerValue]];
    ISPost *post = [ISPost objectForEntity:entity_posts withId:[data[key_comment_postId] integerValue]];
    
    if (!post) {
        NSAssert(NO, @"Post with postId:%@ not found for commentId:%@", data[key_comment_postId], data[key_comment_id]);
    }
    
    if (!comment) {
        comment = [NSEntityDescription insertNewObjectForEntityForName:entity_comments inManagedObjectContext:[CoreDataController sharedController].managedObjectContext];
    }
    
    comment.id = data[key_comment_id];
    comment.postId = data[key_comment_postId];
    comment.email = data[key_comment_email];
    comment.name = data[key_comment_name];
    comment.body = data[key_comment_body];
    
    return comment;
}

@end
