//
//  TabBar.m
//  OC_1_NotElderSister
//
//  Created by 一泓明峰 on 16/2/29.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "TabBar.h"

@interface TabBar ()
@property (weak,nonatomic) UIButton *publishButton;
@end

@implementation TabBar
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 设置tabbar的背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        
        // 添加发布按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        publishButton.size = publishButton.currentBackgroundImage.size;
        [self addSubview:publishButton];
        self.publishButton = publishButton;
    }
    return self;
}

- (void)publishClick
{
    PublishViewController *publish = [[PublishViewController alloc] init];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:publish animated:NO completion:nil];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 标记按钮是否已经添加过监听器
    static BOOL added = NO;
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    // 设置发布按钮的frame
    self.publishButton.center = CGPointMake(width * 0.5, height * 0.5);
    
    // 设置其他UITabBarButton的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = width / 5;
    CGFloat buttonH = height;
    NSInteger index = 0;
    for (UIControl *button in self.subviews) {
        if (![button isKindOfClass:[UIControl class]] || button == self.publishButton) continue;
        
        // 计算按钮的x值
        CGFloat buttonX = buttonW * ((index > 1)?(index + 1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 增加索引
        index++;
        
        if (added == NO) {
            // 监听按钮点击
            [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    added = YES;
}

- (void)buttonClick
{
    // 发出一个通知
    [NoteCenter postNotificationName:TabBarDidSelectNotification object:nil userInfo:nil];
}

@end
