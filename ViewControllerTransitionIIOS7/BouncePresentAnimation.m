//
//  BouncePresentAnimation.m
//  ViewControllerTransitionIIOS7
//
//  Created by 王刚 on 14/7/30.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "BouncePresentAnimation.h"

@implementation BouncePresentAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return .8f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    // 1. 我们首先需要得到参与切换的两个ViewController的信息，使用context的方法拿到它们的参照
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    // 2. 对于要呈现的VC，我们希望它从屏幕下方出现，因此将初始位置设置到屏幕下边缘
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
    
    
    // 3. 将view添加到containerView中
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toViewController.view];
    
    
    // 4. 开始动画。这里的动画时间长度和切换时间长度一致，都为0.8s。usingSpringWithDamping的UIView动画API是iOS7新加入的，描述了一个模拟弹簧动作的动画曲线，我们在这里只做使用，更多信息可以参看相关文档；（顺便多说一句，iOS7中对UIView动画添加了一个很方便的Category，UIViewKeyframeAnimations。使用其中方法可以为UIView动画添加关键帧动画）
    NSTimeInterval interval = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:interval
                          delay:.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
        toViewController.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        //在动画结束后我们必须向context报告VC切换完成，是否成功（在这里的动画切换中，没有失败的可能性，因此直接pass一个YES过去）。系统在接收到这个消息后，将对VC状态进行维护
        [transitionContext completeTransition:YES];
    }];
    
    
}

@end
