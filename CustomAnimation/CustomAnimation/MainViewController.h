//
//  MainViewController.h
//  CustomAnimation
//
//  Created by liyang on 15/8/13.
//  Copyright (c) 2015年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define USER_DEFAULTS_CUSTOM_TRANSITIONS @"CustomTransitionsEnabled"
#define USER_DEFAULTS_NAVIGATION_TRANSITION @"NavigationTransition"
#define USER_DEFAULTS_NAVIGATION_TRANSITION_SLIDE @"NavigationSlide"
#define USER_DEFAULTS_NAVIGATION_TRANSITION_FLIP @"NavigationFlip"
#define USER_DEFAULTS_NAVIGATION_TRANSITION_SCALE @"NavigationScale"

@interface MainViewController : UIViewController
<UIViewControllerTransitioningDelegate,
 UINavigationControllerDelegate,
 UITabBarControllerDelegate>


@end
