//
//  TestSubView.m
//  LearnResponderChain
//
//  Created by NiuYulong on 2017/4/18.
//  Copyright © 2017年 牛玉龙. All rights reserved.
//

#import "TestSubView.h"
// DLog is almost a drop-in replacement for NSLog
// DLog();
// DLog(@"here");
// DLog(@"value: %d", x);
// Unfortunately this doesn't work DLog(aStringVariable); you have to do this instead DLog(@"%@", aStringVariable);

#ifdef DEBUG
#define DLog(fmt, ...) MDLog((@"%s [Line %d] " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif
// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) MDLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

// 用DLog代替NSLog，在Debug模式下就会输出信息，包括方法名，行数及你想要输出的内容。ALog无论在Debug还是在Release模式下都会输出。

#if __has_feature(objc_arc)
#define MDLog(format, ...) CFShow((__bridge CFStringRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);
#else
#define MDLog(format, ...) CFShow([NSString stringWithFormat:format, ## __VA_ARGS__]);
#endif

@implementation TestSubView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), 40)];
        label.textColor = [UIColor whiteColor];
        label.text = @"TestSubView";
        [self addSubview:label];
    }
    return self;
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    DLog(@"\nhahahha,%@",@"哈哈");
    NSLog(@"%s",__func__);
}


- (BOOL)canBecomeFirstResponder {
    NSLog(@"%s",__func__);
    return YES;
}

- (UIResponder *)nextResponder {
    NSLog(@"%s",__func__);
//    return [super nextResponder];
    return nil;
    
//   // 更改 UIResponder
//    UIResponder * next = [super nextResponder];
//    while ([next isKindOfClass:[UIViewController class]] == NO) {
//        next = [next nextResponder];
//    }
//    return next;
}
- (void)printResponderChain {
    UIResponder * next = self;
    NSMutableString * prefix = @"".mutableCopy;
    
    while (next != nil) {
        NSLog(@"%@%@", prefix, [next class]);
        [prefix appendString: @"--"];
        next = [next nextResponder];
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    /**
        实测self.alpha的临界值为0.01
     */
    if (!self.userInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    
    if ([self pointInside:point withEvent:event]) {
        // 遍历，从数组最后一个元素开始遍历
        for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertedPoint = [subView convertPoint:point fromView:self];
            UIView *hitTestView = [subView hitTest:convertedPoint withEvent:event];
            if (hitTestView) {
                return hitTestView;
            }
        }
        // 在当前视图，且没在子视图中，则返回当前视图
        return self;
    }
    return nil;
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    return [super pointInside:point withEvent:event];
}

@end
