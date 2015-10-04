//
//  ISUser+CoreDataProperties.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ISUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface ISUser (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *phone;
@property (nullable, nonatomic, retain) NSString *username;
@property (nullable, nonatomic, retain) NSString *website;
@property (nullable, nonatomic, retain) ISCompany *company;
@property (nullable, nonatomic, retain) ISAddress *address;
@property (nullable, nonatomic, retain) NSOrderedSet<ISPost *> *posts;
@property (nullable, nonatomic, retain) NSSet<ISAlbum *> *albums;
@property (nullable, nonatomic, retain) NSSet<ISTodo *> *todos;

@end

@interface ISUser (CoreDataGeneratedAccessors)

- (void)insertObject:(ISPost *)value inPostsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromPostsAtIndex:(NSUInteger)idx;
- (void)insertPosts:(NSArray<ISPost *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removePostsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInPostsAtIndex:(NSUInteger)idx withObject:(ISPost *)value;
- (void)replacePostsAtIndexes:(NSIndexSet *)indexes withPosts:(NSArray<ISPost *> *)values;
- (void)addPostsObject:(ISPost *)value;
- (void)removePostsObject:(ISPost *)value;
- (void)addPosts:(NSOrderedSet<ISPost *> *)values;
- (void)removePosts:(NSOrderedSet<ISPost *> *)values;

- (void)addAlbumsObject:(ISAlbum *)value;
- (void)removeAlbumsObject:(ISAlbum *)value;
- (void)addAlbums:(NSSet<ISAlbum *> *)values;
- (void)removeAlbums:(NSSet<ISAlbum *> *)values;

- (void)addTodosObject:(ISTodo *)value;
- (void)removeTodosObject:(ISTodo *)value;
- (void)addTodos:(NSSet<ISTodo *> *)values;
- (void)removeTodos:(NSSet<ISTodo *> *)values;

@end

NS_ASSUME_NONNULL_END
