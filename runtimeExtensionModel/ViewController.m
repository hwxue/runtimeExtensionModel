//
//  ViewController.m
//  runtimeExtensionModel
//
//  Created by gaucho on 2018/12/7.
//  Copyright © 2018年 gaucho. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+xhw_ExtensionModel.h"
#import "statusItem.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
   NSString *pathfile = [[NSBundle mainBundle]pathForResource:@"status.plist" ofType:nil];
   NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:pathfile];
    
   statusItem *item = [statusItem xhw_modelWithDict:dict];
    
    NSLog(@"%@",item.user);
    NSLog(@"===%@",item.picArray);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}


@end
