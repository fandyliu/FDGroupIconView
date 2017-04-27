//
//  FDIconImageView.m
//  FDGropIcon
//
//  Created by QianTuFD on 16/8/24.
//  Copyright © 2016年 fandy. All rights reserved.
//

#import "FDIconImageView.h"
#import <objc/message.h>


//原点离圆弧最低点的距离
#define radianDeepLenght(angle, radius) ((radius) * sin(radians(90 - (angle))) - (radius) * sin(radians(angle)) * tan(radians(angle)))
#define kIsDrawImage @"kIsDrawImage"

@interface FDIconImageView ()
@property (nonatomic, assign) BOOL hadAddObserver;
@property (nonatomic, assign) FDDirectionType direction;
@property (nonatomic, assign) CGFloat halfAngle;
@end

@implementation FDIconImageView

- (instancetype)initWithDirection:(FDDirectionType)direction {
    if (self = [super init]) {
        [self cornerRadiusWithDirection:direction];
    }
    return self;
}

- (instancetype)initWithDirection:(FDDirectionType)direction angle:(CGFloat)angle {
    if (self = [super init]) {
        [self cornerRadiusWithDirection:direction angle:angle];
    }
    return self;
}

+ (instancetype)iconImageViewWithDirection:(FDDirectionType)direction {
    return [[self alloc] initWithDirection:direction];
}

+ (instancetype)iconImageViewWithDirection:(FDDirectionType)direction angle:(CGFloat)angle {
    return [[self alloc] initWithDirection:direction angle:angle];
}

- (void)cornerRadiusWithDirection:(FDDirectionType)direction {
    [self cornerRadiusWithDirection:direction angle:60];
}

