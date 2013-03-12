//
//  CustomNavigationBar.m
//  CustomNavigationBar
//
//  Created by Yoshiki Kurihara on 13/03/12.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "CustomNavigationBar.h"

@implementation CustomNavigationBar

- (void)drawRect:(CGRect)rect {
    UIImage *backgroundImage = [UIImage imageNamed:@"nav_bg"];
    [backgroundImage drawInRect:rect];
}

@end
