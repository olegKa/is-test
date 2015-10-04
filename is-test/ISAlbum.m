//
//  ISAlbum.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAlbum.h"
#import "ISPhoto.h"
#import "ISUser.h"

@implementation ISAlbum

+ (instancetype)albumWithData:(NSDictionary *)data {
    ISAlbum *album = [ISAlbum objectForEntity:entity_albums withId:[data[key_album_id] integerValue]];
    ISUser *user = [ISUser objectForEntity:entity_user withId:[data[key_album_userId] integerValue]];
    
    if (!user) {
        NSAssert(NO, @"User with userId:%@ not found for albumId:%@", data[key_album_userId], data[key_album_id]);
    }
    
    if (!album) {
        album = [NSEntityDescription insertNewObjectForEntityForName:entity_albums inManagedObjectContext:[CoreDataController sharedController].managedObjectContext];
    }
    
    album.id = data[key_album_id];
    album.userId = data[key_album_userId];
    album.title = data[key_album_title];
    
    album.user = user;
    [user addAlbumsObject:album];
    
    return album;
}

@end
