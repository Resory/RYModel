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
    
    NSDictionary *aDic = @{@"name":@"resory",
                           @"age":@(29),
                           @"sex":@(RYMale),
                           @"grade":@"A",
                           @"course":@{
                                   @"math":@[
                                           @{
                                               @"geometry":@200.42,
                                               @"calculous":@300
                                               },
                                           @{
                                               @"geometry":@100.42,
                                               @"calculous":@99
                                               }
                                           ],
                                            @"english":@(99.5)
                                   }};
    NSDictionary *bDic = @{
                               @"name":@"jack",
                               @"age":@30,
                               @"sex":@(RYFemale),
                               @"grade":@"D",
                               @"course":@{
                                            @"math":@[
                                                        @{
                                                            @"geometry":@200.42,
                                                            @"calculous":@300
                                                         },
                                                        @{
                                                            @"geometry":@100.42,
                                                            @"calculous":@99
                                                         }
                                                     ]
                                          }
                               };
    //    NSLog(@"%@",[users ry_modelsToKeyValues]);
    NSArray *aArr = @[aDic,bDic];
    NSArray *users = [RYUser ry_modelsWithKeyValues:aArr];
    for (RYUser *user in users) {
      NSLog(@"%@,%d,%ld",user.aName,user.age,user.sex);
    }
    
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:aDic options:NSJSONWritingPrettyPrinted error:nil];
//    NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    NSLog(@"%@,%d,%d,%f",user.aName,user.age,user.sex,user.course.english);
    
//    RYUser *tUser = [RYUser new];
//    tUser.aName = @"Resory";
//    tUser.age = 10;
//    tUser.sex = YES;
//    
//    RYUser *aUser = [RYUser new];
//    aUser.aName = @"jack";
//    aUser.age = 20;
//    aUser.sex = NO;
//    
//    NSArray *uers = @[tUser,aUser];
//    NSArray *dics = [uers ry_modelsToKeyValues];
//    for (NSDictionary *dic in dics) {
//        NSLog(@"%@",dic);
//    }
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
