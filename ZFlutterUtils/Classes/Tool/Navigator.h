//
//  Navigator.h
//  Runner
//
//  Created by 飞鱼 on 2020/1/3.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Navigator : NSObject

+ (void)pushURL:(NSString *)URLString params:(NSDictionary *)params completion:(void (^)(BOOL))completion;

+ (void)presentURL:(NSString *)URLString params:(NSDictionary *)params completion:(void (^)(BOOL))completion;

@end

NS_ASSUME_NONNULL_END
