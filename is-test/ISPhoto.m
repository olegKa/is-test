//
//  ISPhoto.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISPhoto.h"
#import "ISAlbum.h"

@implementation ISPhoto

+ (instancetype)photoWithData:(NSDictionary *)data {
    ISPhoto *photo = [ISPhoto objectForEntity:entity_photos withId:[data[key_photo_id] integerValue]];
    ISAlbum *album = [ISAlbum objectForEntity:entity_albums withId:[data[key_photo_albumId] integerValue]];
    
    if (!album) {
        NSAssert(NO, @"Album with albumId:%@ not found for photoId:%@", data[key_photo_albumId], data[key_photo_id]);
    }
    
    if (!photo) {
        photo = [NSEntityDescription insertNewObjectForEntityForName:entity_photos inManagedObjectContext:[CoreDataController sharedController].managedObjectContext];
    }
    
    photo.id = data[key_photo_id];
    photo.albumId = data[key_photo_albumId];
    photo.title = data[key_photo_title];
    photo.url = data[key_photo_url];
    photo.thumbnailUrl = data[key_photo_thumbnailUrl];
    
    photo.album = album;
    [album addPhotosObject:photo];
    
    return photo;
}


@end
