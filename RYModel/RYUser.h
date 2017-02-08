//
//  RYUser.h
//  RYModel
//
//  Created by billionsfinance-resory on 2017/2/6.
//  Copyright © 2017年 Resory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RYCourse.h"

@interface RYUser : NSObject

@property (nonatomic, weak) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) BOOL sex;
@property (nonatomic, strong) RYCourse *course;

@end
