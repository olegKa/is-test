//
//  ISAPIGetUsers.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAPIGetUsers.h"
#import "ISUser.h"

@implementation ISAPIGetUsers

- (void)executeGET {
    [self executeWithParameters:nil success:^(NSArray *data) {
        for (NSDictionary *item in data) {
            ISUser *user = [ISUser userWithData:item];
            
        }
    } failure:nil];
}

@end
