//
//  ISUser.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISUser.h"
#import "ISAddress.h"
#import "ISAlbum.h"
#import "ISCompany.h"
#import "ISPost.h"
#import "ISTodo.h"

@implementation ISUser

+ (instancetype)userWithData:(NSDictionary *)data {
    ISUser *user = [self objectForEntity:entity_user withId:[data[key_user_id] integerValue]];
    if (!user) {
        user = [NSEntityDescription insertNewObjectForEntityForName:entity_user inManagedObjectContext:[CoreDataController sharedController].managedObjectContext];
    }
    
    user.id = data[key_user_id];
    user.username = data[key_user_username];
    user.phone = data[key_user_phone];
    user.name = data[key_user_name];
    user.website = data[key_user_website];
    
    NSDictionary *addressData = data[key_user_address];
    if (addressData) {
        ISAddress *address = [ISAddress addressWithData:addressData];
        if (address) {
            [address addUsersObject:user];
            user.address = address;
            [address addUsersObject:user];
        }
    }
    
    NSDictionary *companyData = data[key_user_company];
    if (companyData) {
        ISCompany *company = [ISCompany companyWithData:companyData];
        if (company) {
            [company addUsersObject:user];
            user.company = company;
            [company addUsersObject:user];
        }
    }
    
    return user;
}


@end
