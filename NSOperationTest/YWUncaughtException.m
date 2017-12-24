//
//  YWUncaughtException.m
//  NSOperationTest
//
//  Created by wei.yuan on 23/12/2017.
//  Copyright © 2017 wei.yuan. All rights reserved.
//

#import "YWUncaughtException.h"
#import <UIKit/UIKit.h>

@implementation YWUncaughtException

+ (void)showTipWith:(SEL)sel {
    NSString *str = NSStringFromSelector(sel);
    NSString *tip = [NSString stringWithFormat:@"未找到方法：%@",str];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"异常提示" message:tip preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"sdg" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"action is handled");
    }];
    [alert addAction:action];
    UIApplication *app = [UIApplication sharedApplication];
    UIViewController *vc = app.delegate.window.rootViewController;
    [vc presentViewController:alert animated:YES completion:nil];
}

@end
