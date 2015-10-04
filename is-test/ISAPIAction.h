//
//  ISAPIAction.h
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(int, ISAPIActionMethod) {
    ISAPIActionMethodUnknown,
    ISAPIActionMethodPosts,
    ISAPIActionMethodComments,
    ISAPIActionMethodAlbums,
    ISAPIActionMethodPhotos,
    ISAPIActionMethodUsers,
    ISAPIActionMethodTodos
};

@interface ISAPIAction : NSObject

@property (nonatomic, assign) ISAPIActionMethod mainMethod;
@property (nonatomic, assign) ISAPIActionMethod detailMethod;
@property (nonatomic, assign) NSUInteger objectId;

@property (nonatomic, readonly) NSString *path;

+ (instancetype)actionWithMethod:(ISAPIActionMethod)method;
+ (instancetype)actionWithActionMainMethod:(ISAPIActionMethod)mainMethod forObjectId:(NSUInteger)objectId andDetailMethod:(ISAPIActionMethod)detailMethod;

- (instancetype)initWithActionMainMethod:(ISAPIActionMethod)mainMethod forObjectId:(NSUInteger)objectId andDetailMethod:(ISAPIActionMethod)detailMethod;


@end
