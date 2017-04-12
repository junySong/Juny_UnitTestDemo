//
//  Object.m
//  Juny_UnitTestDemo
//
//  Created by sy on 2017/4/12.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestObject.h"
#import <OCMockito.h>


@interface Object : XCTestCase
@property (nonatomic, strong) TestObject *object;
@end

@implementation Object

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _object = [[TestObject alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    _object.name = @"Juny";
    XCTAssertEqualObjects(@"Juny", _object.name,@"名字是相同的");
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

//- (void)testTestObj{
//    
//    //    NSMutableArray *array  = [NSMutableArray array];
//    //    [array addObject:@"111"];
//    //    XCTAssertEqual([@(1) integerValue], [array count],@"数组中元素个数是1");
//    
////    TestObject *ob = MKTMockClass([TestObject class]);.name = @"juny";
//    XCTAssertEqualObjects(@"juny", _object.name,@"名字是相同的");
////    [mockArray removeObjectAtIndex:2];
//}

@end
