//
//  BaseAnimation.m
//  CustomAnimation
//
//  Created by liyang on 15/8/13.
//  Copyright (c) 2015年 liyang. All rights reserved.
//

#import "BaseAnimation.h"

@implementation BaseAnimation


// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}


// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    NSAssert(NO, @"animateTransition: should be handled by subclass of BaseAnimation");
}



@end
