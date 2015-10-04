//
//  ISAlbum+CoreDataProperties.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ISAlbum.h"

NS_ASSUME_NONNULL_BEGIN

@interface ISAlbum (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *userId;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) ISUser *user;
@property (nullable, nonatomic, retain) NSOrderedSet<ISPhoto *> *photos;

@end

@interface ISAlbum (CoreDataGeneratedAccessors)

- (void)insertObject:(ISPhoto *)value inPhotosAtIndex:(NSUInteger)idx;
- (void)removeObjectFromPhotosAtIndex:(NSUInteger)idx;
- (void)insertPhotos:(NSArray<ISPhoto *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removePhotosAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInPhotosAtIndex:(NSUInteger)idx withObject:(ISPhoto *)value;
- (void)replacePhotosAtIndexes:(NSIndexSet *)indexes withPhotos:(NSArray<ISPhoto *> *)values;
- (void)addPhotosObject:(ISPhoto *)value;
- (void)removePhotosObject:(ISPhoto *)value;
- (void)addPhotos:(NSOrderedSet<ISPhoto *> *)values;
- (void)removePhotos:(NSOrderedSet<ISPhoto *> *)values;

@end

NS_ASSUME_NONNULL_END
