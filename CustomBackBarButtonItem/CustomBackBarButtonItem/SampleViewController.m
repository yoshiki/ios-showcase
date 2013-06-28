//
//  SampleViewController.m
//  CustomBackBarButtonItem
//
//  Created by Yoshiki Kurihara on 13/06/28.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "SampleViewController.h"
#import "CustomBackBarButton1Controller.h"
#import "CustomBackBarButton2Controller.h"

@interface SampleViewController ()

@end

@implementation SampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"CustomBackBarButtonItem";

    UIButton *sample1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sample1 setTitle:@"CustomBackBarButton1" forState:UIControlStateNormal];
    [sample1 addTarget:self action:@selector(showSample1) forControlEvents:UIControlEventTouchUpInside];
    [sample1 sizeToFit];
    [self.view addSubview:sample1];

    UIButton *sample2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sample2 setTitle:@"CustomBackBarButton2" forState:UIControlStateNormal];
    [sample2 addTarget:self action:@selector(showSample2) forControlEvents:UIControlEventTouchUpInside];
    [sample2 sizeToFit];
    [self.view addSubview:sample2];
    
    sample2.frame = CGRectOffset(sample2.frame, 0.0f, 44.0f);
}

- (void)showSample1 {
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_arrow"]
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:nil
                                                                            action:nil];

    CustomBackBarButton1Controller *c = [[CustomBackBarButton1Controller alloc] init];
    [self.navigationController pushViewController:c animated:YES];
}

- (void)showSample2 {
    CustomBackBarButton2Controller *c = [[CustomBackBarButton2Controller alloc] init];
    [self.navigationController pushViewController:c animated:YES];
}

@end
