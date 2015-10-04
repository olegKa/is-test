//
//  ISPhoto.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ISObject.h"

#define entity_photos @"Photos"

#define key_photo_albumId       @"albumId"
#define key_photo_id            @"id"
#define key_photo_title         @"title"
#define key_photo_url           @"key_photo_url"
#define key_photo_thumbnailUrl  @"thumbnailUrl"

@class ISAlbum;

NS_ASSUME_NONNULL_BEGIN

@interface ISPhoto : ISObject

+ (instancetype)photoWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END

#import "ISPhoto+CoreDataProperties.h"
