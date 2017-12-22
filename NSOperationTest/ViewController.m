//
//  ViewController.m
//  NSOperationTest
//
//  Created by wei.yuan on 22/12/2017.
//  Copyright © 2017 wei.yuan. All rights reserved.
//

#import "ViewController.h"
#import "YWOperation.h"

@interface ViewController ()

@property (nonatomic, strong) YWOperation *operation;

@end

@implementation ViewController

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

- (IBAction)buttonAction:(UIButton *)sender {
    NSLog(@"op1 is %@",self.operation.thread.executing?@"executing":@"finished");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
