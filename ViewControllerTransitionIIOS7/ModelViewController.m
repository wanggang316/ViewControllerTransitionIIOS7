//
//  ModelViewController.m
//  ViewControllerTransitionIIOS7
//
//  Created by 王刚 on 14/7/30.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "ModelViewController.h"

@interface ModelViewController ()

@end

@implementation ModelViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(120, 200, 80, 30);
    [btn setTitle:@"dismiss" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    self.view.backgroundColor = [UIColor grayColor];
    
}

- (void)buttonClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(modelViewControllerDidClickedDismissButton:)]) {
        [self.delegate modelViewControllerDidClickedDismissButton:self];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
