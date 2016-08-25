//
//  FDGroupIconView.m
//  FDGropIcon
//
//  Created by QianTuFD on 16/8/24.
//  Copyright © 2016年 fandy. All rights reserved.
//

#import "FDGroupIconView.h"
#import "FDIconImageView.h"
#import <UIImageView+WebCache.h>

#define kDefalutIcon @"defalut.png"
#define kPlaceHolderIcon @"placeholder.png"

@implementation FDGroupIconView

- (instancetype)initWithFrame:(CGRect)frame iconArray:(NSArray *)iconArray {
    if (self = [super initWithFrame:frame]) {
        self.iconArray = iconArray;
    }
    return self;
}

- (void)setIconArray:(NSArray *)iconArray {
    if (_iconArray.count != 0) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    _iconArray = iconArray;
    [self setNeedsLayout];
}

- (CGFloat)padding {
    if (_padding <= 0) {
        _padding = 1;
    }
    return _padding;
}

- (void)setPadding:(CGFloat)padding {
    if (_iconArray.count != 0) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    _padding = padding;
    [self setNeedsLayout];
}


- (void)updateSubViews{
    if (!_iconArray || _iconArray.count == 0) return;
    CGFloat r = [self getRadius];
    if (r < 0) {
        NSLog(@"头像的照片数不能超过5个,你的照片数为%zd",_iconArray.count);
        return;
    }
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat padding = self.padding;
    switch (self.iconArray.count) {
        case 1:
        {
            [self addIconImageView:FDDirectionTypeNone image:self.iconArray[0] center:CGPointMake(r, r)];
        }
            break;
        case 2:
        {
            [self addIconImageView:FDDirectionTypeNone image:self.iconArray[0] center:CGPointMake(r + padding, r + padding)];

            [self addIconImageView:FDDirectionTypeLeftTop_2 image:self.iconArray[1] center:CGPointMake(width - r - padding * 2, width - r - padding * 2)];
        }
            break;
        case 3:
        {
            CGFloat paddingy = (width - r * 2 - r * 2 * 0.82 * (3 * 0.5)) * 0.5;
            [self addIconImageView:FDDirectionTypeLeftBottom_3 image:self.iconArray[0] center:CGPointMake(width / 2, r + paddingy)];
            [self addIconImageView:FDDirectionTypeRight image:self.iconArray[1] center:CGPointMake(r, width - r - paddingy)];
            [self addIconImageView:FDDirectionTypeLeftTop_3 image:self.iconArray[2] center:CGPointMake(width - r, width - r - paddingy)];
        }
            break;
        case 4:
        {
            [self addIconImageView:FDDirectionTypeBottom image:self.iconArray[0] center:CGPointMake(r + padding, r + padding)];
            [self addIconImageView:FDDirectionTypeLeft image:self.iconArray[1] center:CGPointMake(width - r - padding, r + padding)];
            [self addIconImageView:FDDirectionTypeRight image:self.iconArray[2] center:CGPointMake(r + padding, width - r - padding)];
            [self addIconImageView:FDDirectionTypeTop image:self.iconArray[3] center:CGPointMake(width - r - padding, width - r - padding)];
        }
            break;
        case 5:
        {
            // 边距
            CGFloat s1 = -r * 2 * 0.81;
            CGFloat x1 = 0;
            CGFloat y1 = s1;

            CGFloat x5 = (CGFloat) (s1 * cos(radians(19)));
            CGFloat y5 = (CGFloat) (s1 * sin(radians(18)));

            CGFloat x4 = (CGFloat) (s1 * cos(radians(54)));
            CGFloat y4 = (CGFloat) (-s1 * sin(radians(54)));

            CGFloat x3 = (CGFloat) (-s1 * cos(radians(54)));
            CGFloat y3 = (CGFloat) (-s1 * sin(radians(54)));

            CGFloat x2 = (CGFloat) (-s1 * cos(radians(19)));
            CGFloat y2 = (CGFloat) (s1 * sin(radians(18)));
            // 居中 Y轴偏移量
            CGFloat xx1 = width/2;
            // 居中 X轴偏移量
            CGFloat xxc1 = width/2;
            
            [self addIconImageView:FDDirectionTypeLeftBottom_5 image:self.iconArray[0] center:CGPointMake(x1 + xxc1, y1 + xx1)];
            [self addIconImageView:FDDirectionTypeLeftTop_5 image:self.iconArray[1] center:CGPointMake(x2 + xxc1, y2 + xx1)];
            [self addIconImageView:FDDirectionTypeRightTop_5 image:self.iconArray[2] center:CGPointMake(x3 + xxc1, y3 + xx1)];
            [self addIconImageView:FDDirectionTypeRight image:self.iconArray[3] center:CGPointMake(x4 + xxc1, y4 + xx1)];
            [self addIconImageView:FDDirectionTypeRightBottom_5 image:self.iconArray[4] center:CGPointMake(x5 + xxc1, y5 + xx1)];
        }
            break;
        default:
            break;
    }
}

- (void)addIconImageView:(FDDirectionType)direction image:(id)image center:(CGPoint)center {
    FDIconImageView *iconImageView = [[FDIconImageView alloc] initWithDirection:direction];
    CGFloat r = [self getRadius];
    iconImageView.frame = CGRectMake(0, 0, r * 2, r * 2);
    iconImageView.center = center;
    if ([image isKindOfClass:[NSURL class]]) {
        [iconImageView sd_setImageWithURL:image placeholderImage:[UIImage imageNamed:kPlaceHolderIcon]];
    }else if ([image isKindOfClass:[NSString class]]) {
        if ([image hasPrefix:@"http://"]) {
            [iconImageView sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:[UIImage imageNamed:kPlaceHolderIcon]];
        }else {
            UIImage *iconImage = [UIImage imageNamed:image];
            if (iconImage == nil) {
                iconImage = [UIImage imageNamed:kDefalutIcon];
            }
            /**
             *  处理
             */
            [iconImageView setImage:iconImage];
        }
    }else if([image isKindOfClass:[UIImage class]]){
        [iconImageView setImage:image];
    }else {
        UIImage *iconImage = [UIImage imageNamed:kDefalutIcon];
        [iconImageView setImage:iconImage];
    }
    
    [self addSubview:iconImageView];
}


- (CGFloat)getRadius {
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat r = -1;
    if (self.iconArray.count == 1) {
        r = width * 0.5;
    }else if (self.iconArray.count == 2) {
        CGFloat c = width/sin(radians(45));
        r = width - c * 0.5;
    }else if (self.iconArray.count == 3 || self.iconArray.count == 4) {
        r = width * 0.25;
    }else if (self.iconArray.count == 5) {
        r = width * 0.2;
    }
    return r;
}

@end
