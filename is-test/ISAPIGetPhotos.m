//
//  ISAPIGetPhotos.m
//  is-test
//
//  Created by OLEG KALININ on 04.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAPIGetPhotos.h"
#import "ISPhoto.h"

@implementation ISAPIGetPhotos

- (instancetype)initWithAction:(ISAPIAction *)action {
    if (self = [super initWithAction:action]) {
        _albumId = NSNotFound;
    }
    return self;
}

- (void)executeGET {
    NSDictionary *parameters;
    
    if (self.albumId != NSNotFound) {
        parameters = @{key_photo_albumId:@(self.albumId)};
    }
    
    [self executeWithParameters:parameters success:^(NSArray *data) {
        for (NSDictionary *item in data) {
            [ISPhoto photoWithData:item];
        }
        [[CoreDataController sharedController] saveContext];
    } failure:nil];
}


@end
