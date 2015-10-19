//
//  ISBaseCollectionViewController.m
//  is-test
//
//  Created by OLEG KALININ on 19.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISBaseCollectionViewController.h"
#import "ISAPIClient.h"

@interface ISBaseCollectionViewController ()

@end

@implementation ISBaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configurebar];
    [self updateStatus];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didNetworkReachabilityChangeNotification:)
                                                 name:AFNetworkingReachabilityDidChangeNotification
                                               object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
}

#pragma mark - Private
- (void)configurebar {
    UIBarButtonItem *btnStatus =
    [[UIBarButtonItem alloc] initWithTitle:@"..."
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(status)];
    
    self.navigationItem.rightBarButtonItem = btnStatus;
}

- (void)status {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Online Status"
                                                                   message:self.clientIsReachable? @"You online now": @"You offline now"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actClose = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:actClose];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)updateStatus {
    NSString *statusTitle = self.clientIsReachable? @"Online":@"Offline";
    self.navigationItem.rightBarButtonItem.title = statusTitle;
}

- (BOOL)clientIsReachable {
    return [ISAPIClient sharedClient].reachabilityManager.isReachable;
}

#pragma mark Public methods
/**
 *  Abstract. Nothing to do.
 */
- (void)beginUpdateData {
    return;
}

#pragma mark - Notification handlers
- (void)didNetworkReachabilityChangeNotification:(NSNotification *)notification {
    [self didNetworkReachabilityChangeStatus:[notification.userInfo[AFNetworkingReachabilityNotificationStatusItem] integerValue]];
    return;
}

- (void)didNetworkReachabilityChangeStatus:(AFNetworkReachabilityStatus)status {
    
    if (status > 0) {
        [self beginUpdateData];
    }
    
    [self updateStatus];
    
    return;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSAssert(NO, @"Method 'numberOfSectionsInCollectionView' must be overrided in child");

    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSAssert(NO, @"Method 'collectionView:numberOfItemsInSection' must be overrided in child");
    return 0;
}


@end
