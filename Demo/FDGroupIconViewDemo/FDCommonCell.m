//
//  FDCommonCell.m
//  FDGroupIconViewDemo
//
//  Created by QianTuFD on 16/8/26.
//  Copyright © 2016年 fandy. All rights reserved.
//

#import "FDCommonCell.h"

@implementation FDCommonCell


+ (FDCommonCell *)commonCellFromXib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:nil options:nil] firstObject];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
    self.frame = CGRectMake(0, 0, 0, 150);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
