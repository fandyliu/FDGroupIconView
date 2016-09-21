//
//  FDMainViewController.m
//  FDGroupIconViewDemo
//
//  Created by QianTuFD on 16/8/26.
//  Copyright © 2016年 fandy. All rights reserved.
//

#import "FDMainViewController.h"
#import "FDCommonCell.h"
#import <FDGroupIconView/FDGroupIconView.h>

@interface FDMainViewController ()

@property (nonatomic, strong) NSArray<NSString *> *titleArray;

@end

@implementation FDMainViewController

- (NSArray *)titleArray {
    if (_titleArray == nil) {
        _titleArray = @[@"One Icon GroupIconView",
                        @"Two Icons GroupIconView",
                        @"Three Icons GroupIconView",
                        @"Four Icons GroupIconView",
                        @"Five Icons GroupIconView"];
    }
    return _titleArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 150;
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 60, 30)];
    lable.text = @"Group Icon Demo";
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont fontWithDescriptor:[UIFontDescriptor fontDescriptorWithName:@"Zapfino" size:15] size:15];
    self.navigationItem.titleView = lable;
}


#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"CommonCell";
    FDCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [FDCommonCell commonCellFromXib];
    }
    
    cell.iconTitle.text = self.titleArray[indexPath.row];
    switch (indexPath.row) {
        case 0:
        {
            NSArray *iconArray = @[@"http://img1.imgtn.bdimg.com/it/u=3561580121,311998016&fm=206&gp=0.jpg",
                                   ];
            FDGroupIconView *icon = [FDGroupIconView groupIconViewWithFrame:CGRectMake(0, 0, 130, 130) iconArray:iconArray];
            icon.center = CGPointMake(75,75);
            [cell.iconImageView addSubview:icon];
        }
            break;
        case 1:
        {
            NSArray *iconArray = @[@"http://img1.imgtn.bdimg.com/it/u=3561580121,311998016&fm=206&gp=0.jpg",
                                   @"http://v1.qzone.cc/avatar/201505/18/13/28/55597873bc536742.jpg%21200x200.jpg"
                                   ];
            FDGroupIconView *icon = [FDGroupIconView groupIconViewWithFrame:CGRectMake(0, 0, 130, 130) iconArray:iconArray];
            icon.center = CGPointMake(75,75);
            [cell.iconImageView addSubview:icon];
        }
            break;
        case 2:
        {
            NSArray *iconArray = @[@"http://img1.imgtn.bdimg.com/it/u=3561580121,311998016&fm=206&gp=0.jpg",
                                   @"http://v1.qzone.cc/avatar/201505/18/13/28/55597873bc536742.jpg%21200x200.jpg",
                                   @"http://v1.qzone.cc/avatar/201506/22/14/08/5587a649427f7478.png%21200x200.jpg"
                                   ];
            FDGroupIconView *icon = [FDGroupIconView groupIconViewWithFrame:CGRectMake(0, 0, 130, 130) iconArray:iconArray];
            icon.center = CGPointMake(75,75);
            [cell.iconImageView addSubview:icon];
        }
            break;
        case 3:
        {
            NSArray *iconArray = @[@"http://img1.imgtn.bdimg.com/it/u=3561580121,311998016&fm=206&gp=0.jpg",
                                   @"http://v1.qzone.cc/avatar/201505/18/13/28/55597873bc536742.jpg%21200x200.jpg",
                                   @"http://v1.qzone.cc/avatar/201506/22/14/08/5587a649427f7478.png%21200x200.jpg",
                                   @"http://v1.qzone.cc/avatar/201505/18/13/28/55597873bc536742.jpg%21200x200.jpg"
                                   ];
            FDGroupIconView *icon = [FDGroupIconView groupIconViewWithFrame:CGRectMake(0, 0, 130, 130) iconArray:iconArray];
            icon.center = CGPointMake(75,75);
            [cell.iconImageView addSubview:icon];
        }
            break;
        case 4:
        {
            UIImage *image2 = [UIImage imageNamed:@"two.jpg"];
            NSURL *url4 = [NSURL URLWithString:@"http://v1.qzone.cc/avatar/201505/18/13/28/55597873bc536742.jpg%21200x200.jpg"];
            NSArray *iconArray = @[@"one.jpg",// 图片名字
                                   image2, // 直接图片
                                   @"http://v1.qzone.cc/avatar/201506/22/14/08/5587a649427f7478.png%21200x200.jpg", // string
                                   url4, // url
                                   @"http://v1.qzone.cc/avatar/201506/22/14/08/5587a65d495f9719.png%21200x200.jpg",
                                   ];
            FDGroupIconView *icon = [FDGroupIconView groupIconViewWithFrame:CGRectMake(0, 0, 130, 130) iconArray:iconArray];
            icon.center = CGPointMake(75,75);
            [cell.iconImageView addSubview:icon];
        }
            break;
            
        default:
            break;
    }
    
    
    return cell;
}



- (void)pushToViewController:(UIViewController *)vc row:(NSInteger)row {
    vc.title = self.titleArray[row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
