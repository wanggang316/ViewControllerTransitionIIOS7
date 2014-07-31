//
//  SwipeLeftInteractiveTransition.h
//  ViewControllerTransitionIIOS7
//
//  Created by 王刚 on 14/7/31.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface SwipeLeftInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL interacting;

- (void)wireToNavigationController:(UINavigationController *)navigation viewController:(UIViewController *)viewController;

@end
