//
//  ViewController.m
//  FDGroupIconViewDemo
//
//  Created by QianTuFD on 16/8/25.
//  Copyright © 2016年 fandy. All rights reserved.
//

#import "ViewController.h"
#import <FDGroupIconView/FDGroupIconView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FDGroupIconView *view = [[FDGroupIconView alloc] initWithFrame:CGRectMake(20, 20, 200, 200) iconArray:@[
                                                    @"http://awb.img.xmtbang.com/img/uploadnew/201510/23/ccaeb2d2abe94fa6b3efe014e9146e94.jpg",@"http://ww2.sinaimg.cn/crop.0.0.1080.1080.1024/0064BfAujw8ewj6ch5ooaj30u00u0q56.jpg",@"http://www.th7.cn/d/file/p/2016/04/14/39adb990aa23fe746626f06b61a5a972.jpg",@"2.png"                                                          ]];
    [self.view addSubview:view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
