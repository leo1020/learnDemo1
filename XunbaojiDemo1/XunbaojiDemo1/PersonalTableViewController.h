//
//  PersonalTableViewController.h
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/2.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PersonalTableViewControllerDelegate <NSObject>

- (void)openDetailContent:(UIViewController *)controller ;

@end


@interface PersonalTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) id<PersonalTableViewControllerDelegate> delegate;


@end
