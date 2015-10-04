//
//  ISComment+CoreDataProperties.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ISComment.h"

NS_ASSUME_NONNULL_BEGIN

@interface ISComment (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *postId;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *body;
@property (nullable, nonatomic, retain) ISPost *post;

@end

NS_ASSUME_NONNULL_END
