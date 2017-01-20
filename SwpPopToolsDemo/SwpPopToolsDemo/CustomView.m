//
//  CustomView.m
//  SwpPopToolsDemo
//
//  Created by swp_song on 2017/1/19.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()

@property (nonatomic, strong) UIButton    *button;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CustomView


/**!
 *  @ author swp_song
 *
 *  @ brief  initWithFrame: ( Override  initWithFrame )
 *
 *  @ param  frame
 *
 *  @ return CustomView
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.imageView];
        [self addSubview:self.button];
    }
    return self;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  hitTest:withEvent: ( Override  hitTest:withEvent: )
 *
 *  @ param  point
 *
 *  @ param  event
 *
 *  @ return UIView
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    __block UIView *view = [super hitTest:point withEvent:event];
    
    if (view == nil) {
        
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull subView, NSUInteger idx, BOOL * _Nonnull stop) {
            CGPoint tp = [subView convertPoint:point fromView:self];
            if (CGRectContainsPoint(subView.bounds, tp)) {
                view = subView;
                * stop = YES;
            }
        }];
    }
    return view;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = self.bounds;
    _imageView.image = [UIImage imageNamed:@"type_image"];
    _button.frame    = CGRectMake(self.bounds.size.width - 15, -15, 30, 30);
}

- (void)clickEvent:(UIButton *)button {
    if (self.customViewClickEvent) self.customViewClickEvent(self);
}



- (UIButton *)button {
    
    return !_button ? _button = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchUpInside];
        button;
    }) : _button;
}


- (UIImageView *)imageView {
    
    return !_imageView ? _imageView = ({
        UIImageView *imageView = [UIImageView new];
        imageView;
    }) : _imageView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
