//
//  ISTodo+CoreDataProperties.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ISTodo.h"

NS_ASSUME_NONNULL_BEGIN

@interface ISTodo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *userId;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSNumber *completed;
@property (nullable, nonatomic, retain) ISUser *user;

@end

NS_ASSUME_NONNULL_END
