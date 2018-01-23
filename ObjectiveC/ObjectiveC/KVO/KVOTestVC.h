//
//  KVOTestVC.h
//  ObjectiveC
//
//  Created by haipeng on 2018/1/21.
//  Copyright © 2018年 haipeng. All rights reserved.
//

/**
 1.基本监听方式；
 2.手动监听方式；
 3.复合对象监听方式；
 4.kvo原理：通过runtime在运行时新建了对象子类（并且把对象isa指针指向子类），在子类中重写属性的set方法。在属性赋值前后调用，利用willChangeValueForKey和didChangeValueForKey手动通知。
 */

#import <UIKit/UIKit.h>

@interface KVOTestVC : UIViewController

@end
