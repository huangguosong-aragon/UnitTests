//
//  ViewControllerTests.m
//  AppTests
//
//  Created by 黄国颂 on 2020/8/10.
//  Copyright © 2020 黄国颂. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ViewControllerTests : XCTestCase

@property (nonatomic, strong) ViewController *viewController;

@end

@implementation ViewControllerTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.viewController = [ViewController new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

// #2.1
- (void)testFunction {
    BOOL result1 = [self.viewController isCanClickWithInput:@"name"];
    XCTAssertFalse(result1, @"Failed");
    
    BOOL result2 = [self.viewController isCanClickWithInput:@"username"];
    XCTAssertTrue(result2, @"Failed");
}

// #2.2
- (void)testAsync {
    XCTestExpectation *expectation = [self expectationWithDescription:@"timeout"];
    [self.viewController asyncWithSleep:3 result:^(NSString *object) {
        XCTAssertEqualObjects(@"OK", object, @"Failed");
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error = %@", error);
        }
    }];
}

// 2.3
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // 我们可以把自己需要测试的方法放到block里，block里的代码，会执行10次，取出平均值，
        // Put the code you want to measure the time of here.
        for (NSInteger i = 0; i < 1000; i++) {
            NSLog(@"i = %ld", i);
        }
    }];
}

// #3.1 Standard Email
// #3.2 Standard Unit Tests Rquest
// #3.3 OCMock & NGSignUpViewControllerTests

- (void)testData {
    [self.viewController setLoginStatus:YES];
    BOOL result = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"];
    XCTAssertTrue(result == YES, @"failed");
}

@end
