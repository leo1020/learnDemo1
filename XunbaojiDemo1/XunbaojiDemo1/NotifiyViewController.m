//
//  NotifiyViewController.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/5.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "NotifiyViewController.h"
#import "NotifiyViewCell.h"

@interface NotifiyViewController ()
@property (nonatomic,strong)UITableView *mytableView;

@end

@implementation NotifiyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



//创建头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(10, 10, self.view.width, 44);
    headerView.backgroundColor = kDefaultColor;
    [self.view addSubview:headerView];
    //创建按钮
    UIButton *backButton = [[UIButton alloc] init];
    backButton.frame = CGRectMake(10, 10, 25, 30);
    [backButton setImage:[UIImage imageNamed:@"check_main_back.gif"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backHome) forControlEvents:(UIControlEventTouchUpInside)];
    
    [headerView addSubview:backButton];
    
    //创建标题
    UILabel *title = [[UILabel alloc] init];
    title.frame = CGRectMake(30, 10, 280, 20);
    title.text = @"通知";
    title.textColor = [UIColor whiteColor];
    title.backgroundColor = [UIColor clearColor];
    title.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview: title];
    
    
    return headerView;
}


- (void)backHome
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - UITableView delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    NotifiyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier ];
    
    if (cell == nil) {
        cell = [[NotifiyViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = @"2014-07-20";
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = kColor(0.5216, 0.5137, 0.5059, 1);
    
    cell.detailTextLabel.text = @"有人回答了您的问题“我要买4y54uh4保险………………";
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:16];
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.alpha = 0.7;
    
    cell.rightLabel.text = @"未读";
    cell.rightLabel.textAlignment = NSTextAlignmentLeft;
    cell.rightLabel.font = [UIFont systemFontOfSize:14];
    cell.rightLabel.textColor =  kColor(0.5216, 0.5137, 0.5059, 1);
    
   
    cell.lookUpLabel.text = @"查看";
    //设置cell的选中状态
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   return cell;
}



@end


