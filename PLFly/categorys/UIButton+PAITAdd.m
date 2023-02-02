//
//  UIButton+PAITAddition.m
//  PingAnGoodHelper
//
//  Created by 曾鹏展(EX-ZENGPENGZHAN001) on 2021/11/25.
//  Copyright © 2021 平安产险科技中心. All rights reserved.
//

#import "UIButton+PAITAdd.h"
#import <objc/runtime.h>

@implementation UIButton (PAITAdd)

#pragma mark - 额外热区

- (UIEdgeInsets)pait_touchAreaInsets
{
    return [objc_getAssociatedObject(self, @selector(pait_touchAreaInsets)) UIEdgeInsetsValue];
}

- (void)setPait_touchAreaInsets:(UIEdgeInsets)pait_touchAreaInsets {
    NSValue *value = [NSValue valueWithUIEdgeInsets:pait_touchAreaInsets];
    objc_setAssociatedObject(self, @selector(pait_touchAreaInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    UIEdgeInsets touchAreaInsets = self.pait_touchAreaInsets;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(bounds.origin.x - touchAreaInsets.left,
                        bounds.origin.y - touchAreaInsets.top,
                        bounds.size.width + touchAreaInsets.left + touchAreaInsets.right,
                        bounds.size.height + touchAreaInsets.top + touchAreaInsets.bottom);
    return CGRectContainsPoint(bounds, point);
}


#pragma mark - 重复点击

static const CGFloat PAIT_RepeatClick_Interal = 1.0f;

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (!self.pait_needPreventRepeatClick) {
        [super sendAction:action to:target forEvent:event];
        return;
    }
    self.pait_preventRepeatClickInterval = PAIT_RepeatClick_Interal ; //倒计时时间
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    } else {
        [super sendAction:action to:target forEvent:event];
    }
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    if (!self.timer) {
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    }
    // dispatch_walltime 创建的是一个绝对的时间点，第一个时间传NULL表示从当前时间开始
    dispatch_source_set_timer(self.timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(self.timer, ^{
        if(self.pait_preventRepeatClickInterval <= 0) { //倒计时结束，关闭
            dispatch_source_cancel(self.timer);
            self.timer = nil;
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [super sendAction:action to:target forEvent:event];
//            });
            self.pait_preventRepeatClickInterval = PAIT_RepeatClick_Interal;
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [super sendAction:@selector(handleAction:) to:self forEvent:event];
            });
            self.pait_preventRepeatClickInterval --;
        }
    });
    dispatch_resume(self.timer);
}

- (void)handleAction:(id)sender {}

- (CGFloat)pait_preventRepeatClickInterval {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setPait_preventRepeatClickInterval:(CGFloat)delayInterval {
    objc_setAssociatedObject(self, @selector(pait_preventRepeatClickInterval), @(delayInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (dispatch_source_t)timer {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTimer:(dispatch_source_t)timer {
    objc_setAssociatedObject(self, @selector(timer),timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setPait_needPreventRepeatClick:(BOOL)isNeedDelay {
    objc_setAssociatedObject(self, @selector(pait_needPreventRepeatClick), @(isNeedDelay), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pait_needPreventRepeatClick {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

#pragma mark - 图文布局

- (void)pait_contentLayoutWithStyle:(PAITButtonContentLayoutStyle)style imageTitleSpace:(CGFloat)space {
    /**
     *  知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     *  如果只有title，那它上下左右都是相对于button的，image也是一样；
     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case PAITButtonContentLayoutImageTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case PAITButtonContentLayoutImageLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case PAITButtonContentLayoutImageBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case PAITButtonContentLayoutImageRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

@end
