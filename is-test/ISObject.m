//
//  ISObject.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISObject.h"

@implementation ISObject

+ (instancetype)objectForEntity:(NSString *)entity withId:(NSUInteger)objectId {
    
    id findedObject = nil;
    NSManagedObjectContext *context = [CoreDataController sharedController].managedObjectContext;
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entity
                                                  inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSPredicate *filterById = [NSPredicate predicateWithFormat:@"id == %lu", objectId];
    [request setPredicate:filterById];
    [request setEntity:entityDesc];
    
    NSArray *data = [context executeFetchRequest:request error:nil];
    if (data.count > 0) {
        findedObject = [data firstObject];
    }
    
    return findedObject;
}

@end
