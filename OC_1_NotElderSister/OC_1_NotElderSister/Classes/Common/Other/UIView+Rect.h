//
//  UIView+Rect.h
//  OC_1_NotElderSister
//
//  Created by 一泓明峰 on 16/2/29.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Rect)

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize  size;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

- (CGFloat)left;
- (CGFloat)right;
- (CGFloat)top;
- (CGFloat)bottom;

@end
