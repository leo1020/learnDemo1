//
//  NotifiyViewController.h
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/5.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotifiyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UILabel *detailTextLabel;

@end
