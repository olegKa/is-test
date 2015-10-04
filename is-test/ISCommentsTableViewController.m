//
//  ISCommentsTableViewController.m
//  is-test
//
//  Created by OLEG KALININ on 04.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISCommentsTableViewController.h"
#import "UIViewController+IStest.h"
#import "ISPostTableViewCell.h"
#import "ISComment.h"
#import "ISAPIGetComments.h"

NSString *const identifierCommentCell = @"postCell";


@interface ISCommentsTableViewController ()
<
    ISFetchedResultControllerDelegate
>

@end

@implementation ISCommentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
    [self initializeFetchedResultsControllerForEntity:entity_comments andSortDescriptionKeyName:key_comment_id andSectionKeyName:nil];
    [self fetchedResultsControllerExecute];
    [self startUpdateData];
}

- (void)configure {
    self.tableView.estimatedRowHeight = 35.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"ISPostTableViewCell" bundle:nil] forCellReuseIdentifier:identifierCommentCell];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startUpdateData {
    ISAPIGetComments *operation = [[ISAPIGetComments alloc] initWithAction:[ISAPIAction actionWithMethod:ISAPIActionMethodComments]];
    operation.delegate = self;
    operation.postId = self.postId;
    [operation executeGET];
}

#pragma mark - ISFetchedResultControllerDelegate
- (NSPredicate *)predicateForFetchedResultController {
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"postId == %d", self.postId];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierCommentCell forIndexPath:indexPath];
    [self configureCell:(ISPostTableViewCell *)cell forIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(ISPostTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    ISComment * comment= [self.fetchedResultsController.sections[indexPath.section] objects][indexPath.row];
//    cell.textLabel.text = comment.name;
//    cell.detailTextLabel.text = comment.body;
    cell.title = comment.name;
    cell.body = comment.body;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
