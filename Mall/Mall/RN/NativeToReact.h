//
//  NativeToReact.h
//  Mall
//
//  Created by midland on 2019/8/14.
//  Copyright © 2019 JQHxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RCTEventEmitter.h>

/**
 * 通过通知方式给RN传值
 */

@interface NativeToReact : RCTEventEmitter<RCTBridgeModule>
    
+ (void)postNotiNativeToReact:(NSString *)msg info:(NSString *)info;

@end

