//
//  CoreDataController.h
//  PrintFlips
//
//  Created by OLEG KALININ on 28.09.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define resource_directory_images @"Images"
#define resource_directory_sounds @"Sounds"

typedef NS_ENUM(int, ISResourceDirectory) {
    ISResourceDirectoryDocuments,
    ISResourceDirectoryImages,
    ISResourceDirectorySounds
};

@interface CoreDataController : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (CoreDataController *)sharedController;

- (void)saveContext;

- (NSURL *)resourceDirectory:(ISResourceDirectory)resourceDirectory;

- (NSURL *)applicationDocumentsDirectory;
- (NSURL *)applicationImagesDirectory;
- (NSURL *)applicationSoundsDirectory;

- (BOOL)removeResourceWithName:(NSString *)resourceName fromDirectory:(ISResourceDirectory)resourceDirectory;


@end
