//
//  CustomTableViewCell.h
//  CustomGroupedTableViewCell
//
//  Created by Yoshiki Kurihara on 13/03/12.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCellBackgroundView.h"

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, strong) CustomCellBackgroundView *customBackgroundView;
@property (nonatomic, strong) CustomCellBackgroundView *highlightedCustomBackgroundView;

@end
