//
//  ISAPIGetAlbums.m
//  is-test
//
//  Created by OLEG KALININ on 04.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAPIGetAlbums.h"
#import "ISAlbum.h"

@implementation ISAPIGetAlbums

- (instancetype)initWithAction:(ISAPIAction *)action {
    if (self = [super initWithAction:action]) {
        _userId = NSNotFound;
    }
    return self;
}

- (void)executeGET {
    NSDictionary *parameters;
    
    if (self.userId != NSNotFound) {
        parameters = @{key_album_userId:@(self.userId)};
    }
    
    [self executeWithParameters:parameters success:^(NSArray *data) {
        for (NSDictionary *item in data) {
            [ISAlbum albumWithData:item];
        }
        [[CoreDataController sharedController] saveContext];
    } failure:nil];
}


@end
