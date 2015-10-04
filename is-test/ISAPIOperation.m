//
//  ISAPIOperation.m
//  is-test
//
//  Created by OLEG KALININ on 03.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISAPIOperation.h"
#import "ISAPIClient.h"


@implementation ISAPIOperation

- (instancetype)initWithAction:(ISAPIAction *)action {
    if (self = [super init]) {
        _action = action;
    }
    return self;
}

- (void)executeWithParameters:(NSDictionary *)parameters success:(void (^) (NSArray *data))success failure:(void (^)(NSError *error))failure {
    ISAPIClient *apiClient = [ISAPIClient sharedClient];
    
    NSLog(@"POST with url:%@", self.action.path);
    
    [apiClient GET:self.action.path parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        // 1 - Попытка десериализации полученных данных и обработка ошибки, если не удалось
        NSError *error = nil;
        id message = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        if (error && message == nil) {
            [self processError:error withFailureBlock:failure];
            return;
        }
        
        // 2 - Обработка результата. Если пришел массив объктов, то передаю его. Если пришел NSDictionary, значит только один объект в выборке, генерю массив из одного объекта и отправляю заказчику
        NSArray *result;
        if ([message isKindOfClass:[NSArray class]]) {
            result = message;
        } else if ([message isKindOfClass:[NSDictionary class]]) {
            result = @[message];
        } else {
            // 2.1 - Если какой-то странный тип, то генерю ошибку
            NSError *err = [NSError errorWithDomain:@"ISAPIError" code:-1 userInfo:@{NSLocalizedDescriptionKey : @"Unknown Error"}];
            [self processError:err withFailureBlock:failure];
            return;
        }
        
        
        // 3 - отправлю результат
        if (success) {
            success(result);
        } else {
            if ([self.delegate respondsToSelector:@selector(operationDone:withData:)]) {
                [self.delegate operationDone:self withData:result];
            }
        }
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self processError:error withFailureBlock:failure];
        
    }];
}


/**
 *  Обработка ошибки через замыкание, или, если замыкание не определено, по протоколу через делегата
 *
 *  @param error        ошибка
 *  @param failureBlock замыкание для обработки ошибки или nil. Тогда ошибка уходит делегату ISAPIOperationDelegate
 */
- (void)processError:(NSError *)error withFailureBlock:(void (^)(NSError *error))failureBlock {
    if (failureBlock) {
        failureBlock(error);
    } else {
        if ([self.delegate respondsToSelector:@selector(operationFailed:withError:)]) {
            [self.delegate operationFailed:self withError:error];
        }
    }
}

#pragma mark - Abstract methods
- (void)executeGET {
    return;
}

@end
