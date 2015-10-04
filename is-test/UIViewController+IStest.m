//
//  UIViewController+IStest.m
//  is-test
//
//  Created by OLEG KALININ on 04.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//
#import <objc/runtime.h>
#import "UIViewController+IStest.h"

static void *FetchedResultsControllerExtension;

@implementation UIViewController (IStest)

#pragma mark - Properties
- (NSFetchedResultsController *)fetchedResultsController {
    NSFetchedResultsController  *result = objc_getAssociatedObject(self, &FetchedResultsControllerExtension);
    return result;
}

- (void)setFetchedResultsController:(NSFetchedResultsController *)fetchedResultsController {
    objc_setAssociatedObject(self, &FetchedResultsControllerExtension, fetchedResultsController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - ISAPIOperationDelegate
- (void)operationDone:(ISAPIOperation *)sender withData:(NSArray<NSDictionary *> *)data {
    return;
}

- (void)operationFailed:(ISAPIOperation *)sender withError:(NSError *)error {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:error.userInfo[NSLocalizedDescriptionKey]
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - NSFetchedResultController
- (void)initializeFetchedResultsControllerForEntity:(NSString *)entity andSortDescriptionKeyName:(NSString *)sortKey andSectionKeyName:(NSString *)sectionKey
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entity];
    
    NSSortDescriptor *userSort = [NSSortDescriptor sortDescriptorWithKey:sortKey ascending:YES];
    
    [request setSortDescriptors:@[userSort]];
    
    NSManagedObjectContext *moc = [CoreDataController sharedController].managedObjectContext;
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:moc
                                                                          sectionNameKeyPath:sectionKey
                                                                                   cacheName:nil];
    [self.fetchedResultsController setDelegate:self];
    
}

- (void)fetchedResultsControllerExecute {
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"Failed to initialize FetchedResultsController: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
}

@end
