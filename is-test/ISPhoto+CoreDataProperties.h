//
//  ISPhoto+CoreDataProperties.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ISPhoto.h"

NS_ASSUME_NONNULL_BEGIN

@interface ISPhoto (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *albumId;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSString *thumbnailUrl;
@property (nullable, nonatomic, retain) ISAlbum *album;

@end

NS_ASSUME_NONNULL_END
