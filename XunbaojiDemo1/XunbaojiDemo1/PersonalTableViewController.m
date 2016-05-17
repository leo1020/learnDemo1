//
//  PersonalTableViewController.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/2.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "PersonalTableViewController.h"
#import "NotifiyViewController.h"
#import "UserBackViewController.h"
#import "SaveExpertViewController.h"
#import "SecurityPlanViewController.h"
#import "BindingMobileViewController.h"
#import "MessageBookViewController.h"


#import "HuaTableViewController.h"

#define kHeaderViewHeight 180

@interface PersonalTableViewController ()

@end

@implementation PersonalTableViewController
{
    NSArray * dataList;
    NSArray *imageList;
    
}

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
    
    self.view.backgroundColor = kDefaultColor;
    //初始化数据
    [self creatData];
   [self addTableView];
    
   }


- (void)addTableView
{
    self.tableView.bounces = NO;
    
    self.tableView.separatorColor = kDefaultColor;
}
// 创建数据
- (void)creatData
{
    dataList = [NSArray arrayWithObjects:@"通知",@"用户反馈",@"收藏的专家",@"我的保险方案",@" 绑定手机",@"信息薄", nil];
    imageList = [NSArray arrayWithObjects:@"inform.png",@"user_back.png",@"save_expert",@"security_plan.png",@"binding_phone.png",@"message.png", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITableView代理方法

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return kHeaderViewHeight;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //创建头部视图
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, 200, kHeaderViewHeight);
    headerView.backgroundColor = kDefaultColor;
    //添加背景图片
    UIImageView *headerImage = [[UIImageView alloc] init];
    headerImage.center = CGPointMake(headerView.center.x, headerView.center.y-20);
    headerImage.bounds = CGRectMake(0, 0, 100, 100);
    headerImage.image = [UIImage imageNamed:@"header.png"];
    [headerView addSubview:headerImage];
    
    UILabel *label = [[UILabel alloc] init];
    label.center = CGPointMake(headerImage.center.x, headerImage.bottom+18);
    label.bounds = CGRectMake(0, 0, 200, 15);
    label.text = @"会飞的马大嘴";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = kDefaultColor;
    label.textColor = [UIColor whiteColor];
    label.font  = [UIFont systemFontOfSize:18];
    [headerView addSubview: label];
    
    return headerView;
}



#pragma mark - UITableView datasource



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idetifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:idetifier ];
        
    }
    
    //设置图标
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = dataList[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.contentView.backgroundColor = kDefaultColor;
    //设置图片
    cell.imageView.image = [UIImage imageNamed:imageList[indexPath.row]];
    cell.imageView.contentMode = UIViewContentModeCenter;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:{
            //通知
            NotifiyViewController *natifiy = [[NotifiyViewController alloc] init];
           [self.delegate openDetailContent:natifiy];
           
//            
//            HuaTableViewController *huaVC = [[HuaTableViewController alloc] init];
//            [self.delegate openDetailContent:huaVC];
        }
            break;
        case 1:{
            //用户反馈
            UserBackViewController *userBack = [[UserBackViewController alloc] init];
            [self.delegate openDetailContent:userBack];
            
        }
            break;
        case 2:{
            //收藏专家
            SaveExpertViewController *save = [[SaveExpertViewController alloc] init];
            [self.delegate openDetailContent:save];
            
        }
            break;
        case 3:{
            //我的保险方案
            SecurityPlanViewController *plan = [[SecurityPlanViewController alloc] init];
            [self.delegate openDetailContent:plan];
            
        }
            break;
        case 4:{
            //绑定手机
            BindingMobileViewController *binding = [[BindingMobileViewController alloc] init];
            [self.delegate openDetailContent:binding];
            
        }
            break;
   
            
            
        default:{//信息簿
            MessageBookViewController *messageBook = [[MessageBookViewController alloc] init];
            [self.delegate openDetailContent:messageBook];
            
        }
            break;
    }
    
}






@end
