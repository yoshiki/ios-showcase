//
//  CustomCellBackgroundView.m
//  CustomGroupedTableViewCell
//
//  Created by Yoshiki Kurihara on 13/03/12.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "CustomCellBackgroundView.h"
#import "ClipImageView.h"

@interface CustomCellBackgroundView ()

@property (nonatomic, strong) ClipImageView *clipImageView;
@property (nonatomic, strong) UIView *separatorLineView;

@end

@implementation CustomCellBackgroundView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth(frame), CGRectGetHeight(frame))];
    if (self) {
        UIImage *image = [[UIImage imageNamed:@"bg"] stretchableImageWithLeftCapWidth:9.0f topCapHeight:9.0f];
        UIImage *highlightedImage = [[UIImage imageNamed:@"bg_press"] stretchableImageWithLeftCapWidth:9.0f topCapHeight:9.0f];
        self.clipImageView = [[ClipImageView alloc] initWithFrame:self.frame
                                                            image:image
                                                 highlightedImage:highlightedImage
                                                      verticalGap:8.0f
                                                    horizontalGap:0.0f];
        [self addSubview:self.clipImageView];
        
        self.separatorLineView = [[self class] viewWithImage:[UIImage imageNamed:@"line"] height:2.0f];
        [self addSubview:self.separatorLineView];
        [self.separatorLineView setFrame:CGRectMake(1.0f, 44.0f, CGRectGetWidth(self.frame) - 2.0f, 2.0f)];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.clipImageView.frame = self.frame;
}

- (void)setSeparatorLinePosition:(CGFloat)cellHeight {
	if (self.separatorLineView)	{
		[self.separatorLineView setHidden:NO];
        
        CGRect frame = self.separatorLineView.frame;
        frame.origin.y = cellHeight - 1;
        self.separatorLineView.frame = frame;
	}
}

- (void)setPosition:(CustomCellBackgroundViewPosition)position {
    _position = position;
    
    CGFloat verticalGap = self.clipImageView.verticalGap;
    BOOL separatorHidden = NO;
    
    switch (_position) {
        case CustomCellBackgroundViewPositionTop:
            [self.clipImageView moveImageViewToTop];
            break;
        case CustomCellBackgroundViewPositionMiddle:
            [self.clipImageView moveImageViewToMiddle];
            break;
        case CustomCellBackgroundViewPositionBottom:
            separatorHidden = YES;
            [self.clipImageView moveImageViewToBottom];
            break;
        case CustomCellBackgroundViewPositionSingle:
            verticalGap = 0;
            separatorHidden = YES;
            [self.clipImageView moveImageViewToTop];
            break;
        default:
            break;
    }
    
    if (separatorHidden) {
        [self.separatorLineView setHidden:separatorHidden];
    } else {
        [self setSeparatorLinePosition:44.0f];
    }
    
    [self.clipImageView resetHeightTo:44.0f verticalGap:verticalGap];
}

- (void)setHighlighted:(BOOL)highlighted {
    [self.clipImageView setHighlighted:highlighted];
}

+ (UIView *)viewWithImage:(UIImage *)image height:(CGFloat)height {
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), height)];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    view.image = image;
    return view;
}

@end
