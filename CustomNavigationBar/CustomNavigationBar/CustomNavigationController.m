//
//  CustomNavigationController.m
//  CustomNavigationBar
//
//  Created by Yoshiki Kurihara on 13/03/12.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "CustomNavigationController.h"
#import "CustomNavigationBar.h"

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomNavigationBar *navBar = [[CustomNavigationBar alloc] initWithFrame:self.view.bounds];
    [self setValue:navBar forKey:@"navigationBar"];
}

@end
