//
//  ISAddressAndCompanyTableViewController.m
//  is-test
//
//  Created by OLEG KALININ on 04.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAddressAndCompanyTableViewController.h"
#import "ISAddress.h"
#import "ISCompany.h"

@interface ISAddressAndCompanyTableViewController ()

@property (nonatomic, weak) IBOutlet UILabel *labelAddress;
@property (nonatomic, weak) IBOutlet UILabel *labelCompanyName;
@property (nonatomic, weak) IBOutlet UILabel *labelCompanyCatchPhrase;
@property (nonatomic, weak) IBOutlet UILabel *labelBs;

@end

@implementation ISAddressAndCompanyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureControls];
    
}

- (void)configureControls {
    self.navigationItem.title = self.user.name;
    
    self.labelAddress.text = [NSString stringWithFormat:@"%@, %@, %@", self.user.address.city, self.user.address.street, self.user.address.suite];
    self.labelCompanyName.text = [NSString stringWithFormat:@"Company: %@", self.user.company.name];
    self.labelCompanyCatchPhrase.text = self.user.company.catchPhrase;
    self.labelBs.text = self.user.company.bs;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
