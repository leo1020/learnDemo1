//
//  UserBackViewController.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/2.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "UserBackViewController.h"

@interface UserBackViewController ()

@end

@implementation UserBackViewController

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
    
     self.view.backgroundColor = kGrayColor;
    [super viewDidLoad];
    [self addbuildingView ];
    [self addcontentView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addbuildingView
{
    //1添加头部视图
    UIView *headerView = [[UIView alloc] init ];
    headerView.frame = CGRectMake(0, 0, self.view.width, 44);
    headerView.backgroundColor = kDefaultColor;
    [self.view addSubview:headerView];
    
    //2添加标题
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"用户反馈";
    label1.frame = CGRectMake(55,15, 200, 30);
    label1.textColor = [UIColor whiteColor];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:20];
    [headerView addSubview:label1];
    
    //3返回按钮
    UIButton *back = [[UIButton alloc] init];
    back.frame = CGRectMake(10, 10, 25, 30);
    [back setImage:[UIImage imageNamed:@"check_main_back.gif"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backHome) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:back];
    
    //4添加帮助
    
    UIButton *help = [[UIButton alloc]init];
    
    help.center = CGPointMake(headerView.center.x, self.view.frame.size.height-20);

    help.bounds = CGRectMake(10, 0, 200, 35);
    help.layer.cornerRadius = 20;
    
    help.frame = CGRectMake(60, 400, 200, 40);
    //添加title
    [help setTitle: @"发送反馈" forState:UIControlStateNormal];
    help.backgroundColor =kDefaultColor;
    [help setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    //添加点击事件
    [help addTarget:self action:@selector(helpthing) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: help];

    
}

- (void)addcontentView
{
    UITextView *text = [[UITextView alloc] init];
    text.frame = CGRectMake(20, 80, 280, 300);
    text.backgroundColor = [UIColor whiteColor];
    text.font = [UIFont systemFontOfSize:18];
    text.delegate = self;
    [self.view addSubview:text];
    
}

- (void)helpthing
{
    
}


- (void)backHome
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma mark -UITextView delegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([@"\n" isEqualToString:text] == YES )
    {
        [textView resignFirstResponder];
    return NO;
}
    return YES;
}


@end
