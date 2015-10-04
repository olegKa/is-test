//
//  ISObject.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "CoreDataController.h"

@interface ISObject : NSManagedObject

+ (instancetype)objectForEntity:(NSString *)entity withId:(NSUInteger)objectId;

@end
