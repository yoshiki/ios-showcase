//
//  InfinitePagingView.h
//  InfinitePagingView
//
//  Created by Yoshiki Kurihara on 13/03/19.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    InfinitePagingViewDirectionHorizontal,
    InfinitePagingViewDirectionVertical,
} InfinitePagingViewDirection;

@interface InfinitePagingView : UIView <UIScrollViewDelegate>

@property (nonatomic, assign) InfinitePagingViewDirection direction;
@property (nonatomic, assign) NSInteger currentPageIndex;
@property (nonatomic, assign) CGSize pageSize;

- (void)addPage:(UIView *)page;

- (void)scrollToPreviousPageAnimated:(BOOL)animated;
- (void)scrollToNextPageAnimated:(BOOL)animated;
- (void)scrollToFirstPageAnimated:(BOOL)animated;
- (void)scrollToLastPageAnimated:(BOOL)animated;

@end
