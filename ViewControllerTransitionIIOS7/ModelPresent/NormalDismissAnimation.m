//
//  NormalDismissAnimation.m
//  ViewControllerTransitionIIOS7
//
//  Created by 王刚 on 14/7/30.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "NormalDismissAnimation.h"

@implementation NormalDismissAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect screenBounds = [[UIScreen mainScreen]bounds];
    CGRect initalFrame = [transitionContext initialFrameForViewController:fromViewController];
    CGRect finalFrame = CGRectOffset(initalFrame, 0, screenBounds.size.height);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toViewController.view];
    [containerView sendSubviewToBack:toViewController.view];
    
    NSTimeInterval interval = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:interval animations:^{
        fromViewController.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    
}


@end
