//
//  TestView.m
//  LearnResponderChain
//
//  Created by NiuYulong on 2017/4/18.
//  Copyright © 2017年 牛玉龙. All rights reserved.
//

#import "TestView.h"

@implementation TestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        self.tap = tap;
        [self addGestureRecognizer:tap];
                
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), 40)];
        label.textColor = [UIColor whiteColor];
        label.text = @"TestView";
        [self addSubview:label];
    }
    return self;
}

- (void)tapAction {
    NSLog(@"%s",__func__);
}
- (UIResponder *)nextResponder {
    NSLog(@"%s",__func__);
    return [super nextResponder];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    NSLog(@"%s",__func__);
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    return [super hitTest:point withEvent:event];
    
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    return [super pointInside:point withEvent:event];
//    return NO;
    
}


@end
