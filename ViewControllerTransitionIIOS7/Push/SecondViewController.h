//
//  SecondViewController.h
//  ViewControllerTransitionIIOS7
//
//  Created by 王刚 on 14/7/31.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondViewController;
@interface SecondViewController : UIViewController

@property (nonatomic, weak) id<SecondViewController> delegate;

@end

@protocol SecondViewController <NSObject>

- (void)secondViewControllerDidClickedPopButton:(SecondViewController *)controller;

@end