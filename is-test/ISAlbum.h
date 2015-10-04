//
//  ISAlbum.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ISObject.h"

#define entity_albums @"Albums"

#define key_album_userId @"userId"
#define key_album_id     @"id"
#define key_album_title  @"title"

@class ISPhoto, ISUser;

NS_ASSUME_NONNULL_BEGIN

@interface ISAlbum : ISObject

+ (instancetype)albumWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END

#import "ISAlbum+CoreDataProperties.h"
