//
//  ISAddress+CoreDataProperties.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ISAddress.h"

NS_ASSUME_NONNULL_BEGIN

@interface ISAddress (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *city;
@property (nullable, nonatomic, retain) NSString *geo_lat;
@property (nullable, nonatomic, retain) NSString *street;
@property (nullable, nonatomic, retain) NSString *suite;
@property (nullable, nonatomic, retain) NSString *zipcode;
@property (nullable, nonatomic, retain) NSString *geo_long;
@property (nullable, nonatomic, retain) NSSet<ISUser *> *users;

@end

@interface ISAddress (CoreDataGeneratedAccessors)

- (void)addUsersObject:(ISUser *)value;
- (void)removeUsersObject:(ISUser *)value;
- (void)addUsers:(NSSet<ISUser *> *)values;
- (void)removeUsers:(NSSet<ISUser *> *)values;

@end

NS_ASSUME_NONNULL_END
