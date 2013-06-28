//
//  SelectableActionSheet.h
//  SelectableActionSheet
//
//  Created by Yoshiki Kurihara on 12/08/24.
//  Copyright (c) 2012年 Yoshiki Kurihara. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectableActionSheet;

@protocol SelectableActionSheetDelegate <NSObject>

- (NSString *)selectableActionSheet:(SelectableActionSheet *)selectableActionSheet titleForRow:(NSUInteger)row;
- (NSUInteger)selectableActionSheetNumberOfRows:(SelectableActionSheet *)selectableActionSheet;
- (void)selectableActionSheet:(SelectableActionSheet *)selectableActionSheet selectForRow:(NSUInteger)row;

@end

@interface SelectableActionSheet : UIActionSheet <UIPickerViewDelegate, UIPickerViewDataSource>

@property (unsafe_unretained) id<SelectableActionSheetDelegate> selectableActionSheetDelegate;

@end
