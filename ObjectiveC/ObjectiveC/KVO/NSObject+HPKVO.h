//
//  NSObject+HPKVO.h
//  ObjectiveC
//
//  Created by haipeng on 2018/1/21.
//  Copyright © 2018年 haipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HPKVO)

- (void)HP_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
