//
//  ViewController.m
//  App
//
//  Created by 黄国颂 on 2020/8/10.
//  Copyright © 2020 黄国颂. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLogin"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)clickAction:(UIButton *)sender {
    if ([self isCanClickWithInput:self.textField.text]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLogin"];
        [self performSegueWithIdentifier:@"PushToList" sender:nil];
    }
}

- (BOOL)isCanClickWithInput:(NSString *)input {
    return [@"username" isEqualToString:input];
}

- (void)asyncWithSleep:(int)time result:(ResultBlock)result {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(time);
        dispatch_async(dispatch_get_main_queue(), ^{
            result(@"OK");
        });
    });
}

- (void)setLoginStatus:(BOOL)status {
    [[NSUserDefaults standardUserDefaults] setBool:status forKey:@"isLogin"];
}

- (void)searchByMsg:(NSString *)msg {
    if (!msg.length) {
      return;
    }
    [self requestSearchByMsg:msg];
 }

- (void)requestSearchByMsg:(NSString *)msg {
    
}

@end
