//
//  ClipImageView.m
//  CustomGroupedTableViewCell
//
//  Created by Yoshiki Kurihara on 13/03/12.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "ClipImageView.h"

@implementation ClipImageView

- (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage
        verticalGap:(NSInteger)verticalGap
      horizontalGap:(NSInteger)horizontalGap {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.verticalGap = verticalGap;
        self.horizontalGap = horizontalGap;
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f,
                                                                       0.0f,
                                                                       self.horizontalGap + CGRectGetWidth(self.frame) + self.horizontalGap,
                                                                       self.verticalGap + CGRectGetHeight(self.frame) + self.verticalGap)];
        self.imageView.image = image;
        self.imageView.highlightedImage = highlightedImage;
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.imageView.frame;
    frame.size.width = CGRectGetWidth(self.frame) + self.horizontalGap * 2;
    self.imageView.frame = frame;
}

- (void)setHighlighted:(BOOL)highlighted {
    [self.imageView setHighlighted:highlighted];
}

- (void)moveImageViewToTop {
    CGRect frame = self.imageView.frame;
    frame.origin.y = 0;
    self.imageView.frame = frame;
}

- (void)moveImageViewToMiddle {
    CGRect frame = self.imageView.frame;
    frame.origin.y = -(self.verticalGap);
    self.imageView.frame = frame;
}

- (void)moveImageViewToBottom {
    CGRect frame = self.imageView.frame;
    frame.origin.y = -(self.verticalGap * 2);
    self.imageView.frame = frame;
}

- (void)resetHeightTo:(CGFloat)cellHeight verticalGap:(CGFloat)verticalGap {
	CGRect newFrame = self.imageView.frame;
	newFrame.size.height = (cellHeight + verticalGap * 2);
	self.imageView.frame = newFrame;
}

@end
