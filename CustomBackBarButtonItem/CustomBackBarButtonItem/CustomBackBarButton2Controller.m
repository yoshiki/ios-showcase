//
//  CustomBackBarButton2Controller.m
//  CustomBackBarButtonItem
//
//  Created by Yoshiki Kurihara on 12/08/24.
//  Copyright (c) 2012年 Yoshiki Kurihara. All rights reserved.
//

#import "CustomBackBarButton2Controller.h"

@interface CustomBackBarButton2Controller ()

@end

@implementation CustomBackBarButton2Controller

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"CustomBackBarButton2";
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_arrow"] style:UIBarButtonItemStyleBordered target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
    self.navigationItem.hidesBackButton = YES;
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

- (void)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
