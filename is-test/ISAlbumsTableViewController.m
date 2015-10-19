//
//  ISAlbumsTableViewController.m
//  is-test
//
//  Created by OLEG KALININ on 04.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAlbumsTableViewController.h"
#import "ISPhotoCollectionViewController.h"
#import "ISTabBarController.h"
#import "ISAlbum.h"
#import "ISAPIGetAlbums.h"

static NSString *const identifierAlbumCell = @"albumCell";

@interface ISAlbumsTableViewController ()
<
    ISFetchedResultControllerDelegate
>

@end

@implementation ISAlbumsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
    self.fetchedResultControllerDelegate = self;
    [self initializeFetchedResultsControllerForEntity:entity_albums andSortDescriptionKeyName:key_album_title andSectionKeyName:nil];
    [self fetchedResultsControllerExecute];
    
}

- (void)configure {
    self.navigationItem.title = @"ALBUMS";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Properties
- (NSUInteger)userId {
    return [((ISTabBarController *)self.tabBarController).user.id integerValue];
}

#pragma mark - Override
- (void)beginUpdateData {
    ISAPIGetAlbums *operation = [[ISAPIGetAlbums alloc] initWithAction:[ISAPIAction actionWithMethod:ISAPIActionMethodAlbums]];
    operation.userId = self.userId;
    operation.delegate = self;
    [operation executeGET];
}

#pragma mark - Notification handlers
/*
 // Uncomment for override network reachability handling
 - (void)didNetworkReachabilityChangeStatus:(AFNetworkReachabilityStatus)status {
 if (status > 0) {
 [self beginUpdateData];
 }
 return;
 }
 
 */

#pragma mark - IBAction
- (IBAction)btnUsers:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - ISFetchedResultControllerDelegate
- (NSPredicate *)predicateForFetchedResultController {
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"userId == %d", self.userId];
    return filter;
}

#pragma mark - NSFetchedResultControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    NSLog(@"point");
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            NSLog(@"FetchController inserted");
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            NSLog(@"FetchController deleted");
            break;
        case NSFetchedResultsChangeUpdate:
            NSLog(@"FetchController updated");
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeMove:
            NSLog(@"FetchController moved");
            break;
    }
    
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.fetchedResultsController.sections[section] objects].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierAlbumCell forIndexPath:indexPath];
    [self configureCell:cell forIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    ISAlbum * album = [self.fetchedResultsController.sections[indexPath.section] objects][indexPath.row];
    cell.textLabel.text = album.title;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[ISPhotoCollectionViewController class]]) {
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        ISAlbum *album = [self.fetchedResultsController.sections[selectedIndexPath.section] objects][selectedIndexPath.row];
        ISPhotoCollectionViewController *vc = (ISPhotoCollectionViewController *)segue.destinationViewController;
        vc.albumId = [album.id integerValue];
    }
    
    
}


@end
