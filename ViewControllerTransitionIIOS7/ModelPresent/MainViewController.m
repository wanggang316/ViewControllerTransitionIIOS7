//
//  MainViewController.m
//  ViewControllerTransitionIIOS7
//
//  Created by 王刚 on 14/7/30.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "MainViewController.h"
#import "ModelViewController.h"
#import "BouncePresentAnimation.h"
#import "NormalDismissAnimation.h"
#import "SwipeUpInteractiveTransition.h"

@interface MainViewController () <ModelViewControllerDelegate, UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) BouncePresentAnimation *presentAnimation;
@property (strong, nonatomic) NormalDismissAnimation *dismissionAnimation;
@property (strong, nonatomic) SwipeUpInteractiveTransition *transitionController;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _presentAnimation = [BouncePresentAnimation new];
        _dismissionAnimation = [NormalDismissAnimation new];
        _transitionController = [SwipeUpInteractiveTransition new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(120, 200, 80, 30);
    [btn setTitle:@"Present" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}


- (void)buttonClicked:(id)sender {
    ModelViewController *viewController = [ModelViewController new];
    viewController.delegate = self;
    viewController.transitioningDelegate = self;
    
    [self.transitionController wireToViewController:viewController];
    
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)modelViewControllerDidClickedDismissButton:(ModelViewController *)modelViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.presentAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.dismissionAnimation;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.transitionController.interacting ? self.transitionController : nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
