//
//  MessageBookViewController.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/2.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "MessageBookViewController.h"
#import "BindingMobileViewController.h"


@interface MessageBookViewController ()

@end

@implementation MessageBookViewController

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
    
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    //添加头部视图
    [self addheaderView];
     //添加内容
    [self addcontentView];
    
    //添加尾部视图
    [self addfooterView];
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
    title.text = @"信息簿";
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
    
    UIView *msview = [[UIView alloc] init];
    msview.frame = CGRectMake(title.right, 15, 60, 25);
    msview.backgroundColor = [UIColor whiteColor];
    msview.layer.cornerRadius = 10;
    [headerView addSubview:msview];
    
    UIButton * bindingButton = [[UIButton alloc] init];
    bindingButton.center = msview.center;
    bindingButton.bounds = CGRectMake(0, 0,msview.frame.size.width-2 , msview.frame.size.height -2);
    bindingButton.layer.cornerRadius =10;
    [bindingButton setTitle:@"绑定手机" forState:UIControlStateNormal];
    bindingButton.backgroundColor = kDefaultColor;
    [bindingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bindingButton addTarget:self action:@selector(bindingMobile) forControlEvents:UIControlEventTouchUpInside];
    bindingButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [ headerView addSubview:bindingButton];
    
    
    
}

//添加内容
 - (void)addcontentView
{
    for (int i= 0; i< 4; i++) {
        
        CGFloat width = (self.view.width - 30)/2;
        CGFloat height =(self.view .height- 44-30-200)/2;
        CGFloat y = (44+10+ (height +10)*(i/2));
        CGFloat x = (10+155*(i%2));
        
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(x, y, width, height);
        button.backgroundColor = kGrayColor;
        button.tag = i+10;
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(selected:) forControlEvents:
         UIControlEventTouchUpInside];
        //设置边框
        CGColorSpaceRef colorSpace =  CGColorSpaceCreateDeviceRGB();
        CGColorRef  colorRef = CGColorCreate(colorSpace, (CGFloat[]){0.7608, 0.7608, 0.7608, 1});
        
        button.layer.cornerRadius = 8;
        button.layer.borderColor = colorRef;
        button.layer.borderWidth = 1;
        [self.view addSubview: button];
        
        
        //添加视图
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.center = button.center;
        imageView.bounds = CGRectMake(0, 0, 100, 100);
        [self.view addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] init];
        label.center = CGPointMake(imageView.center.x, imageView.bottom);
        label.bounds = CGRectMake(0, 0, 60, 20);
        label.layer.cornerRadius = 15;
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = kDefaultColor;
        [self.view addSubview:label];
        
       // 添加选中小窗口
        UIButton *selectedButton = [[UIButton alloc] init];
        selectedButton.center = CGPointMake(button.right -20, button.top +20);
        selectedButton.bounds = CGRectMake(0, 0, 30,30 );
        selectedButton.layer.cornerRadius = 6;
        selectedButton.tag = i+20;
        selectedButton.layer.borderColor = colorRef;
        selectedButton.layer.borderWidth = 1;
        [selectedButton setImage:[UIImage imageNamed:@"message_selected.png"] forState:UIControlStateSelected];
        [selectedButton addTarget:self action:@selector(markSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:selectedButton];
        
        if (i == 1)
        {
            imageView.image = [UIImage imageNamed:@"message_father.png"];
            label.text = @"爸爸";
            
        }
        else if (i == 2)
        {
            imageView.image = [UIImage imageNamed: @"message_mather.png"];
            label.text = @"妈妈";
        }
        else
        {
            imageView.image = [UIImage imageNamed:@"message_me.png"];
            label.text = @"我";
        }
    }
    
}

//添加尾部视图

-(void)addfooterView
{
    //视图范围
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0,self.view.bottom - 200 , self.view.width, 200);
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 0, self.view.width-20, 75);
    label.text =@"注：以上信息仅保存在您的手机，如需跨设备访问请邦定其他手机号";
    label.font = [UIFont systemFontOfSize:12];
    label.numberOfLines = 0;
    label.textColor = [UIColor redColor];
    [view addSubview:label];

    UIButton *deleteButton = [[UIButton alloc] init];
    deleteButton.frame = CGRectMake(65, label.bottom, 80, 25);
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    [deleteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    deleteButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [view addSubview:deleteButton];
    //添加边框
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef  colorRef = CGColorCreate(colorSpace, (CGFloat []){0.9725, 0.3961, 0.1333, 1
        
    });
    
    deleteButton.layer.cornerRadius = 12;
    deleteButton.layer.borderColor = colorRef;
    deleteButton.layer.borderWidth = 1;
    [view addSubview:deleteButton];
    
    UIButton *yesButton = [[UIButton alloc] init];
    yesButton.frame = CGRectMake(deleteButton.right +40, deleteButton.top, 80, 25);
    yesButton.backgroundColor = kDefaultColor;
    [yesButton setTitle:@"是" forState:UIControlStateNormal];
    [yesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    yesButton.titleLabel.font =[UIFont systemFontOfSize:16];
    yesButton.layer.cornerRadius = 12;
    [view addSubview:yesButton];
    
    
    
}

//点击图像选中
- (void)selected:(UIButton *)sender
{
    NSInteger tag = sender.tag+10;
    UIButton *button = (UIButton*)[self.view viewWithTag:tag];
    [self markSelected:button];
    
}

//选中 选项
- (void)markSelected:(UIButton*)sender
{
    sender.selected = !sender.selected;
    
}
- (void)backHome
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)bindingMobile
{
    BindingMobileViewController *bindingView = [[BindingMobileViewController alloc] init];
    [self presentViewController:bindingView animated:YES completion:^{
       
    }];
}

@end
