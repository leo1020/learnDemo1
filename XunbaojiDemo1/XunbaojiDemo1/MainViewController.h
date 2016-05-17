//
//  MainViewController.h
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/1.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalTableViewController.h"

@interface MainViewController : UIViewController<UIScrollViewDelegate
,PersonalTableViewControllerDelegate>

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIScrollView *scrollview;//主视图窗口

@property (nonatomic, strong) PersonalTableViewController *personalController;

@end