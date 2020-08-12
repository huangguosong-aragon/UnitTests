//
//  ViewControllerTests.m
//  AppUITests
//
//  Created by 黄国颂 on 2020/8/11.
//  Copyright © 2020 黄国颂. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ViewControllerTests : XCTestCase

@end

@implementation ViewControllerTests

// #5 UI测试代码
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.textFields[@"InputTextField"] tap];
    
    XCUIElement *uKey = app/*@START_MENU_TOKEN@*/.keys[@"u"]/*[[".keyboards.keys[@\"u\"]",".keys[@\"u\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
    [uKey tap];
    
    XCUIElement *sKey = app/*@START_MENU_TOKEN@*/.keys[@"s"]/*[[".keyboards.keys[@\"s\"]",".keys[@\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
    [sKey tap];
    
    XCUIElement *eKey = app/*@START_MENU_TOKEN@*/.keys[@"e"]/*[[".keyboards.keys[@\"e\"]",".keys[@\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
    [eKey tap];
    
    XCUIElement *rKey = app/*@START_MENU_TOKEN@*/.keys[@"r"]/*[[".keyboards.keys[@\"r\"]",".keys[@\"r\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
    [rKey tap];
    
    XCUIElement *nKey = app/*@START_MENU_TOKEN@*/.keys[@"n"]/*[[".keyboards.keys[@\"n\"]",".keys[@\"n\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
    [nKey tap];
    
    XCUIElement *aKey = app/*@START_MENU_TOKEN@*/.keys[@"a"]/*[[".keyboards.keys[@\"a\"]",".keys[@\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
    [aKey tap];
    
    XCUIElement *mKey = app/*@START_MENU_TOKEN@*/.keys[@"m"]/*[[".keyboards.keys[@\"m\"]",".keys[@\"m\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
    [mKey tap];
    
    [eKey tap];
    
    [app.buttons[@"Click"] tap];
    
//    BOOL result = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"];
//    XCTAssertTrue(result == YES, @"failed");
    
    [app.tables/*@START_MENU_TOKEN@*/.staticTexts[@"row = 1"]/*[[".cells.staticTexts[@\"row = 1\"]",".staticTexts[@\"row = 1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    
    [app.navigationBars[@"Detail"].buttons[@"List"] tap];
    
    [app.navigationBars[@"List"].buttons[@"Home"] tap];
}

// #6.1 Standard UI Tests Rquest
// #6.2 DashboardV2
// #6.3 NotificationCenterTests

@end
