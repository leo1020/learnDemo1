//
//  MainViewController.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/1.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "MainViewController.h"
#import "SocialViewController.h"
#import "BusinessViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController
{
    UIControl *mbControl;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationController.navigationBarHidden = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    
   //天际滚动视图
    [self addScrollview];
    //添加首页
     [self Firstbuiding];
    //添加手势和蒙板
    [self addGesture];
    [self addLeftView];
    
    
    
  }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

//添加滚动视图
- (void)addScrollview
{
    _scrollview = [[UIScrollView alloc] init];
    _scrollview.frame = CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height);
    _scrollview.contentSize = CGSizeMake(self.view.frame.size.width+200, self.view.frame.size.height);
    
    //设置代理
    _scrollview.delegate = self;
    //设置是否需要弹簧效果
    _scrollview.bounces = NO;
    _scrollview.showsHorizontalScrollIndicator = NO;
    _scrollview.pagingEnabled = YES;
    [_scrollview scrollRectToVisible:CGRectMake(200, 0, self.view.frame.size.width, self.view.frame.size.height) animated:YES];
    [self.view addSubview:_scrollview ];
   
    _contentView = [[UIView alloc] init];
    _contentView.frame =CGRectMake(200, 0, self.view.frame.size.width, self.view.frame.size.height);
    [_scrollview addSubview:_contentView];
}

//添加手势以及蒙板
- (void)addGesture
{

    
    //背景图片
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 320, 250);
    imageView.image = [UIImage imageNamed:@"home_background.png"];
    [_contentView addSubview:imageView];
    
    [self addLeftView];
    
    //添加蒙板
    mbControl = [[UIControl alloc] init];
    mbControl.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    mbControl.alpha = 0.8;
    mbControl.backgroundColor = [UIColor blackColor];
    [mbControl addTarget:self action:@selector(openPersonal) forControlEvents:UIControlEventTouchUpInside];
    [mbControl setHidden:YES];
    [_contentView addSubview: mbControl];
    
    
    //1左上角视图
    UIImageView *imageView1 = [[UIImageView alloc ] init];
    imageView1.frame = CGRectMake(0, 0, 41, 61);
    imageView1.image = [UIImage imageNamed:@"personal_icon.png"];
    imageView1.alpha = 1;
    [_contentView addSubview:imageView1];
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(self.view.frame.origin.x+10, 20, 20, 20);
    [button setImage:[UIImage imageNamed:@"link_man.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(openPersonal) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:button];
    
    
    UISwipeGestureRecognizer *swipGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(backHome)];
    [self.view addGestureRecognizer:swipGesture];


}

//首页格局
- (void)Firstbuiding

