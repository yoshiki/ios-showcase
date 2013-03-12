//
//  CustomTableViewCell.m
//  CustomGroupedTableViewCell
//
//  Created by Yoshiki Kurihara on 13/03/12.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.textLabel.textColor = [UIColor whiteColor];
        
        self.customBackgroundView = [[CustomCellBackgroundView alloc] initWithFrame:self.frame];
        [self.contentView insertSubview:self.customBackgroundView atIndex:0];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    [self.customBackgroundView setHighlighted:highlighted];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.customBackgroundView.frame;
    frame.size.width = CGRectGetWidth(self.backgroundView.frame);
    self.customBackgroundView.frame = frame;
}

@end
