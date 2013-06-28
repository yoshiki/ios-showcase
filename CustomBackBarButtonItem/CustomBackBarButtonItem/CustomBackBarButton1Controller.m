//
//  CustomBackBarButton1Controller.m
//  CustomBackBarButtonItem
//
//  Created by Yoshiki Kurihara on 12/08/22.
//  Copyright (c) 2012年 Yoshiki Kurihara. All rights reserved.
//

#import "CustomBackBarButton1Controller.h"

@interface CustomBackBarButton1Controller ()

@end

@implementation CustomBackBarButton1Controller

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"CustomBackBarButton1";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
