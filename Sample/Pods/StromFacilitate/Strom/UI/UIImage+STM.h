//
//  UIImage+STM.h
//  StromFacilitate
//
//  Created by iosci on 2017/3/7.
//  Copyright © 2017年 DouKing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UIImage (STM)

/**
 生成指定色值的图片

 @param color 指定的色值
 @param size 图片z尺寸
 @param alpha 图片透明度
 @return UIImage
 */
+ (UIImage *)stm_imageWithColor:(UIColor *)color size:(CGSize)size alpha:(CGFloat)alpha;
+ (UIImage *)stm_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 改变图片颜色，不保留灰度信息，只保留透明度信息

 @param tintColor 将图片改变为该色
 @return 改变后的图片
 */
- (UIImage *)stm_imageWithTintColor:(nullable UIColor *)tintColor;

/**
 改变图片颜色，保留灰度信息和透明度信息

 @param tintColor 将图片改变为该色
 @return 改变后的图片
 */
- (UIImage *)stm_imageWithGradientTintColor:(nullable UIColor *)tintColor;

- (UIImage *)stm_imageWithTintColor:(nullable UIColor *)tintColor blendMode:(CGBlendMode)blendMode;

/**
 添加圆角

 @param radius 圆角半径
 @param size 绘制区域
 @return UIImage
 */
- (UIImage *)stm_addCornerRadius:(CGFloat)radius withSize:(CGSize)size;

/**
 添加圆角

 @param radii 圆角半径
 @param corners 需要绘制的角
 @param size 绘制区域
 @return UIImage
 */
- (UIImage *)stm_addCornerRadii:(CGSize)radii byRoundingCorners:(UIRectCorner)corners withSize:(CGSize)size;

/// 图像模糊
- (UIImage *)stm_blurredImageWithRadius:(CGFloat)radius;

@end


NS_ASSUME_NONNULL_END
