//
//  SummerTests.m
//  Ntack
//
//  Created by Ilter Cengiz on 17/10/2016.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Summer.h"

@interface SummerTests : XCTestCase

@end

@implementation SummerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSumOfelementsInArray {
    NSArray<NSNumber *> *array = @[@10, @12, @1, @3, @5, @0, @0, @9, @11, @7, @55];
    XCTAssertTrue([Summer array:array hasPairWithSum:13]);
    XCTAssertTrue([Summer array:array hasPairWithSum:56]);
    XCTAssertTrue([Summer array:array hasPairWithSum:56]);
    XCTAssertTrue([Summer array:array hasPairWithSum:4]);
    XCTAssertTrue([Summer array:array hasPairWithSum:8]);
    XCTAssertTrue([Summer array:array hasPairWithSum:19]);
    XCTAssertTrue([Summer array:array hasPairWithSum:0]);
    XCTAssertFalse([Summer array:array hasPairWithSum:-10]);
    XCTAssertFalse([Summer array:array hasPairWithSum:27]);
}

@end
