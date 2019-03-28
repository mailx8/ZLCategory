//
//  UIApplication+url.m
//  QMDemo
//
//  Created by 张文军 on 2018/11/28.
//  Copyright © 2018 张文军. All rights reserved.
//

#import "UIApplication+url.h"

@implementation UIApplication (url)

+ (BOOL)openURL:(NSURL *)url {
    
    if (url == nil) {
        return NO;
    }
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url]==NO) {
        return NO;
    }
    return [app openURL:url];
}

+ (BOOL)openURLString:(NSString *)urlString {
    
    if (urlString == nil) {
        return NO;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    return [self openURL:url];
}

+ (void)openURL:(NSURL *)url completionHandler:(void(^)(BOOL isSuccess))completion {
    if (url == nil) {
        if (completion) {
            completion(false);
        }
        return;
    }
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url] == NO) {
        if (completion) {
            completion(false);
        }
        return;
    }
    [app openURL:url options:@{} completionHandler:completion];
}

+ (void)openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *)options {
    if (url == nil) {
        return;
    }
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url] == NO) {
        return;
    }
    [app openURL:url options:options completionHandler:nil];
}

+ (void)openURLString:(NSString *)urlString options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *)options {
    if (urlString == nil) {
        return;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url] == NO) {
        return;
    }
    [app openURL:url options:options completionHandler:nil];
}

+ (void)openURLString:(NSString *)urlString completionHandler:(void(^)(BOOL isSuccess))completion {
    if (urlString == nil) {
        if (completion) {
            completion(false);
        }
        return;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url] == NO) {
        if (completion) {
            completion(false);
        }
        return;
    }
    [app openURL:url completionHandler:completion];
}

+ (void)openURLString:(NSString *)urlString options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *)options completionHandler:(void (^)(BOOL))completion {
    if (urlString == nil) {
        if (completion) {
            completion(false);
        }
        return;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url] == NO) {
        if (completion) {
            completion(false);
        }
        return;
    }
    [app openURL:url options:options completionHandler:completion];
}


- (BOOL)openURLString:(NSString *)urlString {
    if (urlString == nil) {
        return NO;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    if ([self canOpenURL:url] == NO) {
        return NO;
    }
    return [self openURLString:urlString];
}

- (void)openURL:(NSURL *)url completionHandler:(void (^)(BOOL))completion {
    if (url == nil) {
        if (completion) {
            completion(false);
        }
        return;
    }
    if ([self canOpenURL:url] == NO) {
        if (completion) {
            completion(false);
        }
        return;
    }
    [self openURL:url options:@{} completionHandler:completion];
}

- (void)openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *)options {
    if (url == nil) {
        return;
    }
    if ([self canOpenURL:url] == NO) {
        return;
    }
    [self openURL:url options:options completionHandler:nil];
}

- (void)openURLString:(NSString *)urlString completionHandler:(void(^)(BOOL isSuccess))completion {
    
    if (urlString == nil) {
        if (completion) {
            completion(false);
        }
        return;
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    if ([self canOpenURL:url] == NO) {
        if (completion) {
            completion(false);
        }
        return;
    }
    
    [self openURL:url options:@{} completionHandler:completion];
}

- (void)openURLString:(NSString *)urlString options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *)options {
    if (urlString == nil) {
        return;
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    if ([self canOpenURL:url] == NO) {
        return;
    }
    
    [self openURL:url options:options completionHandler:nil];
}

- (void)openURLString:(NSString *)urlString options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *)options completionHandler:(void (^)(BOOL))completion {
    if (urlString == nil) {
        if (completion) {
            completion(false);
        }
        return;
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    if ([self canOpenURL:url] == NO) {
        if (completion) {
            completion(false);
        }
        return;
    }
    
    [self openURL:url options:options completionHandler:completion];
}

@end
