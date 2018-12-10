//
//  NSObject+xhw_ExtensionModel.m
//  runtimeExtensionModel
//
//  Created by gaucho on 2018/12/7.
//  Copyright © 2018年 gaucho. All rights reserved.
//

#import "NSObject+xhw_ExtensionModel.h"
#import <objc/message.h>
@implementation NSObject (xhw_ExtensionModel)

+ (instancetype)xhw_modelWithDict:(NSDictionary *)dict{
    
    id objc = [[self alloc] init];
    unsigned int count = 0;
    //获取成员便变量的列表(数组)
    Ivar *ivarList = class_copyIvarList(self, &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivarList[i];
        //获取成员变量的名字
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *key = [ivarName substringFromIndex:1];
        //根据key拿到value
        id value = dict[key];
        //获取类的的名字(是什么类型)
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        ivarType =  [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        
        if ([value isKindOfClass:[NSDictionary class]]&& ![ivarType containsString:@"NS"]) {
            //获取该类
            Class modelClass = NSClassFromString(ivarType);
            if (modelClass) {
                // 递归
                value = [modelClass xhw_modelWithDict:value];
            }
        }
        if ([value isKindOfClass:[NSArray class]]) {
            if ([self respondsToSelector:@selector(objectClassInArray)]) {
                NSString *type = [self objectClassInArray][key];
                //拿到该类
                Class modelClass = NSClassFromString(type);
                NSMutableArray *modelArray = [NSMutableArray array];
                for (NSDictionary *dict in value) {
                    
                    id model = [modelClass xhw_modelWithDict:dict];
                    [modelArray addObject:model];
                }
                //处理过后再传回去，是数组还传数组
                value = modelArray;
            }
        }
        if (value) {
            //            [objc setObject:value forKey:key];
            [objc setValue:value forKey:key];
        }
    }
    
    // 释放
    free(ivarList);
    return objc;
}

@end
