//
//  InfinitePagingView.m
//  InfinitePagingView
//
//  Created by Yoshiki Kurihara on 13/03/19.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "InfinitePagingView.h"

@interface InfinitePagingView ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *pages;

@end

@implementation InfinitePagingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView.scrollsToTop = NO;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];

        _pageSize = self.frame.size;
        _pages = [NSMutableArray array];
    }
    return self;
}

- (void)addPage:(UIView *)page {
    [_pages addObject:page];
    [self layoutPages];
}

- (void)layoutPages {
    _scrollView.contentSize = [self contentSize];
    for (UIView *page in _pages) {
        if ([page isDescendantOfView:_scrollView]) {
            [_scrollView addSubview:page];
        }
        CGRect frame = page.frame;
        if (_direction == InfinitePagingViewDirectionHorizontal) {
            
        }
    }
}

- (CGSize)contentSize {
    CGSize contentSize = CGSizeZero;

    if (_direction == InfinitePagingViewDirectionHorizontal) {
        contentSize.height = CGRectGetHeight(self.frame);
    } else if (_direction == InfinitePagingViewDirectionVertical) {
        contentSize.width = CGRectGetWidth(self.frame);
    }
    
    for (UIView *page in _pages) {
        if (_direction == InfinitePagingViewDirectionHorizontal) {
            contentSize.width += CGRectGetWidth(page.frame);
        } else if (_direction == InfinitePagingViewDirectionVertical) {
            contentSize.height += CGRectGetHeight(page.frame);
        }
    }
    
    return contentSize;
}

@end
