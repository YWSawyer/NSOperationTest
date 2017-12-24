//
//  ViewController.m
//  NSOperationTest
//
//  Created by wei.yuan on 22/12/2017.
//  Copyright © 2017 wei.yuan. All rights reserved.
//

#import "ViewController.h"
#import "YWOperation.h"
#import "NSObject+Exception.h"
#import "ViewController+Test.h"
#import "YWUncaughtException.h"

@interface ViewController ()

@property (nonatomic, strong) YWOperation *operation;

@end

@implementation ViewController

+ (void)load {
    NSLog(@"ViewController  load");
}

+ (void)initialize {
    NSLog(@"ViewController initialize");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSOperationQueue *queue = [NSOperationQueue new];
    queue.name = @"YW queue test queue";
    queue.maxConcurrentOperationCount = 5;
    YWOperation *op1 = [YWOperation new];
    YWOperation *op2 = [YWOperation new];
    [op2 addDependency:op1];
    [queue addOperation:op1];
    self.operation = op1;
    NSLog(@"op1 is %@",op1.thread.executing?@"executing":@"finished");
    [queue addOperation:op2];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewcontroller viewWillAppear");
}

- (IBAction)buttonAction:(UIButton *)sender {
    NSLog(@"op1 is %@",self.operation.thread.executing?@"executing":@"finished");
    
}
- (IBAction)exceptionAction:(UIButton *)sender {
    [self performSelector:@selector(exceptionMethod)];
//    [self testCategery];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation:%@",anInvocation);
    SEL sel = anInvocation.selector;
    [YWUncaughtException showTipWith:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return NO;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature* signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        signature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return signature;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;
}

- (void)testCategery {
    NSLog(@"View controller categery...");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
