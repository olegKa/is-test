//
//  ISAPIAction.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAPIAction.h"

#define method_posts    @"posts"
#define method_comments @"comments"
#define method_albums   @"albums"
#define method_photos   @"photos"
#define method_users    @"users"
#define method_totods   @"todos"

@implementation ISAPIAction

+ (instancetype)actionWithMethod:(ISAPIActionMethod)method {
    ISAPIAction *action = [[ISAPIAction alloc] initWithActionMainMethod:method forObjectId:0 andDetailMethod:ISAPIActionMethodUnknown];
    return action;
}

+ (instancetype)actionWithActionMainMethod:(ISAPIActionMethod)mainMethod forObjectId:(NSUInteger)objectId andDetailMethod:(ISAPIActionMethod)detailMethod {
    ISAPIAction *action = [[ISAPIAction alloc] initWithActionMainMethod:mainMethod forObjectId:objectId andDetailMethod:detailMethod];
    return action;
}

- (instancetype)initWithActionMainMethod:(ISAPIActionMethod)mainMethod forObjectId:(NSUInteger)objectId andDetailMethod:(ISAPIActionMethod)detailMethod {
    if (self = [super init]) {
        _mainMethod = mainMethod;
        _objectId = objectId;
        _detailMethod = detailMethod;
    }
    
    return self;
}

#pragma mark - Properties
- (NSString *)path {
    NSString *path = @"";
    if (self.mainMethod != ISAPIActionMethodUnknown) {
        path = [path stringByAppendingPathComponent:[self methodForAction:self.mainMethod]];
        if (self.objectId > 0) {
            path = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%lu", (unsigned long)self.objectId]];
            if (self.detailMethod != ISAPIActionMethodUnknown) {
                path = [path stringByAppendingPathComponent:[self methodForAction:self.detailMethod]];
            }
        }
    }
    
    return path;
}

#pragma mark - Private methods
- (NSString *)methodForAction:(ISAPIActionMethod)action {
    NSString *method;
    switch (action) {
        case ISAPIActionMethodPosts:
            method = method_posts;
            break;
        case ISAPIActionMethodComments:
            method =  method_comments;
            break;
        case ISAPIActionMethodAlbums:
            method =  method_albums;
            break;
        case ISAPIActionMethodPhotos:
            method =  method_photos;
            break;
        case ISAPIActionMethodUsers:
            method =  method_users;
            break;
        case ISAPIActionMethodTodos:
            method =  method_totods;
            break;
        default:
            NSAssert(NO, @"Unknown method for ISAPIAction");
            break;
    }
    return method;
}


@end
