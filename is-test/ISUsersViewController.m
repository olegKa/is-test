//
//  ISUsersViewController.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISUsersViewController.h"
#import "ISTabBarController.h"
#import "ISAddressAndCompanyTableViewController.h"
#import "CoreDataController.h"
#import "ISUser.h"
#import "ISAPIGetUsers.h"


NSString *const identifierUserCell = @"userCell";
NSString *const segueToPosts = @"segueUserToPosts";
NSString *const segueToAddress = @"segueUserToAddress";

@interface ISUsersViewController ()
<
    NSFetchedResultsControllerDelegate,
    ISAPIOperationDelegate
>

@end

@implementation ISUsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
    [self initializeFetchedResultsControllerForEntity:entity_user andSortDescriptionKeyName:key_user_name andSectionKeyName:nil];
    [self fetchedResultsControllerExecute];
    [self startUpdateData];
}

- (void)configure {
    self.navigationItem.title = @"USERS";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)startUpdateData {
    ISAPIGetUsers *operation = [[ISAPIGetUsers alloc] initWithAction:[ISAPIAction actionWithMethod:ISAPIActionMethodUsers]];
    operation.delegate = self;
    [operation executeGET];
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
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierUserCell forIndexPath:indexPath];
     [self configureCell:cell forIndexPath:indexPath];
     return cell;
 }

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    ISUser * user = [self.fetchedResultsController.sections[indexPath.section] objects][indexPath.row];
    cell.textLabel.text = user.name;
    cell.detailTextLabel.text = user.username;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:segueToPosts sender:indexPath];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:segueToAddress sender:indexPath];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *selectedIndexPath = (NSIndexPath *)sender;
    
    ISUser *selectedUser = [self.fetchedResultsController.sections[selectedIndexPath.section] objects][selectedIndexPath.row];
    
    if ([segue.destinationViewController isKindOfClass:[ISTabBarController class]]) {
        [(ISTabBarController *)segue.destinationViewController setUser:selectedUser];
    }
    
    if ([segue.destinationViewController isKindOfClass:[ISAddressAndCompanyTableViewController class]]) {
        [(ISAddressAndCompanyTableViewController *)segue.destinationViewController setUser:selectedUser];
    }

}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return [sender isKindOfClass:[NSIndexPath class]];
}

@end
