//
//  NSObject+RYModel.m
//  RYModel
//
//  Created by billionsfinance-resory on 2017/2/6.
//  Copyright © 2017年 Resory. All rights reserved.
//

#import "NSObject+RYModel.h"
#import <objc/runtime.h>

@implementation NSObject (RYModel)

#pragma mark - 公用方法

// Model是否存在key
- (bool)ry_isExistKey:(NSString *)key
{
    const char *aKey;
    unsigned int count;
    
    aKey = [key UTF8String];
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (int i = 0 ; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        if(propertyName == aKey){
            return YES;
        }
    }
    free(propertyList);
    return NO;
}

// key是否是系统的类
- (BOOL)ry_isSystemClass:(NSString *)key
{
    Class aClass = [self ry_getAttributeClass:key];
    
    if(aClass){
        // 判断key的类型是否是系统类
        NSBundle *aBundle = [NSBundle bundleForClass:aClass];
        if(aBundle == [NSBundle mainBundle]){
            // 自定义的类
            return NO;
        }else{
            // 系统类
            return YES;
        }
    }else{
        // 基本类型
        return YES;
    }
}

/**
 
 获取Model属性的类名
 
 eg: T@"RYCourse",&,N,V_course 获取字符串中的'RYCourse'
 
 @param key Model属性对应的
 @return Model属性的类名
 */
- (Class)ry_getAttributeClass:(NSString *)key
{
    Class aClass;
    unsigned int count;
    NSRange objRange;
    NSRange dotRange;
    NSString *aClassStr;
    NSMutableString *aAttribute;
    const char *att = nil;
    
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (int i = 0 ; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        if([key UTF8String] == propertyName){
            att = property_getAttributes(propertyList[i]);
        }
    }
    free(propertyList);
    
    aAttribute  = [[NSMutableString alloc] initWithUTF8String:att];
    objRange = [aAttribute rangeOfString:@"@"];
    if(objRange.location != NSNotFound){
        // key是对象，不是基本类型
        dotRange = [aAttribute rangeOfString:@","];
        aClassStr = [aAttribute substringWithRange:NSMakeRange(3, dotRange.location-1-3)];
        aClass = NSClassFromString(aClassStr);
    }else{
        return nil;
    }
    
    return aClass;
}

#pragma mark - 字典->模型
+ (instancetype)ry_modelWithKeyValue:(NSDictionary *)dic
{
    return [[self alloc] ry_initWithKeyValue:dic];;
}

- (instancetype)ry_initWithKeyValue:(NSDictionary *)dic
{
    NSAssert([dic isKindOfClass:[NSDictionary class]], @"此数据为非字典，无法解析");
    
    for (NSString *key in [dic allKeys]) {
        if([self ry_isExistKey:key]){
            // 存在key
            [self ry_setKey:key withValue:dic[key]];
        }else{
            // 不存在key
            NSLog(@"不存在该‘%@’字段",key);
        }
    }
    return self;
}

- (void)ry_setKey:(NSString *)key withValue:(id)value
{
    if([self ry_isSystemClass:key]){
        // 系统类
        [self setValue:value forKey:key];
    }else{
        // 自定义类（model嵌套model）
        Class aClass = [self ry_getAttributeClass:key];
        id aValue = nil;
        if([value isKindOfClass:[NSArray class]]){
            // 嵌套的model数据是数组
            aValue = [aClass ry_modelsWithKeyValues:value];
        }else{
            // 嵌套的model数据是字典
            aValue = [aClass ry_modelWithKeyValue:value];
        }
        [self setValue:aValue forKey:key];
    }
}

#pragma mark - 字典(数组)->模型(数组)

+ (NSArray *)ry_modelsWithKeyValues:(NSArray<__kindof NSDictionary*> *)arr
{
    return [[self alloc] ry_initWithKeyValues:arr];
}   

- (NSArray *)ry_initWithKeyValues:(NSArray<__kindof NSDictionary*> *)arr
{
    NSMutableArray *aArr = [NSMutableArray new];
    for (NSDictionary *dic in arr) {
        if([dic isKindOfClass:[NSDictionary class]]){
            Class tClass = [self class];
            typeof(self) tSelf = [tClass ry_modelWithKeyValue:dic];
            [aArr addObject:tSelf];
        }else{
            NSLog(@"warning->数组中的'%@'不是字典，可能导致数据转换不完整",dic);
            break;
        }
    }
    return aArr;
}

#pragma mark - 模型->字典
@end
