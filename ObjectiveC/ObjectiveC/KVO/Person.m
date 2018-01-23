//
//  Person.m
//  ObjectiveC
//
//  Created by haipeng on 2018/1/21.
//  Copyright © 2018年 haipeng. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dog = [[Dog alloc] init];
        _arr = NSMutableArray.array;
    }
    return self;
}

/*
 * 默认是Yes，自动通知到Observer。
 * 关闭之后可以通过willChangeValueForKey和didChangeValueForKey手动通知到Observer
 */
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
    return NO;
}

/*
 * 复合对象添加依赖方式, 正常返回为nil；
 */
+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key
{
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"dog"]) {
        keyPaths = [keyPaths setByAddingObjectsFromArray:@[@"_dog.age", @"_dog.level"]];
    }
    return keyPaths;
}

@end
