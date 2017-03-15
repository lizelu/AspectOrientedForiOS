//
//  TestClass+Logging.m
//  AspectOrientedForiOS
//
//  Created by Mr.LuDashi on 2017/2/13.
//  Copyright © 2017年 ZeluLi. All rights reserved.
//

#import "TestClass+Logging.h"
#import <objc/runtime.h>

@implementation TestClass (Logging)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj swizzleMethod: @selector(testMethod)
                withMethod: @selector(logTestMethod)];
    });
}

- (void)logTestMethod{
    [self before];
    [self logTestMethod];
    [self after];
}

- (void)before {
    NSLog(@"调用方法之前要做的事情");
}

- (void)after {
    NSLog(@"调用方法之后要做的事情");
}

- (void)swizzleMethod:(SEL)originSEL withMethod:(SEL)newSEL {
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originSEL);
    Method swizzledMethod = class_getInstanceMethod(class, newSEL);
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}


@end
