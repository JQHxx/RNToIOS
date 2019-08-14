//
//  NativeToReact.m
//  Mall
//
//  Created by midland on 2019/8/14.
//  Copyright © 2019 JQHxx. All rights reserved.
//

#import "NativeToReact.h"

@implementation NativeToReact
RCT_EXPORT_MODULE()//实现了RCTBridgeModule协议，我们的类需要包含RCT_EXPORT_MODULE()宏
    
- (NSArray<NSString *> *)supportedEvents {
    return @[@"NativeToReactNotiMothed"]; //这里返回的将是你要发送的消息名的数组。可以添加多个
}
    
- (void)startObserving {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(emitEventInternal:)
                                                 name:@"event-emitted"
                                               object:nil];
}
    
- (void)stopObserving {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
    
- (void)emitEventInternal:(NSNotification *)notification {
    [self sendEventWithName:@"NativeToReactNotiMothed"
                       body:notification.object];
}
    
+ (void)postNotiNativeToReact:(NSString *)msg info:(NSString *)info {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"msg"] = msg;
    dic[@"info"] = info;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"event-emitted" object:dic];
}

    
@end

/* ReactNative代码
var NativeToReact = NativeModules.NativeToReact;
const myNativeEvt = new NativeEventEmitter(NativeToReact);  //创建自定义事件接口

componentDidMount(){
    
    if (Platform.OS === 'ios') {
        this.subscription = myNativeEvt.addListener('NativeToReactNotiMothed',(data)=>this._getNotice(data));
    }else{
        
    }
}

_getNotice (body) {//body 看你传什么
    //取出原生传过来的内容
    return Alert.alert(body.msg + body.info);
    
}

componentWillUnmount() {
    if (Platform.OS === 'ios') {
        //删除监听
        this.subscription.remove()
    }else{
        
    }
}
 */
