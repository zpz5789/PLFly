//
//  UIButton+PAITAddition.h
//  PingAnGoodHelper
//
//  Created by 曾鹏展(EX-ZENGPENGZHAN001) on 2021/11/25.
//  Copyright © 2021 平安产险科技中心. All rights reserved.
// UIButton相关拓展：包括额外热区、防止重复点击、图文布局等功能

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/// button内容image和title布局方式
typedef NS_ENUM(NSUInteger, PAITButtonContentLayoutStyle) {
    /// image在上，label在下
    PAITButtonContentLayoutImageTop = 1,
    /// image在左，label在右
    PAITButtonContentLayoutImageLeft,
    /// image在下，label在上
    PAITButtonContentLayoutImageBottom,
    /// image在右，label在左
    PAITButtonContentLayoutImageRight
};

/// UIButton相关拓展
@interface UIButton (PAITAddition)

#pragma mark - 额外热区

/// 设置按钮额外热区，usage：btn.pait_touchAreaInsets = UIEdgeInsetsMake(10, 5, 10, 5)，为上左下右分别添加一个10，5，10，5的热区
@property (nonatomic, assign) UIEdgeInsets pait_touchAreaInsets;


#pragma mark - 重复点击

/// 多长时间内不能重复点击，默认1.0s
@property (nonatomic, assign) CGFloat pait_preventRepeatClickInterval;

/// 是否开启防止重复点击
@property (nonatomic, assign) BOOL pait_needPreventRepeatClick;


#pragma mark - 图文布局

/// 设置图片和文本的布局样式及间距，note:必需先设置图片和文本方法才能生效
/// @param style 布局方式
/// @param space 图片文本间距
- (void)pait_contentLayoutWithStyle:(PAITButtonContentLayoutStyle)style imageTitleSpace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
