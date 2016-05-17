//
//  BindingMobileViewController.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/2.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "BindingMobileViewController.h"

@interface BindingMobileViewController ()

{
    UIView *_view;
}
@end

@implementation BindingMobileViewController

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
    self.view.backgroundColor = kGrayColor;
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
    title.text = @"绑定手机";
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
  //添加内容
- (void)addcontentView
{
    
    UITextField *textField1 = [[UITextField alloc] init];
    textField1.frame = CGRectMake(20, 80, self.view.width - 40, 30);
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.placeholder =@"请输入手机号:";
    textField1.font = [UIFont systemFontOfSize:18];
    textField1.delegate = self;
    [self.view addSubview:textField1];
    
    //手机验证
    UITextField *textField2 = [[UITextField alloc] init];
    textField2.frame = CGRectMake(20, textField1.bottom+35, self.view.width - 120, 30);
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    textField2.placeholder = @"请输入验证码中:";
    textField2.font = [UIFont systemFontOfSize:18];
    textField2.delegate =self;
    [self.view addSubview:textField2];
    
    UIButton *hostButton = [[UIButton alloc] init];
    hostButton.frame = CGRectMake(textField2.right +5, textField2.top, 80, 30);
    hostButton.layer.cornerRadius = 15;
    [hostButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [hostButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    hostButton.backgroundColor = kDefaultColor;
    hostButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:hostButton];
    
    UIButton * blackButton = [[ UIButton alloc] init];
    blackButton.frame = CGRectMake(self.view.width/2-30, textField2.bottom +20, 10, 10);
    blackButton.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackButton];
    
    UIButton *secretButton = [[UIButton alloc] init];
    secretButton.frame = CGRectMake(blackButton.right+10, textField2.bottom +16, self.view.width/2, 20);
    [secretButton setTitle:@"《速寻保隐私保护条款》" forState:UIControlStateNormal];
    [secretButton setTitleColor:[UIColor blackColor] forState: UIControlStateNormal];
    secretButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:secretButton];
    
   //添加确定按钮
    UIButton *sureButton = [[UIButton alloc] init];
    sureButton.frame = CGRectMake(40, secretButton.bottom +10, self.view.width- 120, 40);
    sureButton.layer.cornerRadius =20;
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sureButton.backgroundColor = kDefaultColor;
    sureButton.titleLabel.font = [UIFont systemFontOfSize:18];
    sureButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:sureButton];
}


- (void)backHome
{ 
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma  mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    
    [textField resignFirstResponder ];
    return YES;
}
@end
