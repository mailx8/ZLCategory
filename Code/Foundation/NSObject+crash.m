//
//  NSObject+crash.m
//  ZLCategory
//
//  Created by 张丽 on 2019/3/19.
//  Copyright © 2019年 ZL. All rights reserved.
//

#import "NSObject+crash.h"

@implementation NSObject (crash)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
#ifdef DEBUG
    NSLog(@"%@ - %@ 方法没找到", self, NSStringFromSelector(aSelector));
#endif
    
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
}

@end
