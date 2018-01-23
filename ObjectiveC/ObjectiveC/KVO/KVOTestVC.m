//
//  KVOTestVC.m
//  ObjectiveC
//
//  Created by haipeng on 2018/1/21.
//  Copyright © 2018年 haipeng. All rights reserved.
//

#import "KVOTestVC.h"
#import "Person.h"
#import "NSObject+HPKVO.h"

@interface KVOTestVC ()

@property (strong, nonatomic) Person *person;

@end

@implementation KVOTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.person = [[Person alloc] init];
    
//    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
//    [self.person addObserver:self forKeyPath:@"dog.age" options:NSKeyValueObservingOptionNew context:nil];
//    [self.person addObserver:self forKeyPath:@"dog.level" options:NSKeyValueObservingOptionNew context:nil];
    
//    [self.person addObserver:self forKeyPath:@"dog" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.person HP_addObserver:self forKeyPath:@"dog" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"change is %@", change);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static NSInteger a = 0;
    
//    [self.person willChangeValueForKey:@"name"];
//    self.person.name = [NSString stringWithFormat:@"%@", @(a)];
//    [self.person didChangeValueForKey:@"name"];
    
    self.person.dog.age = a++;
    self.person.dog.level = a++;
    
    // 监听集合类 无法直接监听count，因为count是不是变量，而是结构体里面的标识
    NSMutableArray *temp = [self.person mutableArrayValueForKey:@"arr"];
    [temp addObject:@"test"];
    
}

@end
