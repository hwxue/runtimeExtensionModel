//
//  user.h
//  组件化
//
//  Created by gaucho on 2018/12/6.
//  Copyright © 2018年 gaucho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface user : NSObject
@property (nonatomic,assign) NSInteger mbrank;
@property (nonatomic,assign) NSInteger mbtype;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *profile_image_url;
@property (nonatomic,assign) BOOL vip;
@end
