//
//  NSArray+crash.m
//  ZLCategory
//
//  Created by 张丽 on 2019/3/19.
//  Copyright © 2019年 ZL. All rights reserved.
//

#import "NSArray+crash.h"
#import <objc/runtime.h>

@implementation NSArray (crash)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 替换空数组方法  __NSArray0 0 objectAtIndex
        Class self_class = NSClassFromString(@"NSArray");
        Method self_method = class_getInstanceMethod(self_class, @selector(objectAtIndex_0:));
        
        Class system_class = NSClassFromString(@"__NSArray0");
        Method system_method = class_getInstanceMethod(system_class, @selector(objectAtIndex:));
        method_exchangeImplementations(self_method, system_method);
        
        // 一个元素的数组  __NSSingleObjectArrayI 1  objectAtIndex
        self_method = class_getInstanceMethod(self_class, @selector(objectAtIndex_single:));
        system_class = NSClassFromString(@"__NSSingleObjectArrayI");
        system_method = class_getInstanceMethod(system_class, @selector(objectAtIndex:));
        method_exchangeImplementations(system_method, self_method);
        
        // 多个元素的数组  __NSArrayI 好多个  objectAtIndexedSubscript
        self_method = class_getInstanceMethod(self_class, @selector(objectAtIndexedSubscript_i:));
        system_class = NSClassFromString(@"__NSArrayI");
        system_method = class_getInstanceMethod(system_class, @selector(objectAtIndexedSubscript:));
        method_exchangeImplementations(system_method, self_method);

    });
}

- (id)objectAtIndex_0:(NSUInteger)index {
    
    if (index >= self.count) {
        return nil;
    }
    
    return [self objectAtIndex_0:index];
}


- (id)objectAtIndex_single:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    
    return [self objectAtIndex_single:index];
}

- (id)objectAtIndexedSubscript_i:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    
    return [self objectAtIndexedSubscript_i:index];
}

@end
