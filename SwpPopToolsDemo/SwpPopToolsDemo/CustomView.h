//
//  CustomView.h
//  SwpPopToolsDemo
//
//  Created by swp_song on 2017/1/19.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomView;

NS_ASSUME_NONNULL_BEGIN
@interface CustomView : UIView

@property (nonatomic, copy) void(^customViewClickEvent)(CustomView *customView);

@end
NS_ASSUME_NONNULL_END
