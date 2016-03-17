//
//  ModalAnimation.m
//  CustomAnimation
//
//  Created by liyang on 15/8/13.
//  Copyright (c) 2015年 liyang. All rights reserved.
//

#import "ModalAnimation.h"

@implementation ModalAnimation
{
    UIView *_coverView;
    NSArray *_constranints;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    //获取容器视图引用
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromViewController =
    [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toViewController =
    [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
//    CGRect finalFrameVC = [transitionContext finalFrameForViewController:toViewController];
    
    NSLog(@"toViewController:%@,fromViewController:%@",toViewController,fromViewController);
    
    if (self.type == AnimationTypePresent) {

        UIView *modalView = toViewController.view;
        
        if (!_coverView)
        {
            _coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            _coverView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
            _coverView.alpha = 0.0;
        } else {
            _coverView.frame = modalView.frame;
        }
        [containerView addSubview:_coverView];
        [_coverView addSubview:modalView];
        
        modalView.translatesAutoresizingMaskIntoConstraints = NO;
        _coverView.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSDictionary *views = NSDictionaryOfVariableBindings(containerView,_coverView);
        _constranints = [[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_coverView]-0-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]
                         arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_coverView]-0-|"
                                                                                               options:0
                                                                                               metrics:nil
                                                                                                 views:views]];
        [containerView addConstraints:_constranints];
        
        NSDictionary *view1 = NSDictionaryOfVariableBindings(_coverView,modalView);
        _constranints = [[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[modalView]-30-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:view1] 
                         arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[modalView]-30-|" 
                                                                                               options:0
                                                                                               metrics:nil
                                                                                                 views:view1]];
        [_coverView addConstraints:_constranints];
        
        //插入“to”视图，初始缩放值为0.0
        toViewController.view.transform = CGAffineTransformMakeScale(0.0, 0.0);
        //缩放“to”视图为想要的效果

        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0.0
             usingSpringWithDamping:0.9
              initialSpringVelocity:0.1
                            options:0
                         animations:^{
                             _coverView.alpha = 1.0;
                             toViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         }
                         completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
    }
    else if (self.type == AnimationTypeDismiss)
    {
        //插入“to”视图
        //缩小“from”视图，直到其消失
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0.0
             usingSpringWithDamping:0.9
              initialSpringVelocity:0.1 
                            options:0
                         animations:^{
            _coverView.alpha = 0.0;
            fromViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        }
                         completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    
}

- (NSTimeInterval)transitionDuration:(id)transitionContext {
    return 0.4; 
}

@end
