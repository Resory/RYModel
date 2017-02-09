//
//  RYCourse.h
//  RYModel
//
//  Created by billionsfinance-resory on 2017/2/8.
//  Copyright © 2017年 Resory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RYMath.h"
@interface RYCourse : NSObject

@property (nonatomic, strong)  NSArray<RYMath*> *math;
@property (nonatomic, assign) CGFloat english;

@end
