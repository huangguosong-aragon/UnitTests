//
//  DataManager.m
//  App
//
//  Created by 黄国颂 on 2020/8/12.
//  Copyright © 2020 黄国颂. All rights reserved.
//

#import "DataManager.h"

static DataManager *manager = nil;

@implementation DataManager

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DataManager alloc] init];
    });
    return manager;
}

@end
