//
//  UIApplication+crash.m
//  ZLCategory
//
//  Created by 张丽 on 2019/3/18.
//  Copyright © 2019年 ZL. All rights reserved.
//

#import "UIApplication+crash.h"
#import <objc/runtime.h>

@implementation UIApplication (crash)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 替换系统方法
        Method system_method = class_getInstanceMethod(self, @selector(openURL:options:completionHandler:));
        Method self_method = class_getInstanceMethod(self, @selector(h_openURL:options:completionHandler:));
        method_exchangeImplementations(system_method, self_method);
        
        system_method = class_getInstanceMethod(self, @selector(openURL:));
        self_method = class_getInstanceMethod(self, @selector(h_openURL:));
        method_exchangeImplementations(system_method, self_method);
    });
}

- (void)h_openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *)options completionHandler:(void (^)(BOOL))completion{
    if (url == nil) {
        return;
    }
    if ([self canOpenURL:url] == NO) {
        return;
    }
    
    [self h_openURL:url options:options completionHandler:completion];
}

- (BOOL)h_openURL:(NSURL *)url {
    if (url == nil) {
        return NO;
    }
    if ([self canOpenURL:url] == NO) {
        return NO;
    }
    
    return [self h_openURL:url];
}

@end
