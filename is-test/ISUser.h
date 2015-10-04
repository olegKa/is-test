//
//  ISUser.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISObject.h"
#import <CoreData/CoreData.h>

#define entity_user @"Users"

#define key_user_id         @"id"
#define key_user_name       @"name"
#define key_user_phone      @"phone"
#define key_user_username   @"username"
#define key_user_website    @"website"
#define key_user_address    @"address"
#define key_user_company    @"company"

@class ISAddress, ISAlbum, ISCompany, ISPost, ISTodo;

NS_ASSUME_NONNULL_BEGIN

@interface ISUser : ISObject

+ (instancetype)userWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END

#import "ISUser+CoreDataProperties.h"
