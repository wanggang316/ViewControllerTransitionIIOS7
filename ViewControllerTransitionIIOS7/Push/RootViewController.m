//
//  RootViewController.m
//  ViewControllerTransitionIIOS7
//
//  Created by 王刚 on 14/7/31.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"
#import "PushAnimation.h"
#import "SwipeLeftInteractiveTransition.h"

@interface RootViewController () <UINavigationControllerDelegate>

@property (nonatomic, strong) PushAnimation *animation;
@property (nonatomic, strong) SwipeLeftInteractiveTransition *transitionController;
@end

@implementation RootViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _animation = [PushAnimation new];
        _transitionController = [SwipeLeftInteractiveTransition new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    pushBtn.frame = CGRectMake(120, 200, 80, 30);
    [pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pushBtn];
    
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}

- (void)buttonClicked:(id)sender {
    
    SecondViewController *presentController = [[SecondViewController alloc]init];
    [_transitionController wireToNavigationController:self.navigationController viewController:presentController];

    [self.navigationController pushViewController:presentController animated:YES];
}




- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    return self.transitionController.interacting ? self.transitionController : nil;
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return self.animation;
    }
    return nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


@end
