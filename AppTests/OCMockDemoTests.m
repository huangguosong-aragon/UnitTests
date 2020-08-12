//
//  OCMockDemoTests.m
//  AppTests
//
//  Created by 黄国颂 on 2020/8/12.
//  Copyright © 2020 黄国颂. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import <OCMock/OCMock.h>
#import "DataManager.h"

@interface ViewController (OCMockDemoTests)

// 需要测试的工程类的私有变量和方法可以通过在测试工程类中添加工程类的分类方法和属性变量来实现
- (void)pushNextWithColor:(UIColor *)color;
- (void)searchByMsg:(NSString *)msg;
- (void)requestSearchByMsg:(NSString *)msg;

@end

@interface OCMockDemoTests : XCTestCase

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation OCMockDemoTests

// http://blog.oneinbest.com/2017/07/27/iOS%E6%B5%8B%E8%AF%95%E7%B3%BB%E5%88%97-%E4%B8%89-OCMock%E7%9A%84%E4%BD%BF%E7%94%A8/
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

}

// 3.3.1 模拟对象
- (void)testMethodMock {
    // Mock: 创建一个模拟对象，我们可以验证，修改它的行为
    id viewControllerMock = [OCMockObject mockForClass:[ViewController class]];
    [viewControllerMock stopMocking];

    // 不会在一个没有stub掉的方法被调用的时候抛出异常。
    // id niceMock = [OCMockObject niceMockForClass:[ViewController class]];
    
    // ViewController *viewController = [ViewController new];
    // 没有stub掉的方法被调用了，这个方法会被转发到真实的对象上。
    // id partialMock = [OCMockObject partialMockForObject:viewController];
    
    /*
    协议模拟：协议模拟是创建一个实例，让其具有协议的所定义的功能：
    id protocolMock = OCMProtocolMock(@protocol(SomeProtocol));
    
    观察者模拟：顾名思义，创建一个接收通知的实例：
    id observerMock = OCMObserverMock();
    
    严格模拟：主要是相对类实例模拟和协议模拟来说，他们相对一般的模拟，不同点是严格模拟调用没有stub的方法会直接crash，而不是返回nil：
    id classMock = OCMStrictClassMock([SomeClass class]);
     */
}

// 3.3.2 Stub方法 让某个方法返回指定对象或非对象值
- (void)testStub {
    // Mock: 创建一个模拟对象，我们可以验证，修改它的行为
    id viewControllerMock = [OCMockObject mockForClass:[ViewController class]];
    // Stub: Mock对象的函数返回特定的值
    [[[viewControllerMock stub] andReturnValue:OCMOCK_VALUE(YES)] isCanClickWithInput:[OCMArg any]];
    // OCMStub([viewControllerMock isCanClickWithInput:[OCMArg any]]).andReturn(OCMOCK_VALUE(YES));
    BOOL result = [viewControllerMock isCanClickWithInput:@"123"];
    XCTAssertTrue(result, @"failed");
    
    
    // 让某个方法交由代理对象实现
    // OCMStub([mock someMethod]).andCall(anotherObject, @selector(aDifferentMethod));
    
    // 委托block实现某个方法
    // OCMStub([mock someMethod]).andDo(^(NSInvocation *invocation)
    OCMStub([viewControllerMock asyncWithSleep:0 result:[OCMArg any]]).andDo(^(NSInvocation *invocation){
        void(^resultBlock)(NSString *object);
        //第0个和第1个参数是self,SEL,第2个是model,第3才是block
        [invocation getArgument:&resultBlock atIndex:3];
        resultBlock(@"BlockStub");
    });
    
    [viewControllerMock asyncWithSleep:0 result:^(NSString *object) {
        XCTAssertEqualObjects(object, @"BlockStub", @"failed");
    }];
}

