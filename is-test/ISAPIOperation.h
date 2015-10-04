//
//  ISAPIOperation.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISAPIAction.h"

@class ISAPIOperation;

@protocol ISAPIOperationDelegate <NSObject>

@optional
- (void)operationDone:(ISAPIOperation *)sender withData:(NSArray <NSDictionary *> *)data;
- (void)operationFailed:(ISAPIOperation *)sender withError:(NSError *)error;

@end

/**
 *  Base class for request to server
 */
@interface ISAPIOperation : NSObject

@property (nonatomic, assign) id<ISAPIOperationDelegate> delegate;
@property (nonatomic, strong) ISAPIAction *action;

- (instancetype)initWithAction:(ISAPIAction *)action;

- (void)executeWithParameters:(NSDictionary *)parameters success:(void (^) (NSArray *data))success failure:(void (^)(NSError *error))failure;
- (void)executeGET;

@end
