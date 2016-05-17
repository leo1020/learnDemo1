//
//  OtherViewController.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/16.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

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
  //添加头部视图
    [self addheaderView];
  //添加内容
    [self addcontentView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//添加头部视图
- (void)addheaderView
{
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, self.view.width, 44);
    headerView.backgroundColor = kDefaultColor;
    [self.view addSubview: headerView];
    
    
    UILabel *title = [[UILabel alloc] init];
    title.text = @"其他险种";
    title.frame = CGRectMake(50, 20, 200, 20);
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont systemFontOfSize:20];
    [headerView addSubview:title];
    
    UIButton *back = [[UIButton alloc] init];
    back.frame = CGRectMake(10, 10, 25, 30);
    [back setImage:[UIImage imageNamed:@"check_main_back.gif"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backHome) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:back];
}

- (void)addcontentView
{
    for (int i =0; i<6; i++) {
    
        UIView *view1 = [[UIView alloc] init];
        view1.frame = CGRectMake(0, 55 + i*60, self.view.width, 60);
        view1.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:view1];
        
        UIButton *otherButton =[[UIButton alloc] init];
        otherButton.frame = CGRectMake(60, 20, view1.width -120, 30);
        otherButton.backgroundColor = kDefaultColor;
        otherButton.layer.cornerRadius = 15;
        otherButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [otherButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [view1 addSubview:otherButton];
        
        switch (i) {
            case 0:
                [otherButton setTitle:@"保障险" forState:UIControlStateNormal];
                break;
            case 1:
                [otherButton setTitle:@"意外险" forState:UIControlStateNormal];
                break;
            case 2:
                [otherButton setTitle:@"健康险" forState:UIControlStateNormal];
                break;
            case 3:
                [otherButton setTitle:@"分红险" forState:UIControlStateNormal];
                break;
            case 4:
                [otherButton setTitle:@"养老保险" forState:UIControlStateNormal];
                break;

            default:
                [otherButton setTitle:@"少儿保险" forState:UIControlStateNormal];
                break;
        }
    }
}

- (void)backHome
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