{
  
    

    
    //2社保查询
    
    //1设置背景的颜色
    UIView *view1 = [[UIView alloc]init];
    view1.center = CGPointMake(self.view.right/3-15, self.view.frame.size.height*0.7);
    view1.bounds = CGRectMake(0, 0, 80 , 80);
    view1.backgroundColor = kDefaultColor;
    view1.layer.cornerRadius = 40;
    [_contentView addSubview:view1];
    
    //2设置按钮
    
    UIButton *button1 = [[UIButton alloc] init];
    button1.center = view1.center;
    button1.bounds = CGRectMake(0, 0, 78, 78);
    button1.backgroundColor = [UIColor whiteColor];
    button1.layer.cornerRadius = 40;
    [button1 addTarget:self action:@selector(openSocialSecurity) forControlEvents:(UIControlEventTouchUpInside)];
    [_contentView addSubview:button1];
    
    //添加图片到按钮上
    UIImageView *imageView2 =[[UIImageView alloc] init];
    imageView2.frame = CGRectMake(25, 20, 25, 30);
    imageView2.image = [UIImage imageNamed:@"social_security.png"];
    [button1 addSubview:imageView2];
    
    //添加text
    UILabel *label1 = [[UILabel alloc] init];
    label1.font = [UIFont systemFontOfSize:12];
    label1.center = CGPointMake(imageView2.center.x, imageView2.bottom+10);
    label1.bounds =CGRectMake(0, 0, 50, 15);
    label1.text = @"社保查询";
    label1.textColor = [UIColor blackColor];
    label1.textAlignment =  NSTextAlignmentCenter;
    [button1 addSubview:label1];
    
    //3添加商保试算
    
    //添加背景图片
    UIView *view2 = [[UIView alloc] init];
    view2.center = CGPointMake(2*self.view.right/3+15, view1.center.y);
    view2.bounds = CGRectMake(0, 0, 80, 80);
    view2.backgroundColor = kDefaultColor;
    view2.layer.cornerRadius = 40;
    [_contentView addSubview:view2];
    
   //添加一个按钮
    UIButton *button2 = [[UIButton alloc] init];
    button2.center = view2.center;
    button2.bounds = CGRectMake(0, 0, 78, 78);
    button2.backgroundColor = [UIColor whiteColor];
    button2.layer.cornerRadius = 40 ;
    [button2 addTarget:self action:@selector(openBusiness) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:button2];
   
    //添加图片
    UIImageView *imageView3 = [[UIImageView alloc] init];
    imageView3.frame = CGRectMake(25, 20, 25, 30);
    imageView3.image = [UIImage imageNamed:@"business_caculater.png"];
    [button2 addSubview:imageView3];

    UILabel *label2 = [[UILabel alloc] init];
    label2.center = CGPointMake(imageView3.center.x, imageView3.bottom+10);
    label2.bounds = CGRectMake(0, 0, 50, 15);
    label2.font = [UIFont systemFontOfSize:12];
    label2.text = @"商保试算";
    label2.textAlignment = NSTextAlignmentCenter;
    label2.textColor = [UIColor  blackColor];
    [button2 addSubview:label2];
    
    UIButton *buttonHelp = [[UIButton alloc] init];
    buttonHelp.center = CGPointMake(self.view.right/2, self.view.frame.size.height*0.9);
    buttonHelp.bounds = CGRectMake(0, 0, 160, self.view.frame.size.height/5-50);
    buttonHelp.layer.cornerRadius = 20;
    buttonHelp.backgroundColor = kDefaultColor;
    [buttonHelp setTitle:@"保险帮帮忙" forState:(UIControlStateNormal)];
    [buttonHelp addTarget:self action:@selector(openSecurityHelp) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview: buttonHelp];
    
}
- (void)addLeftView
{
    _personalController = [[PersonalTableViewController alloc] init];
    _personalController.view.frame = CGRectMake(0, 0, 200, self.view.frame.size.height);
    _personalController.delegate = self;
    [_scrollview addSubview:_personalController.view];
    
    
}

- (void)openPersonal
{
    //跳转到个人中心
   [UIView animateWithDuration:0.2 animations:^{
       if (_scrollview.contentOffset.x == 200) {
           [_scrollview scrollRectToVisible:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) animated:YES];
           [mbControl  setHidden:NO];
       }else
       {
           [mbControl setHidden:YES];
            [_scrollview scrollRectToVisible:CGRectMake(200, 0, self.view.frame.size.width, self.view.frame.size.height) animated:YES];
       }
   }];
    
}


#pragma mark- 打开社保查询
//跳转到社保查询
- (void)openSocialSecurity
{
    SocialViewController *socialView = [[SocialViewController alloc] init];
    socialView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:socialView animated:YES completion:^{
        
    }];
}
#pragma mark- 打开商保试算
//跳转到商保试算
- (void)openBusiness
{
    BusinessViewController *businessView = [[BusinessViewController alloc] init];
    businessView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:businessView animated:YES completion:^{
        
    }];

}
#pragma mark-添加点击事件
- (void)openSecurityHelp
{
    
}
- (void)backHome
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma mark - UIScrollView 代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //代理方法控制页面的滚动
    [UIView animateWithDuration:0.5 animations:^{
        if (scrollView.contentOffset.x == 200) {//去除占位视图
            [mbControl setHidden:YES];
            
        } else{//添加占位视图
            [mbControl setHidden:NO];
           
        }
    }];
    
}
- (void)openDetailContent:(UIViewController *)controller
{
    
    [self presentViewController:controller animated:YES completion:^{
        
    }];
}



@end
