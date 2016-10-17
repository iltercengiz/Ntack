//
//  StackTests.m
//  Ntack
//
//  Created by Ilter Cengiz on 17/10/2016.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Stack.h"

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

@end
