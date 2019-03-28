//
//  NSMutableDictionary+crash.m
//  ZLCategory
//
//  Created by 张丽 on 2019/3/21.
//  Copyright © 2019年 ZL. All rights reserved.
//

#import "NSMutableDictionary+crash.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (crash)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //  key值为nil __NSDictionaryM  setObject:forKeyedSubscript:
        Class  self_class = NSClassFromString(@"NSMutableDictionary");
        Method self_method = class_getInstanceMethod(self_class, @selector(h_setObject:forKeyedSubscript:));
        Class system_class = NSClassFromString(@"__NSDictionaryM");
        Method system_method = class_getInstanceMethod(system_class, @selector(setObject:forKeyedSubscript:));
        method_exchangeImplementations(system_method, self_method);
        
        // key值为nil __NSDictionaryM setObject:forKey:
        self_method = class_getInstanceMethod(self_class, @selector(h_setObject:forKey:));
        system_method = class_getInstanceMethod(system_class, @selector(setObject:forKey:));
        method_exchangeImplementations(system_method, self_method);
    });
}

- (void)h_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    
    if (key == nil) {
        return;
    }
    
    return [self h_setObject:obj forKeyedSubscript:key];
}

- (void)h_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (aKey == nil) {
        return;
    }
    
    return [self h_setObject:anObject forKey:aKey];
}

@end
