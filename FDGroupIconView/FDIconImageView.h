//
//  FDIconImageView.h
//  FDGropIcon
//
//  Created by QianTuFD on 16/8/24.
//  Copyright © 2016年 fandy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define radians(degrees) ((degrees) * M_PI / 180)

typedef NS_ENUM(NSUInteger, FDDirectionType) {
    FDDirectionTypeNone,
    FDDirectionTypeTop,
    FDDirectionTypeBottom,
    FDDirectionTypeLeft,
    FDDirectionTypeRight,
    FDDirectionTypeLeftTop_2,
    FDDirectionTypeLeftTop_3,
    FDDirectionTypeLeftBottom_3,
    FDDirectionTypeLeftBottom_5,
    FDDirectionTypeRightBottom_5,
    FDDirectionTypeRightTop_5,
    FDDirectionTypeLeftTop_5
};

@interface FDIconImageView : UIImageView

/**
 *  不带angle默认是60度
 */
- (instancetype)initWithDirection:(FDDirectionType)direction;
- (instancetype)initWithDirection:(FDDirectionType)direction angle:(CGFloat)angle;

+ (instancetype)iconImageViewWithDirection:(FDDirectionType)direction;
+ (instancetype)iconImageViewWithDirection:(FDDirectionType)direction angle:(CGFloat)angle;

- (void)cornerRadiusWithDirection:(FDDirectionType)direction;
- (void)cornerRadiusWithDirection:(FDDirectionType)direction angle:(CGFloat)angle;

// 更新图片的开口方向
- (void)updateDirection:(NSInteger)direction;
// 更新图片的角度大小
- (void)updateAngle:(CGFloat)angle;


@end
