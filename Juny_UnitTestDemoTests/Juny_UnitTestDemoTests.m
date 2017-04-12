//
//  Juny_UnitTestDemoTests.m
//  Juny_UnitTestDemoTests
//
//  Created by sy on 2017/4/11.
//  Copyright © 2017年 Juny. All rights reserved.
//
/*1、该类中以test开头的方法且void返回类型的方法都会变成单元测试用例
 *2、单元测试类继承自XCTestCase，他有一些重要的方法，其中最重要的有3个， setUp ,tearDown,measureBlock
 3、断言，大部分测试方法都会使用断言决定测试结果。所有断言都有一个类似的形式：比较，表达式为真假，强行失败等。
 
 //通用断言
 XCTAssert(expression, format...)
 //常用断言：
 XCTAssertTrue(expression, format...)
 XCTAssertFalse(expression, format...)
 XCTAssertEqual(expression1, expression2, format...)
 XCTAssertNotEqual(expression1, expression2, format...)
 XCTAssertEqualWithAccuracy(expression1, expression2, accuracy, format...)
 XCTAssertNotEqualWithAccuracy(expression1, expression2, accuracy, format...)
 XCTAssertNil(expression, format...)
 XCTAssertNotNil(expression, format...)
 
 XCTFail(format...) //直接Fail的断言
 */


//command +U 是全部测试的单元测试快捷键




//waitForExpectationsWithTimeout是等待时间，超过了就不再等待往下执行。
#define WAIT do {\
[self expectationForNotification:@"RSBaseTest" object:nil handler:nil];\
[self waitForExpectationsWithTimeout:30 handler:nil];\
} while (0);

#define NOTIFY \
[[NSNotificationCenter defaultCenter]postNotificationName:@"RSBaseTest" object:nil];

#import <XCTest/XCTest.h>
#import <AFNetworking.h>
#import <STAlertView.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "TestObject.h"

@interface Juny_UnitTestDemoTests : XCTestCase

@property (nonatomic, strong)STAlertView *stAlertView;

@end

@implementation Juny_UnitTestDemoTests

/**
 测试前调用
 */
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}


/**
 测试结束后调用
 */
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    //设置变量和设置预期值
    NSUInteger a = 10;NSUInteger b = 15;
    NSUInteger expected = 24;
    //执行方法得到实际值
    NSUInteger actual = [self add:a b:b];
    //断言判定实际值和预期是否符合
    XCTAssertNotEqual(expected, actual,@"add方法正确！");
}


/**
 性能测试方法，通过block中方法执行的时间，比对设定的标准值和偏差，觉得是否可以通过测试
 */
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
        mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
        
        // 2.发送GET请求
        [mgr GET:@"http://www.weather.com.cn/adat/sk/101110101.html" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"responseObject:%@",responseObject);
            XCTAssertNotNil(responseObject, @"返回出错");
            NOTIFY //继续执行
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error:%@",error);
            XCTAssertNil(error, @"请求出错");
            NOTIFY //继续执行
        }];
        WAIT  //暂停
    }];
}


-(NSUInteger)add:(NSUInteger)a b:(NSUInteger)b{
    return a+b;
}


/**
 测试网络请求，比方说接口有没有通，不同的参数返回的结果变化了
 什么的
 */
-(void)testRequest{
    // 1.获得请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
    
    // 2.发送GET请求
    [mgr GET:@"http://www.weather.com.cn/adat/sk/101110101.html" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject:%@",responseObject);
        XCTAssertNotNil(responseObject, @"返回出错");
        NOTIFY //继续执行
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
        XCTAssertNil(error, @"请求出错");
        NOTIFY //继续执行
    }];
    WAIT  //暂停
}

//- (void)testTestObjevt{
//    
////    NSMutableArray *array  = [NSMutableArray array];
////    [array addObject:@"111"];
////    XCTAssertEqual([@(1) integerValue], [array count],@"数组中元素个数是1");
//    
//    TestObject *ob = [[TestObject alloc]init];
//    ob.name = @"juny";
//    XCTAssertEqual(@"juny", ob.name,@"名字是相同的");
//}


//- (void)testTestObj{
//    
//    //    NSMutableArray *array  = [NSMutableArray array];
//    //    [array addObject:@"111"];
//    //    XCTAssertEqual([@(1) integerValue], [array count],@"数组中元素个数是1");
//    
//    TestObject *ob = [[TestObject alloc]init];
//    ob.name = @"juny";
//    XCTAssertEqualObjects(@"juny", ob.name,@"名字是相同的");
//}


@end
