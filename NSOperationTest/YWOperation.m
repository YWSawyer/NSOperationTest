//
//  YWOperation.m
//  NSOperationTest
//
//  Created by wei.yuan on 22/12/2017.
//  Copyright © 2017 wei.yuan. All rights reserved.
//

#import "YWOperation.h"

@interface YWOperation ()

@property (assign, nonatomic) BOOL isOver;

@property (nonatomic, strong) NSOperationQueue *queue;

@property (assign, nonatomic, getter = isExecuting) BOOL executing;
@property (assign, nonatomic, getter = isFinished) BOOL finished;
@end




@implementation YWOperation


@synthesize executing = _executing;
@synthesize finished = _finished;

- (instancetype)init {
    self = [super init];
    if (self) {
        _isOver = NO;
        return self;
    }
    return nil;
}

- (void)start {
    NSLog(@"start ....");
    self.thread = [NSThread currentThread];
    self.queue = [NSOperationQueue currentQueue];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:self.queue];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://124.65.36.50:8263/jilin/subsidyrecord/record"]];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request];
    
    [task resume];
}


- (void)done {
    self.finished = YES;
    self.executing = NO;
}

- (void)setFinished:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)executing {
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data {
    NSLog(@"didReceiveData %@",data);
    [self done];
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
    NSLog(@"chanllege %@",challenge);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler {
    NSLog(@"reponse %@",response);
    completionHandler(NSURLSessionResponseAllow);
}


@end
