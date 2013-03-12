//
//  CustomCellBackgroundView.h
//  CustomGroupedTableViewCell
//
//  Created by Yoshiki Kurihara on 13/03/12.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    CustomCellBackgroundViewPositionTop,
    CustomCellBackgroundViewPositionMiddle,
    CustomCellBackgroundViewPositionBottom,
    CustomCellBackgroundViewPositionSingle
} CustomCellBackgroundViewPosition;

@interface CustomCellBackgroundView : UIView

@property (nonatomic, assign) CustomCellBackgroundViewPosition position;

- (void)setHighlighted:(BOOL)highlighted;

@end
