//
//  NSObject+xhw_ExtensionModel.h
//  runtimeExtensionModel
//
//  Created by gaucho on 2018/12/7.
//  Copyright © 2018年 gaucho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (xhw_ExtensionModel)
/**
 字典转模型方法，模型里面有字典也可以
 如果模型里面有 数组（数组里有字典），请在自定义的模型里面实现 objectClassInArray 方法，把改数组以key的形式 传给自定义的另一个模型（该模型是value）
 */
+ (instancetype)xhw_modelWithDict:(NSDictionary *)dict;
+ (NSDictionary *)objectClassInArray;
@end
