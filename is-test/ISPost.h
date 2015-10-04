//
//  ISPost.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "ISObject.h"

#define entity_posts @"Posts"

#define key_post_userId @"userId"
#define key_post_id     @"id"
#define key_post_title  @"title"
#define key_post_body   @"body"

@class ISComment, ISUser;

NS_ASSUME_NONNULL_BEGIN

@interface ISPost : ISObject

+ (instancetype)postWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END

#import "ISPost+CoreDataProperties.h"