- (void)cornerRadiusWithDirection:(FDDirectionType)direction angle:(CGFloat)angle {
    self.direction = direction;
    self.halfAngle = angle * 0.5;
    if (!_hadAddObserver) {
        [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
        self.hadAddObserver = YES;
    }
}

- (void)cornerRadiusWithImage:(UIImage *)image director:(NSInteger)direction angle:(float)angle
{
    CGSize size = self.bounds.size;
    if (CGSizeEqualToSize(size, CGSizeZero)) return;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    if (UIGraphicsGetCurrentContext() == nil) return;
    [self drawCircleWithImage:image];
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    objc_setAssociatedObject(processedImage, kIsDrawImage, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.image = processedImage;
    UIGraphicsEndImageContext();
}


- (void)updateDirection:(NSInteger)direction {
    if (self.direction == direction) return;
    self.direction = direction;
    if (self.image != nil) {
        [self cornerRadiusWithImage:self.image director:self.direction angle:self.halfAngle];
    }
}

- (void)updateAngle:(CGFloat)angle {
    if (self.halfAngle == angle * 0.5) return;
    self.halfAngle = angle * 0.5;
    if (self.image != nil) {
        [self cornerRadiusWithImage:self.image director:self.direction angle:self.halfAngle];
    }
}


- (void)drawCircleWithImage:(UIImage *)image{
    CGFloat startAngle = 0;
    CGFloat endAngle = 0;
    CGFloat x1 = 0;
    CGFloat x2 = 0;
    CGFloat y1 = 0;
    CGFloat y2 = 0;
    CGFloat halfAngle = self.halfAngle;
    CGFloat centerX = self.bounds.size.width / 2;
    CGFloat centerY = self.bounds.size.height / 2;
    CGFloat radius = centerX < centerY ? centerX : centerY;
    switch (self.direction) {
        case FDDirectionTypeNone:
        {
            startAngle = radians(90 - halfAngle);
            endAngle = radians(-270 - halfAngle);
        }
            break;
        case FDDirectionTypeTop:
        {
            startAngle = radians(-(90 + halfAngle));
            endAngle = radians(-90 + halfAngle);
            x1 = centerX;
            y1 = centerY - radianDeepLenght(halfAngle, radius);
            x2 = centerX - radius * sin(radians(halfAngle));
            y2 = centerY - radius * sin(radians(90 - halfAngle));
        }
            break;
        case FDDirectionTypeBottom:
        {
            startAngle = radians(90 - halfAngle);
            endAngle = radians(90 + halfAngle);
            x1 = centerX;
            y1 = centerY + radianDeepLenght(halfAngle, radius);
            x2 = centerX + radius * sin(radians(halfAngle));
            y2 = centerY + radius * sin(radians(90 - halfAngle));
        }
            break;
        case FDDirectionTypeLeft:
        {
            startAngle = radians(180 - halfAngle);
            endAngle = radians(-180 + halfAngle);
            x1 = centerX - radianDeepLenght(halfAngle, radius);
            y1 = centerY;
            x2 = centerX - radius * sin(radians(90 - halfAngle));
            y2 = centerY + radius * sin(radians(halfAngle));
        }
            break;
        case FDDirectionTypeRight:
        {
            startAngle = radians(-halfAngle);
            endAngle = radians(halfAngle);
            x1 = centerX + radianDeepLenght(halfAngle, radius);
            y1 = centerY;
            x2 = centerX + radius * sin(radians(90 - halfAngle));
            y2 = centerY - radius * sin(radians(halfAngle));
        }
            break;
        case FDDirectionTypeLeftTop_2:
        {
            startAngle = radians(-(180 - 45 + halfAngle));
            endAngle = radians(-(180 - 45- halfAngle));
            x1 = centerX - radianDeepLenght(halfAngle, radius) * sin(radians(45));
            y1 = centerY - radianDeepLenght(halfAngle, radius) * sin(radians(45));;
            x2 = centerX - radius*sin(radians(45 + halfAngle));
            y2 = centerY - radius*sin(radians(45 - halfAngle));
        }
            break;
        case FDDirectionTypeLeftBottom_3:
        {
            startAngle = radians(90);
            endAngle = radians(90 + halfAngle * 2);
            x1 = centerX - radianDeepLenght(halfAngle, radius)*sin(radians(halfAngle));
            y1 = centerY + radianDeepLenght(halfAngle, radius)/sin(radians(90 - halfAngle));
            y2 = centerY * 2;
            x2 = centerX;
        }
            break;
        case FDDirectionTypeLeftTop_3:
        {
            startAngle = radians(-(90 + halfAngle * 2));
            endAngle = radians(-(90));
            y1 = centerY - radianDeepLenght(halfAngle, radius) / sin(radians(90 - halfAngle));
            x1 = centerX - radianDeepLenght(halfAngle, radius) * sin(radians(halfAngle));
            x2 = centerX - centerX * sin(radians(30 * 2));
            y2 = centerY - centerX * sin(radians(90 - 30 * 2));
        }
            break;
        case FDDirectionTypeRightTop_5:
        {
            startAngle = radians(- 72 - halfAngle);
            endAngle = radians(- 72 + halfAngle);
            
            x1 = centerX + radianDeepLenght(halfAngle, radius) * sin(radians(90 - 72));
            y1 = centerY - radianDeepLenght(halfAngle, radius) * sin(radians(72));
            y2 = centerY - radius * sin(radians(90 - (90 - 72 - halfAngle)));
            x2 = centerX + radius * sin(radians(90 - 72 - halfAngle));
        }
            break;
        case FDDirectionTypeLeftTop_5:
        {
            startAngle = radians(- 144 - halfAngle);
            endAngle = radians(- 144 + halfAngle);
            x1 = centerX - radianDeepLenght(halfAngle, radius)*sin(radians(144 - 90));
            y1 = centerY - radianDeepLenght(halfAngle, radius)*sin(radians(90 - (144 - 90)));
            x2 = centerY - radius * sin(radians(90 - (180 - 144 - halfAngle)));
            y2 = centerX - radius * sin(radians(180 - 144 - halfAngle));
        }
            break;
        case FDDirectionTypeLeftBottom_5:
        {
            startAngle = radians(144 - halfAngle);
            endAngle = radians(144 + halfAngle);
            x1 = centerX - radianDeepLenght(halfAngle, radius)*sin(radians(144 - 90));
            y1 = centerY + radianDeepLenght(halfAngle, radius)*sin(radians(90 - (144 - 90)));
            y2 = centerY + radius * sin(radians(90 - (144 - halfAngle - 90)));
            x2 = centerX - radius * sin(radians(144 - halfAngle - 90));
        }
            break;
        case FDDirectionTypeRightBottom_5:
        {
            startAngle = radians(72 - halfAngle);
            endAngle = radians(72 + halfAngle);
            x1 = centerX + radianDeepLenght(halfAngle, radius)*sin(radians(90 - 72));
            y1 = centerY + radianDeepLenght(halfAngle, radius)*sin(radians(72));
            y2 = centerY + radius * sin(radians(72 - halfAngle));
            x2 = centerX + radius * sin(radians(90 - 72 + halfAngle));
        }
            break;
            
        default:
            break;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0, 0, 1, 1);
    
    CGContextAddArc(context, centerX, centerY, radius, startAngle, endAngle, 1);
    CGContextAddArcToPoint(context,
                           x1,
                           y1,
                           x2,
                           y2,
                           radius);
    
    CGContextClosePath(context);
    CGContextClip(context);
    [image drawInRect:self.bounds];
    
//    CGContextAddArc(context, centerX, centerY, radius - 1, startAngle, endAngle, 1);
//    CGContextAddArcToPoint(context,
//                           x1,
//                           y1,
//                           x2,
//                           y2,
//                           radius);
//    
//    CGContextClosePath(context);
//    CGContextSetRGBStrokeColor(context,1,0,0,1);
//    CGContextStrokePath(context);

}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.image != nil) {
        [self cornerRadiusWithImage:self.image director:self.direction angle:self.halfAngle];
    }
}

- (void)dealloc {
    if (_hadAddObserver) {
        [self removeObserver:self forKeyPath:@"image"];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"image"]) {
        UIImage *newImage = change[NSKeyValueChangeNewKey];
        if ([newImage isMemberOfClass:[NSNull class]]) {
            return;
        } else if ([objc_getAssociatedObject(newImage, kIsDrawImage) intValue] == 1) {
            return;
        }
        if (self.image != nil) {
            [self cornerRadiusWithImage:newImage director:self.direction angle:self.halfAngle];
        }
    }
}


@end
