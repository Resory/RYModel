//
//  ViewController.m
//  RYModel
//
//  Created by billionsfinance-resory on 2017/2/6.
//  Copyright © 2017年 Resory. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "RYUser.h"
#import "NSObject+RYModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    unsigned int count;
    unsigned int method_count;
    
    NSDictionary *aDic = @{@"name":@"resory",
                           @"age":@(29),
                           @"sex":@true,
                           @"grade":@"A"};
    NSDictionary *bDic = @{
                           @"name":@"jack",
                           @"age":@30,
                           @"sex":@false,
                           @"grade":@"d",
                           @"course":
                               @{
                                   @"math":@[@{
                                                @"geometry":@120.42,
                                                @"calculous":@140
                                                },
                                             @{
                                               @"geometry":@200.42,
                                               @"calculous":@300
                                               }]
                                }
                           };
    NSArray *aArr = @[aDic,bDic];
    NSArray *users = [RYUser ry_modelsWithKeyValues:aArr];
    
    for (RYUser *tUser in users) {
        NSLog(@"name = %@, calculous = %@, sex = %d, age = %d",tUser.name,tUser.course,tUser.sex,tUser.age);
    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
