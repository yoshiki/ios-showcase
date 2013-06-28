//
//  SelectableActionSheet.m
//  SelectableActionsheet
//
//  Created by Yoshiki Kurihara on 12/08/24.
//  Copyright (c) 2012年 Yoshiki Kurihara. All rights reserved.
//

#import "SelectableActionSheet.h"

@interface SelectableActionSheet ()

@property (nonatomic) NSUInteger selectedRow;

@end

@implementation SelectableActionSheet

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)];
        toolbar.barStyle = UIBarStyleBlackOpaque;
        [toolbar sizeToFit];
        
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(didPushCancel:)];
        UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(didPushDone:)];
        NSArray *items = [NSArray arrayWithObjects:cancel, spacer, done, nil];
        [toolbar setItems:items animated:YES];
        
        UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, 0.0f, 0.0f)];
        pickerView.delegate = self;
        pickerView.dataSource = self;
        pickerView.showsSelectionIndicator = YES;
        
        [self addSubview:toolbar];
        [self addSubview:pickerView];
    }
    return self;
}

- (void)didPushCancel:(id)sender {
    [self dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)didPushDone:(id)sender {
    if (self.selectableActionSheetDelegate != nil) {
        [self.selectableActionSheetDelegate selectableActionSheet:self selectForRow:self.selectedRow];
    }
    [self dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)showInView:(UIView *)view {
    [super showInView:view];
    [self setBounds:CGRectMake(0.0f, 0.0f, 320.0f, 485.0f)];
}

- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated {
    [super showFromRect:rect inView:view animated:animated];
    [self setBounds:rect];
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectedRow = row;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)picker {
	return 1; // hardcode!
}

- (NSString *)pickerView:(UIPickerView *)picker titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	if (component == 0 && self.selectableActionSheetDelegate != nil) {
		return [self.selectableActionSheetDelegate selectableActionSheet:self titleForRow:row];
	} else {
		return nil;
	}
}

- (NSInteger)pickerView:(UIPickerView *)picker numberOfRowsInComponent:(NSInteger)component {
    if (self.selectableActionSheetDelegate != nil) {
        return [self.selectableActionSheetDelegate selectableActionSheetNumberOfRows:self];
    } else {
        return -1;
    }
}

@end
