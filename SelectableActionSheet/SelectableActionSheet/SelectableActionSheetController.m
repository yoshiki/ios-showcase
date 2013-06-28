//
//  SelectableActionSheetController.m
//  SelectableActionSheet
//
//  Created by Yoshiki Kurihara on 12/08/24.
//  Copyright (c) 2012年 Yoshiki Kurihara. All rights reserved.
//

#import "SelectableActionSheetController.h"

#define kTagButton 1

@interface SelectableActionSheetController ()

@end

@implementation SelectableActionSheetController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"SelectableActionSheet";
    }
    return self;
}

- (void)loadView {
    [super loadView];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.tag = kTagButton;
    [button setTitle:@"Show Action Sheet" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    [self.view addSubview:button];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIButton *button = (UIButton *)[self.view viewWithTag:kTagButton];
    button.center = self.view.center;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)showActionSheet:(id)sender {
    SelectableActionSheet *actionSheet = [[SelectableActionSheet alloc] init];
    actionSheet.selectableActionSheetDelegate = self;
    [actionSheet showInView:self.view];
}

#pragma mark - SelectableActionSheetDelegate

- (NSString *)selectableActionSheet:(SelectableActionSheet *)selectableActionSheet titleForRow:(NSUInteger)row {
    switch (row) {
        case 0:
            return @"row0";
            break;
        case 1:
            return @"row1";
            break;
        case 2:
            return @"row2";
            break;
        default:
            break;
    }
    return nil;
}

- (NSUInteger)selectableActionSheetNumberOfRows:(SelectableActionSheet *)selectableActionSheet {
    return 3;
}

- (void)selectableActionSheet:(SelectableActionSheet *)selectableActionSheet selectForRow:(NSUInteger)row {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                        message:[NSString stringWithFormat:@"You selected row%d", row]
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK",
                              nil];
    [alertView show];
}

@end
