//
//  AppTests.m
//  AppTests
//
//  Created by 黄国颂 on 2020/8/10.
//  Copyright © 2020 黄国颂. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Unit_Tests : XCTestCase

@end

@implementation Unit_Tests

// #1.1 
// 所有测试方法执行之前都会执行这个方法，如果我们需要测试一个对象的方法，可现在这个方法里实例化对象。
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

// 所有测试方法执行之后都会执行这个方法
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

// 一个测试用例，里面可以写测试代码，我们自己写测试方法，都以test开头，才会有自动执行
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertTrue(5 > 3, @"不符合预期");
}

// 性能测试用例的一个例子
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

// #1.2
/**
 1.必须是对象方法，无返回值，函数必须以test开头
 2.测试函数执行的顺序：以函数名中test后面的字符大小有关，比如-(void)test001XXX会先于-(void)test002XXX执行；
 */

// #1.3 断言
/**
 // 生成一个失败的测试；
 XCTFail(format…)

 // 为空判断，a1为空时通过，反之不通过；
 XCTAssertNil(a1, format...)

 // 不为空判断，a1不为空时通过，反之不通过；
 XCTAssertNotNil(a1, format…)

 // 当expression求值为TRUE时通过；
 XCTAssert(expression, format...)

 // 当expression求值为TRUE时通过；
 XCTAssertTrue(expression, format...)

 // 当expression求值为False时通过；
 XCTAssertFalse(expression, format...)

 // 判断相等，[a1 isEqual:a2]值为TRUE时通过，其中一个不为空时，不通过；
 XCTAssertEqualObjects(a1, a2, format...)

 // 判断不等，[a1 isEqual:a2]值为False时通过；
 XCTAssertNotEqualObjects(a1, a2, format...)

 // 判断相等（当a1和a2是 C语言标量、结构体或联合体时使用, 判断的是变量的地址，如果地址相同则返回TRUE，否则返回NO）；
 XCTAssertEqual(a1, a2, format...)

 // 判断不等（当a1和a2是 C语言标量、结构体或联合体时使用）；
 XCTAssertNotEqual(a1, a2, format...)

 // 判断相等，（double或float类型）提供一个误差范围，当在误差范围（+/-accuracy）以内相等时通过测试；
 XCTAssertEqualWithAccuracy(a1, a2, accuracy, format...)

 // 判断不等，（double或float类型）提供一个误差范围，当在误差范围以内不等时通过测试；
 XCTAssertNotEqualWithAccuracy(a1, a2, accuracy, format...)

 // 异常测试，当expression发生异常时通过；反之不通过；（很变态）
 XCTAssertThrows(expression, format...)

 // 异常测试，当expression发生specificException异常时通过；反之发生其他异常或不发生异常均不通过；
 XCTAssertThrowsSpecific(expression, specificException, format...)

 // 异常测试，当expression发生具体异常、具体异常名称的异常时通过测试，反之不通过；
 XCTAssertThrowsSpecificNamed(expression, specificException, exception_name, format...)

 // 异常测试，当expression没有发生异常时通过测试；
 XCTAssertNoThrow(expression, format…)

 // 异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过；
 XCTAssertNoThrowSpecific(expression, specificException, format...)

 // 异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过
 XCTAssertNoThrowSpecificNamed(expression, specificException, exception_name, format...)*
 */

@end
