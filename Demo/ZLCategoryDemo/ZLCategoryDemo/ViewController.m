//
//  ViewController.m
//  ZLCategory
//
//  Created by 张丽 on 2019/3/18.
//  Copyright © 2019年 ZL. All rights reserved.
//

#import "ViewController.h"


// 针对未找到相对应方法，作异常处理
@interface NSObject (crash)

@end

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

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //        @try {
    //        } @catch (NSException *exception) {
    //            NSLog(@"处理异常%@",exception);
    //        } @finally {
    //            NSLog(@"异常处理完成");
    //        }
    
    /*
     测试 针对未找到相对应方法，作异常处理
     */
    //    NSObject *obj = [NSObject new];
    //    [obj performSelector:@selector(study)];
    //    NSLog(@"测试 针对未找到相对应方法，作异常处理");
    
    /*
     测试 不可变数组越界，作异常处理
     */
    //    NSArray *arr = @[@"1",@"2"];
    //    arr[2];
    //    NSLog(@"测试 数组越界，作异常处理");
    
    /*
     测试 可变数组，作异常处理
     */
    // 创建
    //    NSMutableArray *marray = [NSMutableArray array];
    //    // 根据数组创建
    //    NSMutableArray *marray = [NSMutableArray arrayWithArray:arr];
    //    // 预估值
    //    NSMutableArray *marray = [NSMutableArray arrayWithCapacity:20];
    
    // 设值
    // __NSArrayM  setObject:atIndexedSubscript:
    //        marray[2] = @"3";
    //    // 取值
    //    //__NSArrayM objectAtIndexedSubscript:
    //        marray[2];
    
    // 增
    //    // __NSArrayM  insertObject:atIndex:
    //        [marray addObject:nil];
    //    // __NSArrayM  insertObject:atIndex:
    //        [marray insertObject:nil atIndex:2];
    //    // 可新增空数组
    //        [marray addObjectsFromArray:arr];
    
    // 改
    // __NSArrayM  replaceObjectAtIndex:withObject:
    //    [marray replaceObjectAtIndex:2 withObject:@"2"];
    // 可替换空数组 NSMutableArray replaceObjectsInRange:withObjectsFromArray:
    //    [marray replaceObjectsInRange:NSMakeRange(1, 1) withObjectsFromArray:nil];
    //    NSLog(@"%@", marray);
    
    
    /*
     测试 不可变字典集合，作异常处理
     */
    //    NSDictionary *dict = [NSDictionary dictionary];
    // 根据一个路径，获得一个字典
    //        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    // 属性
    //    dict.count;
    //    dict.allKeys;
    //    dict.allValues;
    //    // 方法
    //    NSString *obj = [dict objectForKey:@"key"];
    //    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {}];
    //    dict[@"key"];
    //    NSLog(@"%@", dict[@"key"]);
    
    /*
     测试 可变字典集合，作异常处理
     */
    //        NSMutableDictionary *mdict = [NSMutableDictionary dictionary];
    //        mdict[@"name"] = @"zl";
    //        mdict[@"age"] = @(18);
    //        //  key值为nil __NSDictionaryM  setObject:forKeyedSubscript:
    //        mdict[nil] = @"nil";
    //        mdict.count;
    //        mdict.allKeys;
    //        mdict.allValues;
    //        // 取值
    //        NSString *valueStr = [mdict objectForKey:@"six"];
    //        NSLog(@"%@", valueStr);
    //        NSLog(@"%@", mdict);
    
    /*
     测试 webView 融错处理
     //     */
    //    UIWebView
    //
    //    - (void)loadRequest:(NSURLRequest *)request;
    //    - (void)loadHTMLString:(NSString *)string baseURL:(nullable NSURL *)baseURL;
    //    - (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName baseURL:(NSURL *)baseURL;
    
}


@end
