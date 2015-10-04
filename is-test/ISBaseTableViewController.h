//
//  ISBaseTableViewController.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataController.h"
#import "ISAPIOperation.h"

@interface ISBaseTableViewController : UITableViewController
<
    NSFetchedResultsControllerDelegate,
    ISAPIOperationDelegate
>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

- (void)initializeFetchedResultsControllerForEntity:(NSString *)entity andSortDescriptionKeyName:(NSString *)sortKey andSectionKeyName:(NSString *)sectionKey;

- (void)fetchedResultsControllerExecute;

@end