// 3.3.3 模拟异常、通知; 转发与省略
/**
 模拟一个方法一旦调用就抛出异常
 OCMStub([mock someMethod]).andThrow(anException);

 模拟一个方法一旦调用就发送一个通知
 OCMStub([mock someMethod]).andPost(aNotification);

 关于stub的操作还可以串联起来，如指定发送通知与指定返回值
 OCMStub([mock someMethod]).andPost(aNotification).andReturn(aValue);
 
 可以让stub方法实际调用转发到原来的对象实例／类实例：
 OCMStub([mock someMethod]).andForwardToRealObject();

 也可以不做任何事情，相当于调用没有效果：
 OCMStub([mock someMethod]).andDo(nil);
 */

// 3.3.4 交互验证 交互验证主要是验证方法是否调用
- (void)testFunction {
    // 创建一个observerMock
    id observerMock = OCMObserverMock();
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    // 监听notification
    [center addMockObserver:observerMock name:@"notification" object:nil];
    // 预测将要接受notification
    [[observerMock expect] notificationWithName:@"notification" object:[OCMArg any]];
    // 某个地方发送了消息
    [center postNotificationName:@"notification" object:nil];
    // 预测完成且成功
    [observerMock verify];
    
    // OCMExpect([observerMock notificationWithName:@"notification" object:[OCMArg any]]);
    // OCMVerifyAll(observerMock);
}

// reject 表示不执行某个方法
- (void)testSearchWithoutMsg {
    ViewController *vc = [ViewController new];
    id mockVC = OCMPartialMock(vc);
    // 调用测试方法,因为搜索的内容为nil，所以没有调用- (void)requestSearchByMsg:方法
    [mockVC searchByMsg:nil];
    [[mockVC reject] requestSearchByMsg:[OCMArg any]];
    [mockVC verify];
    
//    OCMReject([mockVC requestSearchByMsg:[OCMArg any]]);
}

// 3.3.5参数约束
/**
 在上面的stub实例中，OCMock同样支持参数的约束，也就是只约束传入指定参数的调用

 无限制约束：
     OCMStub([mock someMethodWithAnArgument:[OCMArg any]])
     OCMStub([mock someMethodWithPointerArgument:[OCMArg anyPointer]])
     OCMStub([mock someMethodWithSelectorArgument:[OCMArg anySelector]])
 更多类型的无限制约束可以参考OCMArg.h，无限制约束，不管传入任何参数，stub都起作用

 忽略非对象约束：
     [[[mock stub] ignoringNonObjectArgs] someMethodWithIntArgument:0]
 这种约束表示不管参数中的非对象参数传什么值都能通过，但是对象参数照样可以作限制

 匹配限制：OCMArg.h中提供了多个匹配方法，用于限制参数，如下：
     OCMStub([mock someMethod:aValue)
     OCMStub([mock someMethod:[OCMArg isNil]])
     OCMStub([mock someMethod:[OCMArg isNotNil]])
     OCMStub([mock someMethod:[OCMArg isNotEqual:aValue]])
     OCMStub([mock someMethod:[OCMArg isKindOfClass:[SomeClass class]]])
     OCMStub([mock someMethod:[OCMArg checkWithSelector:aSelector onObject:anObject]])
     OCMStub([mock someMethod:[OCMArg checkWithBlock:^BOOL(id value) { return YES if value is ok }]])
     需要注意的是最后一个block判断，调用时参数传给block，我们返回YES或者NO作为判断结果
 */

// 3.3.6 模拟类方法 && 单例模拟
- (void)testManager {
    /*
    模拟类方法和上面提到的stub没有多大区别：
    不过这里只能stub类方法，不能stub实例方法，如果mock没有释放，那么stub的类方法会一直保留； 如果想停止类模拟，需要调用[classMock stopMocking]，这个方法在mock对象释放时会自动调用
    至于交互验证，上面也提到过，如：OCMVerify([classMock aClassMethod]) 如果有实例方法和类方法同名，那类方法stub时必须通过ClassMethod()指出：
    OCMStub(ClassMethod([classMock ambiguousMethod])).andReturn(@"Test string");
     */
    id managerMock = OCMClassMock([DataManager class]);
    OCMStub([managerMock shared]).andReturn(managerMock);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
