//
//  ClipImageView.h
//  CustomGroupedTableViewCell
//
//  Created by Yoshiki Kurihara on 13/03/12.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClipImageView : UIView

@property (nonatomic, assign) NSInteger verticalGap;
@property (nonatomic, assign) NSInteger horizontalGap;
@property (nonatomic, strong) UIImageView *imageView;

- (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage
        verticalGap:(NSInteger)verticalGap
      horizontalGap:(NSInteger)horizontalGap;

- (void)moveImageViewToTop;
- (void)moveImageViewToMiddle;
- (void)moveImageViewToBottom;
- (void)resetHeightTo:(CGFloat)cellHeight verticalGap:(CGFloat)verticalGap;
- (void)setHighlighted:(BOOL)highlighted;

@end
