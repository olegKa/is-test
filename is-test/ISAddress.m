//
//  ISAddress.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAddress.h"
#import "ISUser.h"

@implementation ISAddress

+ (instancetype)addressWithData:(NSDictionary *)data {
    ISAddress *address = [ISAddress addressWithGeo:data[key_address_geo]];
    if (!address) {
        address = [NSEntityDescription insertNewObjectForEntityForName:entity_addresses inManagedObjectContext:[CoreDataController sharedController].managedObjectContext];
    }
    
    address.city = data[key_address_city];
    address.suite = data[key_address_suite];
    address.street = data[key_address_street];
    address.zipcode = data[key_address_zipcode];
    address.geo_lat = data[key_address_geo][key_address_geo_lat];
    address.geo_long = data[key_address_geo][key_address_geo_lng];
    
    return address;
}

+ (instancetype)addressWithGeo:(NSDictionary *)geo {
    id findedObject = nil;
    NSManagedObjectContext *context = [CoreDataController sharedController].managedObjectContext;
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entity_addresses
                                                  inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSPredicate *filterById = [NSPredicate predicateWithFormat:@"geo_lat == %@ and geo_long == %@", geo[key_address_geo_lat], geo[key_address_geo_lng]];
    [request setPredicate:filterById];
    [request setEntity:entityDesc];
    
    NSArray *data = [context executeFetchRequest:request error:nil];
    if (data.count > 0) {
        findedObject = [data firstObject];
    }
    
    return findedObject;
}

@end
