//
//  BaseAnimation.h
//  CustomAnimation
//
//  Created by liyang on 15/8/13.
//  Copyright (c) 2015年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    AnimationTypePresent,
    AnimationTypeDismiss,
} AnimationType;

@interface BaseAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) AnimationType type;

@end
