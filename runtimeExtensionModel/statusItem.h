//
//  statusItem.h
//  组件化
//
//  Created by gaucho on 2018/12/6.
//  Copyright © 2018年 gaucho. All rights reserved.
//

#import <Foundation/Foundation.h>
@class user;
@class HWpicArrayS;
@interface statusItem : NSObject
@property (nonatomic,assign) NSInteger attitudes_count;
@property (nonatomic,assign) NSInteger comments_count;
@property (nonatomic,copy) NSString *created_at;
@property (nonatomic,copy) NSString *idstr;
@property (nonatomic,strong) HWpicArrayS *picArrayww;
@property (nonatomic,strong) NSArray *picArray;
@property (nonatomic,assign) NSInteger reposts_count;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,strong) user *user;
//@property (nonatomic,copy) NSString *attitudes_count;
@end
