//
//  ISPost+CoreDataProperties.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ISPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface ISPost (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *userId;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *body;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) ISUser *user;
@property (nullable, nonatomic, retain) NSOrderedSet<ISComment *> *comments;

@end

@interface ISPost (CoreDataGeneratedAccessors)

- (void)insertObject:(ISComment *)value inCommentsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromCommentsAtIndex:(NSUInteger)idx;
- (void)insertComments:(NSArray<ISComment *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeCommentsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInCommentsAtIndex:(NSUInteger)idx withObject:(ISComment *)value;
- (void)replaceCommentsAtIndexes:(NSIndexSet *)indexes withComments:(NSArray<ISComment *> *)values;
- (void)addCommentsObject:(ISComment *)value;
- (void)removeCommentsObject:(ISComment *)value;
- (void)addComments:(NSOrderedSet<ISComment *> *)values;
- (void)removeComments:(NSOrderedSet<ISComment *> *)values;

@end

NS_ASSUME_NONNULL_END
