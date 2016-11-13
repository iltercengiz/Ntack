//
//  StackTests.m
//  Ntack
//
//  Created by Ilter Cengiz on 17/10/2016.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Stack.h"

/*****/

@interface StackThread : NSThread

@property (nonatomic, copy) void (^operation)();

@end

@implementation StackThread

- (void)main {
    self.operation();
}

@end

/*****/

@interface StackTests : XCTestCase

@property (nonatomic) Stack *stack;

@end

@implementation StackTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.stack = [Stack stackWithCapacity:5];
    [self.stack push:@1];
    [self.stack push:@2];
    [self.stack push:@3];
    [self.stack push:@4];
    [self.stack push:@5];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCount {
    XCTAssertEqual(5, self.stack.count, @"Count is failed! Objects are seem not to be added!");
}

- (void)testPop {
    XCTAssertEqualObjects([self.stack pop], @5, @"Objects are not equal!");
}

- (void)testPush {
    [self.stack push:@6];
    XCTAssertEqualObjects([self.stack peek], @6, @"Object couldn't be pushed!");
    XCTAssertEqual(6, self.stack.count, @"Object couldn't be pushed!");
}

- (void)testThreadSafety {
    __weak typeof(self) weakSelf = self;
    
    XCTestExpectation *expectation1 = [self expectationWithDescription:@"thread1"];
    StackThread *thread1 = [StackThread new];
    thread1.threadPriority = 0.01;
    thread1.operation = ^{
        NSLog(@"Running thread1...");
        NSLog(@"Popped: %@", [weakSelf.stack pop]);
        NSLog(@"Finished running thread1...");
        [expectation1 fulfill];
    };
    
    XCTestExpectation *expectation2 = [self expectationWithDescription:@"thread2"];
    StackThread *thread2 = [StackThread new];
    thread2.threadPriority = 0.1;
    thread2.operation = ^{
        NSLog(@"Running thread1...");
        [weakSelf.stack push:@6];
        NSLog(@"Pushed! New stack: %@", [self.stack allObjects]);
        NSLog(@"Finished running thread2...");
        [expectation2 fulfill];
    };
    
    [thread1 start]; NSLog(@"Dispatched thread1!");
    [thread2 start]; NSLog(@"Dispatched thread2!");
    
    [self waitForExpectationsWithTimeout:3 handler:^(NSError * _Nullable error) {
        NSLog(@"Failed to fulfill: %@", error.localizedDescription);
    }];
    XCTAssertTrue([NSThread isMultiThreaded], @"Not running multi!");
    XCTAssertEqual(5, self.stack.count, @"Object couldn't be pushed!");
    XCTAssertEqualObjects([self.stack peek], @6, @"Objects are not equal!");
    
    NSLog(@"Stack: %@", self.stack);
}

@end
