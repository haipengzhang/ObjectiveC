//
//  Person.h
//  ObjectiveC
//
//  Created by haipeng on 2018/1/21.
//  Copyright © 2018年 haipeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject

@property (assign, nonatomic) NSString *name;
@property (strong, nonatomic) Dog *dog;
@property (strong, nonatomic) NSMutableArray *arr;

@end
