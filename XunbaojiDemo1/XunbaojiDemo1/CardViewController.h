//
//  CardViewController.h
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/10.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end
