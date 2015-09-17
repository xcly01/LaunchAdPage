//
//  LaunchAdManager.h
//  NewEBPP
//
//  Created by liyang on 15/9/7.
//  Copyright (c) 2015年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LaunchAdManager : NSObject

+ (LaunchAdManager *)shareManager;

/**
 *
 *  @param interval 广告页停留的时间
 *  @param url      广告页加载的url
 */
- (void)showAdWithTimeInterval:(NSTimeInterval)interval imageUrl:(NSString *)url;

@end
