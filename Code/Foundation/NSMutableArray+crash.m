//
//  NSMutableArray+crash.m
//  ZLCategory
//
//  Created by 张丽 on 2019/3/19.
//  Copyright © 2019年 ZL. All rights reserved.
//

#import "NSMutableArray+crash.h"
#import <objc/runtime.h>

@implementation NSMutableArray (crash)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 设值  __NSArrayM  setObject:atIndexedSubscript:
        Class self_class = NSClassFromString(@"NSMutableArray");
        Method self_method = class_getInstanceMethod(self_class, @selector(h_setObject:atIndexedSubscript:));
        Class system_class = NSClassFromString(@"__NSArrayM");
        Method system_method = class_getInstanceMethod(system_class, @selector(setObject:atIndexedSubscript:));
        method_exchangeImplementations(system_method, self_method);
        
        // 取值  __NSArrayM  objectAtIndexedSubscript
        self_method = class_getInstanceMethod(self_class, @selector(h_objectAtIndexedSubscript:));
        system_method = class_getInstanceMethod(system_class, @selector(objectAtIndexedSubscript:));
        method_exchangeImplementations(system_method, self_method);
        
        // 新增插入 __NSArrayM  insertObject:atIndex:
        self_method = class_getInstanceMethod(self_class, @selector(h_insertObject:atIndex:));
        system_method = class_getInstanceMethod(system_class, @selector(insertObject:atIndex:));
        method_exchangeImplementations(self_method, system_method);

        // 替换 __NSArrayM  replaceObjectAtIndex:withObject:
        self_method = class_getInstanceMethod(self_class, @selector(h_replaceObjectAtIndex:withObject:));
        system_method = class_getInstanceMethod(system_class, @selector(replaceObjectAtIndex:withObject:));
        method_exchangeImplementations(system_method, self_method);
        
//        // 替换数组  NSMutableArray  replaceObjectsInRange:withObjectsFromArray:
//        self_method = class_getInstanceMethod(self_class, @selector(h_replaceObjectsInRange:withObjectsFromArray:));
//        system_class = NSClassFromString(@"NSMutableArray");
//        system_method = class_getInstanceMethod(system_class, @selector(replaceObjectsInRange:withObjectsFromArray:));
//        method_exchangeImplementations(system_method, self_method);
    });
}

- (void)h_setObject:(id)obj atIndexedSubscript:(NSUInteger)index {
    if (obj == nil) {
        return;
    }
    if (index > self.count) {
        return;
    }
    
    return [self h_setObject:obj atIndexedSubscript:index];
}

- (id)h_objectAtIndexedSubscript:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    
    return [self h_objectAtIndexedSubscript:index];
}

- (void)h_insertObject:(id)anObject atIndex:(NSUInteger)index {
    
    if (anObject == nil) {
        return;
    }
    if (index > self.count) {
        return;
    }
    
    return [self h_insertObject:anObject atIndex:index];
}

- (void)h_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    
    if (anObject == nil) {
        return;
    }
    if (index >= self.count) {
        return;
    }
    
    return [self h_replaceObjectAtIndex:index withObject:anObject];
}

//- (void)h_replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray {
//    if (otherArray == nil) {
//        return;
//    }
//    //    if (index >= self.count) {
//    //        return;
//    //    }
//    
//    return [self h_replaceObjectsInRange:range withObjectsFromArray:otherArray];
//}

@end
