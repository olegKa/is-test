//
//  CoreDataController.m
//  PrintFlips
//
//  Created by OLEG KALININ on 28.09.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "CoreDataController.h"
#import "NSManagedObjectModel+KCOrderedAccessorFix.h"

@implementation CoreDataController

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (instancetype)sharedController {
    static CoreDataController *_currentController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _currentController = [[CoreDataController alloc] init];
    });
    return _currentController;
}
#pragma mark - Private
- (NSString *)directoryOfResourceDirectroy:(ISResourceDirectory)resourceDirectory {
    switch (resourceDirectory) {
        case ISResourceDirectoryDocuments:
            return @"";
            break;
        case ISResourceDirectoryImages:
            return resource_directory_images;
            break;
        case ISResourceDirectorySounds:
            return resource_directory_sounds;
            break;
        default:
            break;
    }
}

#pragma mark - Helper - application Directories
- (NSURL *)resourceDirectory:(ISResourceDirectory)resourceDirectory {
    
    if (resourceDirectory == ISResourceDirectoryDocuments) {
        return [self applicationDocumentsDirectory];
    }
    
    NSString *cachedFolderPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *imageDir = [cachedFolderPath stringByAppendingPathComponent:[self directoryOfResourceDirectroy:resourceDirectory]];
    BOOL isDir;
    if (![[NSFileManager defaultManager] fileExistsAtPath:imageDir isDirectory:&isDir]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:imageDir withIntermediateDirectories:YES attributes:nil error:&error]; //Create folder
        if (error == nil) {
            return [NSURL URLWithString:imageDir];
        }
    } else {
        return [NSURL URLWithString:imageDir];
    }
    
    return nil;
}

- (NSURL *)applicationDocumentsDirectory {
    NSURL *appDocDir = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSLog(@"Application Directory:\n%@", appDocDir);
    return appDocDir;
}

- (NSURL *)applicationImagesDirectory {
    return [self resourceDirectory:ISResourceDirectoryImages];
}

- (NSURL *)applicationSoundsDirectory {
    return [self resourceDirectory:ISResourceDirectorySounds];
}

- (BOOL)removeResourceWithName:(NSString *)resourceName fromDirectory:(ISResourceDirectory)resourceDirectory {
    
    NSString *pathToResource = [[[self resourceDirectory:resourceDirectory] URLByAppendingPathComponent:resourceName] absoluteString];
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:pathToResource]) {
        NSError *error;
        [fm removeItemAtPath:pathToResource error:&error];
        if (error) {
            return NO;
        }
    }
    return YES;
}

#pragma mark - Properties
- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"is-test" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    [_managedObjectModel kc_generateOrderedSetAccessors];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"is-test.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


@end
