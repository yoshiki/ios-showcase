//
//  CustomNavigationBar.m
//  NavigationBarShadow
//
//  Created by Yoshiki Kurihara on 13/03/12.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "CustomNavigationBar.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomNavigationBar

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 1.0f;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    self.layer.shadowRadius = 3.0f; // default
    CGRect shadowPathRect = self.bounds;
    shadowPathRect.origin.x = -5.0f;
    shadowPathRect.size.width += 10.0f;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:shadowPathRect].CGPath;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

@end
