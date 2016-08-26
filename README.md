# FDGroupIconView
==============
[![Pod License](http://img.shields.io/cocoapods/l/FDGroupIconView.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)&nbsp;
[![Pod Version](http://img.shields.io/cocoapods/v/FDGroupIconView.svg?style=flat)](http://cocoadocs.org/docsets/FDCategories/)&nbsp;
[![Pod Platform](http://img.shields.io/cocoapods/p/FDGroupIconView.svg?style=flat)](http://cocoadocs.org/docsets/FDCategories/)&nbsp;

you can setup your group icons just by oneline code.

CocoaPods Installation
==============

1. Add `pod 'FDGroupIconView'` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import \<FDGroupIconView/FDGroupIconView.h\>.

Requirements
==============
This library requires `iOS 6.0+` and `Xcode 7.0+`.

Demo Project
==============
See `Demo/FDGroupIconViewDemo.xcodeproj`

How To Use
==============

you can use 

``` 

UIImage *image2 = [UIImage imageNamed:@"two"];

NSURL *url4 = [NSURL URLWithString:@"http://v1.qzone.cc/avatar/201505/18/13/28/55597873bc536742.jpg%21200x200.jpg"];

// you can creat this array by  UIImage  NSURL or NSString(imageName/urlString)  
NSArray *iconArray = @[@"one.png",// 图片名字
                                   image2, // 直接图片
                                   @"http://v1.qzone.cc/avatar/201506/22/14/08/5587a649427f7478.png%21200x200.jpg", // string
                                   url4, // url
                                   @"http://v1.qzone.cc/avatar/201506/22/14/08/5587a65d495f9719.png%21200x200.jpg",
                                   ];
            FDGroupIconView *icon = [FDGroupIconView groupIconViewWithFrame:CGRectMake(0, 0, 130, 130) iconArray:iconArray];
            icon.center = CGPointMake(75,75);
            [cell.iconImageView addSubview:icon];

```


License
==============
FDCategories is provided under the MIT license. See LICENSE file for details.

