//
//  RYUser.m
//  RYModel
//
//  Created by billionsfinance-resory on 2017/2/6.
//  Copyright © 2017年 Resory. All rights reserved.
//

#import "RYUser.h"
#import "NSObject+RYModel.h"

@implementation RYUser

- (NSDictionary *)ry_modelMapPropertyNames
{
    return @{
                 @"aName":@"name",
             };
}

@end
