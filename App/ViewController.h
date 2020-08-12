//
//  ViewController.h
//  App
//
//  Created by 黄国颂 on 2020/8/10.
//  Copyright © 2020 黄国颂. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ResultBlock)(NSString *object);

@interface ViewController : UIViewController

- (BOOL)isCanClickWithInput:(NSString *)input;

- (void)asyncWithSleep:(int)time result:(ResultBlock)result;

- (void)setLoginStatus:(BOOL)status;

@end

