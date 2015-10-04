//
//  ISComment.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ISPost;

#import "ISObject.h"

#define entity_comments @"Comments"

#define key_comment_postId @"postId"
#define key_comment_id     @"id"
#define key_comment_email  @"email"
#define key_comment_name   @"name"
#define key_comment_body   @"body"

NS_ASSUME_NONNULL_BEGIN

@interface ISComment : ISObject

+ (instancetype)commentWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END

#import "ISComment+CoreDataProperties.h"
