//
//  ISPostsTableViewController.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISPostsTableViewController.h"
#import "ISTabBarController.h"
#import "ISCommentsTableViewController.h"
#import "ISPostTableViewCell.h"
#import "ISPost.h"
#import "ISAPIGetPosts.h"

NSString *const identifierPostCell = @"postCell";

@interface ISPostsTableViewController ()
<
    ISFetchedResultControllerDelegate
>

@end

@implementation ISPostsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
    self.fetchedResultControllerDelegate = self;
    [self initializeFetchedResultsControllerForEntity:entity_posts andSortDescriptionKeyName:key_post_id andSectionKeyName:nil];
    [self fetchedResultsControllerExecute];
    [self startUpdateData];

}

- (void)configure {
    self.navigationItem.title = @"POSTS";
    self.tableView.estimatedRowHeight = 35.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"ISPostTableViewCell" bundle:nil] forCellReuseIdentifier:identifierPostCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Properties
- (NSUInteger)userId {
    return [((ISTabBarController *)self.tabBarController).user.id integerValue];
}

- (void)startUpdateData {
    ISAPIGetPosts *operation = [[ISAPIGetPosts alloc] initWithAction:[ISAPIAction actionWithMethod:ISAPIActionMethodPosts]];
    operation.userId = self.userId;
    operation.delegate = self;
    [operation executeGET];
}

#pragma mark - ISFetchedResultControllerDelegate
- (NSPredicate *)predicateForFetchedResultController {
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"userId == %d", self.userId];
    return filter;
}

#pragma mark - IBAction
- (IBAction)btnUsers:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierPostCell forIndexPath:indexPath];
    [self configureCell:(ISPostTableViewCell *)cell forIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(ISPostTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    ISPost * post = [self.fetchedResultsController.sections[indexPath.section] objects][indexPath.row];
//    cell.textLabel.text = post.title;
//    cell.detailTextLabel.text = post.body;
    cell.title = post.title;
    cell.body = post.body;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"segueToComments" sender:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[ISCommentsTableViewController class]]) {
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        ISPost *post = [self.fetchedResultsController.sections[selectedIndexPath.section] objects][selectedIndexPath.row];
        [((ISCommentsTableViewController *)segue.destinationViewController) setPostId:[post.id integerValue]];
    }
}


@end
