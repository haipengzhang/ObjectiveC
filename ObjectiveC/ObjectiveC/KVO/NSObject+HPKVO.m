//
//  NSObject+HPKVO.m
//  ObjectiveC
//
//  Created by haipeng on 2018/1/21.
//  Copyright © 2018年 haipeng. All rights reserved.
//

#import "NSObject+HPKVO.h"
#import <objc/runtime.h>

@implementation NSObject (HPKVO)

- (void)HP_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context
{
    // 1.新建一个类
    NSString *className = [NSString stringWithFormat:@"HP_%@", NSStringFromClass(self.class)];
    Class newClass = objc_allocateClassPair(self.class, className.UTF8String, 0);
    objc_registerClassPair(newClass);
    
    // 2.修改调用者的类型，对象没变但是类改变了
    object_setClass(self, newClass);
    
    // 3.重写对象setter方法（实际上就是添加方法）(oc的方法是selector和imp组成，前者是编号后者是实现(函数指针))
    class_addMethod(newClass, @selector(setName:), (IMP)hpSetName, "");
}

// oc函数(最后都是c函数)都带两个参数，self方法的调用者，_cmd方法编号
// OC的消息发送机制：objc_msgSend(id self, SEL _cmd, ...)
void hpSetName(id self, SEL _cmd, NSString *newName)
{
}

@end
