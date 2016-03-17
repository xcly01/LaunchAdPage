//
//  MainViewController.m
//  CustomAnimation
//
//  Created by liyang on 15/8/13.
//  Copyright (c) 2015年 liyang. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"

#import "ModalAnimation.h"

@interface MainViewController ()

@property (nonatomic, strong) ModalAnimation *modalAnimationController;
@property (nonatomic, strong) FirstViewController *vc;

- (IBAction)onBtnClicked:(UIButton *)sender;

@end

@implementation MainViewController

- (IBAction)onBtnClicked:(id)sender {
    FirstViewController *vc = [FirstViewController new];
    
    vc.transitioningDelegate = self;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self imageViewControllerSmallAnimation];
}

- (void)imageViewControllerBigAnimation
{
    [UIView animateWithDuration:0.5 animations:^{
        self.vc.view.transform = CGAffineTransformMakeScale(2.0, 2.0);
        self.vc.view.alpha = 1.0;
        self.vc.view.center = CGPointMake(100, 132);
    }];
}

- (void)imageViewControllerSmallAnimation
{
    [UIView animateWithDuration:0.5 animations:^{
        CGAffineTransform newTransform = CGAffineTransformMakeScale(1.0, 1.0);
        self.vc.view.transform = newTransform;
        self.vc.view.center = CGPointMake(100, 132);
    }];
}


#pragma mark - UIViewControllerTransitioningDelegate

- (id)animationControllerForPresentedController:(UIViewController *)presented
                           presentingController:(UIViewController *)presenting
                               sourceController:(UIViewController *)source {
    _modalAnimationController.type = AnimationTypePresent;
    return _modalAnimationController;
}

- (id)animationControllerForDismissedController:(UIViewController *)dismissed {
    _modalAnimationController.type = AnimationTypeDismiss;
    return _modalAnimationController;
}

#pragma mark - Navigation Controller Delegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    BaseAnimation *animationController;
    switch (operation) {
        case UINavigationControllerOperationPush:
            animationController.type = AnimationTypePresent;
            return  animationController;
        case UINavigationControllerOperationPop:
            animationController.type = AnimationTypeDismiss;
            return animationController;
        default: return nil;
    }
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _modalAnimationController = [[ModalAnimation alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
