//
//  ISCompany.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define entity_companies @"Companies"

#define key_company_bs              @"bs"
#define key_company_catch_phrase    @"catchPhrase"
#define key_company_name            @"name"


@class ISUser;

NS_ASSUME_NONNULL_BEGIN

@interface ISCompany : NSManagedObject

+ (instancetype)companyWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END

#import "ISCompany+CoreDataProperties.h"
