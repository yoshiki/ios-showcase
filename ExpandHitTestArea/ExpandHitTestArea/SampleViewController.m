//
//  SampleViewController.m
//  ExpandHitTestArea
//
//  Created by Yoshiki Kurihara on 13/03/12.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "SampleViewController.h"
#import "UIButton+HitTestArea.h"

@implementation SampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *normalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [normalButton addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    [normalButton setTitle:@"Normal Button" forState:UIControlStateNormal];
    [normalButton sizeToFit];
    [self.view addSubview:normalButton];
    
    CGRect frame = normalButton.frame;
    frame.origin = CGPointMake(10.0f, 10.0f);
    normalButton.frame = frame;
    
    UIButton *expandedButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [expandedButton setHitTestEdgeInsets:UIEdgeInsetsMake(-10.0f, -10.0f, -10.0f, -10.0f)];
    [expandedButton addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    [expandedButton setTitle:@"Expanded Button" forState:UIControlStateNormal];
    [expandedButton sizeToFit];
    [self.view addSubview:expandedButton];
    
    frame = expandedButton.frame;
    frame.origin = CGPointMake(10.0f, CGRectGetMaxY(normalButton.frame) + 20.0f);
    expandedButton.frame = frame;
}

- (void)tapped:(id)sender {
    UIButton *b = (UIButton *)sender;
    NSLog(@"%@ tapped", b.titleLabel.text);
}

@end
