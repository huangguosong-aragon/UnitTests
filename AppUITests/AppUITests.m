//
//  AppUITests.m
//  AppUITests
//
//  Created by 黄国颂 on 2020/8/10.
//  Copyright © 2020 黄国颂. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UI_Tests : XCTestCase

@end

@implementation UI_Tests

// #4.1 基础
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

// #4.2 录制
- (void)testExample {
    // UI tests must launch the application that they test.
    /**
     这里的app获取的元素，都是当前界面的元素。app将界面的元素按类型存储，在集合中的元素，元素之间是平级关系的，按照界面顺序从上往下依次排序（这点很重要，有时很管用）；元素有子集，即如一个大的view包含了多个子控件。
     常见的元素有：staticTexts（label）、textFields（输入框）、buttons（按钮）等等，可以查看该类文件。
     */
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
}

- (void)testRecording {
    
}

// #4.3 性能
- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
        // This measures how long it takes to launch your application.
        [self measureWithMetrics:@[XCTOSSignpostMetric.applicationLaunchMetric] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end
