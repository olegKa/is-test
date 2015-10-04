//
//  ISCompany+CoreDataProperties.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ISCompany.h"

NS_ASSUME_NONNULL_BEGIN

@interface ISCompany (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *bs;
@property (nullable, nonatomic, retain) NSString *catchPhrase;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<ISUser *> *users;

@end

@interface ISCompany (CoreDataGeneratedAccessors)

- (void)addUsersObject:(ISUser *)value;
- (void)removeUsersObject:(ISUser *)value;
- (void)addUsers:(NSSet<ISUser *> *)values;
- (void)removeUsers:(NSSet<ISUser *> *)values;

@end

NS_ASSUME_NONNULL_END
