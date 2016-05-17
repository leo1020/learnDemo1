//
//  SecurityPlanViewController.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/2.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "SecurityPlanViewController.h"
#import "NotifiyViewCell.h"
#import "DetailViewController.h"

@interface SecurityPlanViewController ()

@end

@implementation SecurityPlanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
#pragma mark - UITableView delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, self.view.width, 44);
    headerView.backgroundColor = kDefaultColor;
    
    UILabel *title = [[UILabel alloc] init];
    title.text = @"保险方案";
    title.font = [UIFont systemFontOfSize:20];
    title.textColor = [UIColor whiteColor];
    [headerView addSubview: title];
    
    //3返回按钮
    UIButton *back = [[UIButton alloc] init];
    back.frame = CGRectMake(10, 10, 25, 30);
    [back setImage:[UIImage imageNamed:@"check_main_back.gif"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backHome) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:back];

    return  headerView;
}

- (void)backHome
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150 ;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

#pragma mark - UITableView dataSource

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
    NotifiyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NotifiyViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    

    cell.textLabel.text = @"2015-12-09";
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = kColor(0.5216, 0.5137, 0.5059, 1);
    
    cell.detailTextLabel.text = @"某某某帮你制定了健康保险计划...........";
    cell.detailTextLabel.font = [UIFont systemFontOfSize:16];
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.backgroundColor = [ UIColor clearColor];
    cell.detailTextLabel.textColor = kColor(0.5216, 0.5137, 0.5059, 1);

    cell.rightLabel.text = @"未读";
    cell.rightLabel.font = [UIFont systemFontOfSize:14];
    cell.rightLabel.backgroundColor = [UIColor clearColor];
    cell.rightLabel.textColor = kDefaultColor;
    
    cell.lookUpLabel.text = @"详情";
    cell.lookUpLabel.textColor = [ UIColor blackColor];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
   return cell;
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailview = [[DetailViewController alloc] init];
    [self presentViewController:detailview animated:YES completion:^{
        
    }];
    

}



@end
