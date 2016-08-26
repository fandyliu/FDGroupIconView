//
//  FDGroupIconView.h
//  FDGropIcon
//
//  Created by QianTuFD on 16/8/24.
//  Copyright © 2016年 fandy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDGroupIconView : UIView {
    CGFloat _padding;
}

@property (nonatomic, assign) CGFloat padding;// 越大距离越近默认是1
@property (nonatomic, strong) NSArray *iconArray;
- (instancetype)initWithFrame:(CGRect)frame iconArray:(NSArray *)iconArray;
+ (instancetype)groupIconViewWithFrame:(CGRect)frame iconArray:(NSArray *)iconArray;


- (UIImage *)getImage;
@end
