//
//  NSObject+Exception.m
//  NSOperationTest
//
//  Created by wei.yuan on 23/12/2017.
//  Copyright © 2017 wei.yuan. All rights reserved.
//

#import "NSObject+Exception.h"

@implementation NSObject (Exception)


- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation:%@",anInvocation);
}


@end
