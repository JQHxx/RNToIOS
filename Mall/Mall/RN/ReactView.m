//
//  ReactView.m
//  Mall
//
//  Created by midland on 2019/8/14.
//  Copyright © 2019 JQHxx. All rights reserved.
//

#import "ReactView.h"
#import <RCTRootView.h>
#import <RCTBridge.h>
#import <RCTBundleURLProvider.h>

@implementation ReactView

-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        NSURL * jsCodeLocation;
#if DEBUG
        jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
#else
        jsCodeLocation =  [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif

        // [NSURL URLWithString:strUrl];
        // 这里的moduleName一定要和下面的index.js里面的注册一样
        // 传值、必须是object
        // RN端取值 <Text>{this.props.customValue}</Text>
        // 通过appProperties可以随时的修改传入的值 self.appProperties = @{@"imageNames":"123.png"};
        NSDictionary *dict = @{@"customValue":@"value"};
        RCTRootView * rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation  moduleName:@"RNHighScores"
                                                      initialProperties:dict
                                                          launchOptions:nil];
        
        // rootView.appProperties
        
        [self addSubview:rootView];
        
        rootView.frame = self.bounds;
    }
    return self;
    
}

@end
