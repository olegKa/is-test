//
//  ISCompany.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISCompany.h"
#import "ISUser.h"

@implementation ISCompany

+ (instancetype)companyWithData:(NSDictionary *)data {
    ISCompany *company = [ISCompany companyWithName:data[key_company_name]];
    if (!company) {
        company = [NSEntityDescription insertNewObjectForEntityForName:entity_companies inManagedObjectContext:[CoreDataController sharedController].managedObjectContext];
    }
    
    company.bs = data[key_company_bs];
    company.name = data[key_company_name];
    company.catchPhrase = data[key_company_catch_phrase];
    
    return company;
}

+ (instancetype)companyWithName:(NSString *)name {
    id findedObject = nil;
    NSManagedObjectContext *context = [CoreDataController sharedController].managedObjectContext;
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entity_companies
                                                  inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSPredicate *filterById = [NSPredicate predicateWithFormat:@"name == %@", name];
    [request setPredicate:filterById];
    [request setEntity:entityDesc];
    
    NSArray *data = [context executeFetchRequest:request error:nil];
    if (data.count > 0) {
        findedObject = [data firstObject];
    }
    
    return findedObject;
}

@end
