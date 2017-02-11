//
//  NSObject+RYModel.h
//  RYModel
//
//  Created by billionsfinance-resory on 2017/2/6.
//  Copyright © 2017年 Resory. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RYModel)

#pragma mark - 公用方法

/**
 模型属性名与字典key不同时，手动对应
 
 @return 对应的字典
 */
- (NSDictionary *)ry_modelMapPropertyNames;

#pragma mark - 字典->模型

/**
 字典->模型

 @param dic 字典
 @return 模型
 */
+ (instancetype)ry_modelWithKeyValue:(NSDictionary *)dic;


/**
 Json字符串->模型

 @param dicString Json字符串
 @return 模型
 */
+ (instancetype)ry_modelWithKeyValueString:(NSString *)dicString;

/**
 字典(数组)->模型(数组)

 @param arr 字典(数组)
 @return 模型(数组)
 */
+ (NSArray *)ry_modelsWithKeyValues:(NSArray<__kindof NSDictionary*> *)arr;

#pragma mark - 模型转字典

/**
 模型->字典

 @return 字典
 */
- (NSDictionary *)ry_modelToKeyValue;

/**
 模型(数组)->字典(数组)

 @return 字典(数组)
 */
- (NSArray *)ry_modelsToKeyValues;

@end
