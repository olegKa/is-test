//
//  ISAddress.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define entity_addresses @"Addresses"

#define key_address_city    @"city"
#define key_address_geo     @"geo"
#define key_address_geo_lat @"lat"
#define key_address_geo_lng @"lng"
#define key_address_street  @"street"
#define key_address_suite   @"suite"
#define key_address_zipcode @"zipcode"

@class ISUser;

NS_ASSUME_NONNULL_BEGIN

@interface ISAddress : NSManagedObject

+ (instancetype)addressWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END

#import "ISAddress+CoreDataProperties.h"
