//
//  FDCommonCell.h
//  FDGroupIconViewDemo
//
//  Created by QianTuFD on 16/8/26.
//  Copyright © 2016年 fandy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDCommonCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *iconTitle;


+ (FDCommonCell *)commonCellFromXib;

@end
