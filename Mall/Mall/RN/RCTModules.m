//
//  RCTModules.m
//  Mall
//
//  Created by midland on 2019/8/14.
//  Copyright © 2019 JQHxx. All rights reserved.
//

#import "RCTModules.h"
#import "RCTBridge.h"

@implementation RCTModules
RCT_EXPORT_MODULE(RTModule)
    
// RN跳转原生界面 提供：RNOpenOneVC 方法给RN调用
RCT_EXPORT_METHOD(RNOpenOneVC:(NSString *)msg){
    
    NSLog(@"RN传入原生界面的数据为:%@",msg);
    //主要这里必须使用主线程发送,不然有可能失效
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"RNOpenOneVC" object:nil];
    });
}
    
//  对外提供调用方法,演示Callback
RCT_EXPORT_METHOD(RNOpenOneVCCallBack:(NSString *)name callback:(RCTResponseSenderBlock)callback){
    NSLog(@"%@",name);
    NSArray *events=@[@"1", @"2", @"3",@"4"]; //准备回调回去的数据
    callback(@[[NSNull null],events]);
}
    
//Promises
//  对外提供调用方法,演示Promise使用
RCT_REMAP_METHOD(RNOpenOneVCPromises:(NSString *)msg, resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    NSArray *events =@[@"one ",@"two ",@"three"];//准备回调回去的数据
    if (events) {
        resolve(events);
    } else {
        NSError *error=[NSError errorWithDomain:@"我是Promise回调错误信息..." code:101 userInfo:nil];
        reject(@"no_events", @"There were no events", error);
    }
}
    
/**
 RN端使用方式
 import {
 //需要导入NativeModules组件，这个是官方提供给我们与原生交互的组件，通过它我们才能调用到原生的方法
 NativeModules
 } from 'react-native';
 var RNModules  = NativeModules.RTModule;
 */

/**
 第一种：调用方式
 RNModules.RNOpenOneVC('测试')
 */

/**
 第二种：callback
 RNModules.RNOpenOneVC(('测试'), (error, events) => {
     if (error) {
 
     } else {
        alert(events)
     }
 })
 */

/**
 第三种：Promises
 async callBackTwo(){
     try {
        var event = await RNModules.RNOpenOneVCPromises("测试");
        alert(events)
     } catch(e) {
 
     }
 
 }
 */
    

@end
