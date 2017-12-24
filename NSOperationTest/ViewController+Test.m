//
//  ViewController+Test.m
//  NSOperationTest
//
//  Created by wei.yuan on 24/12/2017.
//  Copyright © 2017 wei.yuan. All rights reserved.
//

#import "ViewController+Test.h"

@implementation ViewController (Test)


- (void)testCategery {
    NSLog(@"View controller categery...");
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewcontroller+test viewWillAppear");
}

@end
