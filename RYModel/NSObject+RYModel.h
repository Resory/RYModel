//
//  NSObject+RYModel.h
//  RYModel
//
//  Created by billionsfinance-resory on 2017/2/6.
//  Copyright © 2017年 Resory. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RYModel)


/**
 字典->模型

 @param dic 字典
 @return 模型
 */
+ (instancetype)ry_modelWithKeyValue:(NSDictionary *)dic;

/**
 字典(数组)->模型(数组)

 @param arr 字典(数组)
 @return 模型(数组)
 */
+ (NSArray *)ry_modelsWithKeyValues:(NSArray<__kindof NSDictionary*> *)arr;



/**
 模型属性名与字典key不同时，手动对应
 
 @return 对应的字典
 */
- (NSDictionary *)ry_mapModelPropertyNames;



@end
