//
//  SaveExpertViewController.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/2.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "SaveExpertViewController.h"
#import "ExpertTableViewCell.h"
#import "CardViewController.h"

@interface SaveExpertViewController ()

@end

@implementation SaveExpertViewController

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
#pragma mark - UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    return 150;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //创建头部视图
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, 200, 44);
    headerView.backgroundColor = kDefaultColor;
    
    //添加文字
    UILabel *label1= [[UILabel alloc] init];
    label1.frame = CGRectMake( 60, 15, 200, 20);
    label1.font = [UIFont systemFontOfSize:20];
    label1.text = @"选专家";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor whiteColor];
    [headerView addSubview:label1];
 
    //添加按钮
    //3返回按钮
    UIButton *back = [[UIButton alloc] init];
    back.frame = CGRectMake(10, 10, 25, 30);
    [back setImage:[UIImage imageNamed:@"check_main_back.gif"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backHome) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:back];

    
    return headerView;
}

- (void)backHome
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


#pragma mark - UITableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    ExpertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ExpertTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.imageView.image = [UIImage imageNamed:@"personal_picture.png"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CardViewController *cardView = [[CardViewController alloc] init];
    [self presentViewController:cardView animated:YES completion:^{
        
    }];
    
}


@end
