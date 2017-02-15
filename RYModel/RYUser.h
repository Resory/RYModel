//
//  RYUser.h
//  RYModel
//
//  Created by billionsfinance-resory on 2017/2/6.
//  Copyright © 2017年 Resory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RYCourse.h"

typedef enum : NSUInteger {
    RYFemale,
    RYMale,
} RYSex;

@interface RYUser : NSObject

@property (nonatomic, copy) NSString *aName;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) RYSex sex;
@property (nonatomic, strong) RYCourse *course;

@end
