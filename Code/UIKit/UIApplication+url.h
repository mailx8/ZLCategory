//
//  UIApplication+url.h
//  QMDemo
//
//  Created by 张文军 on 2018/11/28.
//  Copyright © 2018 张文军. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (url)

+ (BOOL)openURL:(NSURL *)url;
+ (BOOL)openURLString:(NSString *)urlString;

+ (void)openURL:(NSURL *)url completionHandler:(void(^)(BOOL isSuccess))completion;
+ (void)openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *)options;
+ (void)openURLString:(NSString *)urlString options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *)options;
+ (void)openURLString:(NSString *)urlString completionHandler:(void(^)(BOOL isSuccess))completion;
+ (void)openURLString:(NSString *)urlString options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *)options completionHandler:(void (^)(BOOL))completion;


- (BOOL)openURLString:(NSString *)urlString;

- (void)openURL:(NSURL *)url completionHandler:(void (^)(BOOL))completion;
- (void)openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *)options;
- (void)openURLString:(NSString *)urlString completionHandler:(void(^)(BOOL isSuccess))completion;
- (void)openURLString:(NSString *)urlString options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *)options;
- (void)openURLString:(NSString *)urlString options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *)options completionHandler:(void (^)(BOOL))completion;

@end

NS_ASSUME_NONNULL_END
