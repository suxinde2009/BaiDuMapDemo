//
//  AppDelegate.h
//  MyBaiduMapSDKSampleTest
//
//  Created by Su XinDe on 14-10-10.
//  Copyright (c) 2014年 com.skyprayer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "baidu_map_sdk/inc/BMapKit.h"

@interface AppDelegate : NSObject <UIApplicationDelegate, BMKGeneralDelegate> {
    UIWindow *window;
    UINavigationController *navigationController;
    BMKMapManager* _mapManager;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

