//
//  ModelViewController.h
//  ViewControllerTransitionIIOS7
//
//  Created by 王刚 on 14/7/30.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ModelViewControllerDelegate;
@interface ModelViewController : UIViewController

@property (weak, nonatomic) id<ModelViewControllerDelegate> delegate;

@end


@protocol ModelViewControllerDelegate <NSObject>

- (void)modelViewControllerDidClickedDismissButton:(ModelViewController *)modelViewController;

@end

