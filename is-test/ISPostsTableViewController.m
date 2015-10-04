//
//  ISPostsTableViewController.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISPostsTableViewController.h"
#import "ISPost.h"

@interface ISPostsTableViewController ()

@end

@implementation ISPostsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeFetchedResultsControllerForEntity:entity_post andSortDescriptionKeyName:key_user_name andSectionKeyName:nil];
    [self fetchedResultsControllerExecute];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Properties
- (void)setUserId:(NSUInteger)userId {
    _userId = userId;
    
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
