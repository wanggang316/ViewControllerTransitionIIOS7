//
//  SwipeLeftInteractiveTransition.m
//  ViewControllerTransitionIIOS7
//
//  Created by 王刚 on 14/7/31.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "SwipeLeftInteractiveTransition.h"

@interface SwipeLeftInteractiveTransition()

@property (nonatomic, assign) BOOL shouldComplete;

@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) UIViewController *presentViewController;

@end


@implementation SwipeLeftInteractiveTransition

- (void)wireToNavigationController:(UINavigationController *)navigation viewController:(UIViewController *)viewController {
    self.navigationController = navigation;
    self.presentViewController = viewController;
    [self prepareGestureRecognizerInView:navigation.view];
}

- (void)prepareGestureRecognizerInView:(UIView *)view {
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gestureRecognizer];
}

- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    
    UIView* view = self.navigationController.view;
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan: {
            self.interacting = YES;
            CGPoint location = [gestureRecognizer locationInView:view];
            if (location.x > CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count == 1){
                [self.navigationController pushViewController:self.presentViewController animated:YES];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            CGPoint translation = [gestureRecognizer translationInView:view];
            // fabs() 求浮点数的绝对值
            CGFloat d = fabs(translation.x / CGRectGetWidth(view.bounds));
            [self updateInteractiveTransition:d];
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            self.interacting = NO;
            
            if ([gestureRecognizer velocityInView:view].x < 0) {
                [self finishInteractiveTransition];
            } else {
                [self cancelInteractiveTransition];
            }
            break;
        }
            
        default:
            break;
    }
}


@end
