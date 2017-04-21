//
//  ViewController.m
//  LearnResponderChain
//
//  Created by NiuYulong on 2017/4/18.
//  Copyright © 2017年 牛玉龙. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"
#import "TestSubView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    TestView *testView = [[TestView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    testView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.8];
    [self.view addSubview:testView];
    
    
    TestSubView *subView = [[TestSubView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    subView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.8];
    //    subView.alpha = 0.01;
    [testView addSubview:subView];
    
//    [testView.tap addTarget:self action:@selector(tapAction)];
}

- (void)tapAction {
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
}


- (UIResponder *)nextResponder {
    NSLog(@"%s",__func__);
    return [super nextResponder];
}
@end
