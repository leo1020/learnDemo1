//
//  BusinessViewController.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/13.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "BusinessViewController.h"
#import "MessageBookViewController.h"
#import "SecuritySearchViewController.h"

@interface BusinessViewController ()
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    UIButton *_nextButton;
}
@end

@implementation BusinessViewController

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
    //添加分页
    [self addPageView];
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
    title.text = @"社保查询－基本信息";
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
    [bindingButton setTitle:@"信息簿" forState:UIControlStateNormal];
    bindingButton.backgroundColor = kDefaultColor;
    [bindingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bindingButton addTarget:self action:@selector(bindingMobile) forControlEvents:UIControlEventTouchUpInside];
    bindingButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [ headerView addSubview:bindingButton];
    
    
    
}

//添加内容

- (void)addcontentView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(50, self.view.top+70, self.view.width-100, 220);
    scrollView.contentSize = CGSizeMake((self.view.width-100)*6, 220);
    scrollView.pagingEnabled = YES;
    scrollView.delegate =self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    _scrollView = scrollView;
    [self.view addSubview:_scrollView];
    
    //1添加背景框
    
    UIView *view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height);
    view1.backgroundColor = kDefaultColor;
    view1.layer.cornerRadius =8;
    [_scrollView addSubview:view1];
    
    //1.1背景框
    UIView *backView = [[UIView alloc] init];
    backView.frame = CGRectMake(view1.left+1, view1.top+1, view1.width-2, view1.height-2);
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.cornerRadius = 8;
    [_scrollView addSubview:backView];
    
    //给谁保
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(view1.left + 80, view1.top +60, 60, 25);
    label1.text = @"给谁保";
    label1.tintColor = [UIColor blackColor];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:16];
    [backView addSubview:label1];
    
    //1.3
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(50, label1.bottom+25, backView.width -100, 40);
    imageView.image = [UIImage imageNamed:@"card.png"];
    [backView addSubview:imageView];
    
    //出生年月
    //2.1
    UIView *view2 = [[UIView alloc] init];
    view2.frame = CGRectMake(view1.right, view1.top, scrollView.frame.size.width, scrollView.frame.size.height);
    view2.backgroundColor = kDefaultColor;
    view2.layer.cornerRadius =8;
    [_scrollView addSubview:view2];
    
    //2.1背景框
    UIView *backView2 = [[UIView alloc] init];
    backView2.frame = CGRectMake(view2.left+1, view2.top+1, view2.width-2, view2.height-2);
    backView2.backgroundColor = [UIColor whiteColor];
    backView2.layer.cornerRadius = 8;
    [_scrollView addSubview:backView2];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(50, view2.top +20, 120, 25);
    label2.text = @"出生年月";
    label2.tintColor = [UIColor blackColor];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:16];
    [backView2 addSubview:label2];
    
    //2.3
    UIImageView *imageView2 = [[UIImageView alloc] init];
    imageView2.frame = CGRectMake(50, label2.bottom+10, backView2.width -100, 150);
    imageView2.image = [UIImage imageNamed:@"year.png"];
    [backView2 addSubview:imageView2];

    //3添加背景框
    
    UIView *view3 = [[UIView alloc] init];
    view3.frame = CGRectMake(view2.right, view2.top, scrollView.frame.size.width, scrollView.frame.size.height);
    view3.backgroundColor = kDefaultColor;
    view3.layer.cornerRadius =8;
    [_scrollView addSubview:view3];
    
    //3.1背景框
    UIView *backView3 = [[UIView alloc] init];
    backView3.frame = CGRectMake(view3.left+1, view3.top+1, view3.width-2, view3.height-2);
    backView3.backgroundColor = [UIColor whiteColor];
    backView3.layer.cornerRadius = 8;
    [_scrollView addSubview:backView3];
    
    //3
    UILabel *label3 = [[UILabel alloc] init];
    label3.frame = CGRectMake(80, view3.top +60, 80, 25);
    label3.text = @"居住地";
    label3.tintColor = [UIColor blackColor];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.font = [UIFont systemFontOfSize:16];
    [backView3 addSubview:label3];
    
    //3.3
    UIImageView *imageView3 = [[UIImageView alloc] init];
    imageView3.frame = CGRectMake(50, label3.bottom+25, backView3.width -100, 40);
    imageView3.image = [UIImage imageNamed:@"card.png"];
    [backView3 addSubview:imageView3];
    //4添加背景框
    
    UIView *view4 = [[UIView alloc] init];
    view4.frame = CGRectMake(view3.right, view3.top, scrollView.frame.size.width, scrollView.frame.size.height);
    view4.backgroundColor = kDefaultColor;
    view4.layer.cornerRadius =8;
    [_scrollView addSubview:view4];
    
    //4.1背景框
    UIView *backView4 = [[UIView alloc] init];
    backView4.frame = CGRectMake(view4.left+1, view4.top+1, view4.width-2, view4.height-2);
    backView4.backgroundColor = [UIColor whiteColor];
    backView4.layer.cornerRadius = 8;
    [_scrollView addSubview:backView4];
    
    //4
    UILabel *label4 = [[UILabel alloc] init];
    label4.frame = CGRectMake(80, view4.top +60, 60, 25);
    label4.text = @"职业";
    label4.tintColor = [UIColor blackColor];
    label4.textAlignment = NSTextAlignmentCenter;
    label4.font = [UIFont systemFontOfSize:16];
    [backView4 addSubview:label4];
    
    //4.3
    UIImageView *imageView4 = [[UIImageView alloc] init];
    imageView4.frame = CGRectMake(50, label4.bottom+25, backView4.width -100, 40);
    imageView4.image = [UIImage imageNamed:@"card.png"];
    [backView4 addSubview:imageView4];

    //5
    //1添加背景框
    
    UIView *view5 = [[UIView alloc] init];
    view5.frame = CGRectMake(view4.right, view4.top, scrollView.frame.size.width, scrollView.frame.size.height);
    view5.backgroundColor = kDefaultColor;
    view5.layer.cornerRadius =8;
    [_scrollView addSubview:view5];
    
    //5.1背景框
    UIView *backView5 = [[UIView alloc] init];
    backView5.frame = CGRectMake(view5.left+1, view5.top+1, view5.width-2, view5.height-2);
    backView5.backgroundColor = [UIColor whiteColor];
    backView5.layer.cornerRadius = 8;
    [_scrollView addSubview:backView5];
    
    //是否有社保
    UILabel *label5 = [[UILabel alloc] init];
    label5.frame = CGRectMake( 50, view5.top +60, 120, 25);
    label5.text = @"是否有社保";
    label5.tintColor = [UIColor blackColor];
    label5.textAlignment = NSTextAlignmentCenter;
    label5.font = [UIFont systemFontOfSize:16];
    [backView5 addSubview:label5];
    
    //5.3
    UIImageView *imageView5 = [[UIImageView alloc] init];
    imageView5.frame = CGRectMake(50, label5.bottom+25, backView5.width -100, 40);
    imageView5.image = [UIImage imageNamed:@"security.png"];
    [backView5 addSubview:imageView5];

    //6
    //6添加背景框
    
    UIView *view6 = [[UIView alloc] init];
    view6.frame = CGRectMake(view5.right, view5.top, scrollView.frame.size.width, scrollView.frame.size.height);
    view6.backgroundColor = kDefaultColor;
    view6.layer.cornerRadius =8;
    [_scrollView addSubview:view6];
    
    //6.1背景框
    UIView *backView6 = [[UIView alloc] init];
    backView6.frame = CGRectMake(view6.left+1, view6.top+1, view6.width-2, view6.height-2);
    backView6.backgroundColor = [UIColor whiteColor];
    backView6.layer.cornerRadius = 8;
    [_scrollView addSubview:backView6];
    
    //给谁保
    UILabel *label6 = [[UILabel alloc] init];
    label6.frame = CGRectMake( 80, view5.top +60, 80, 25);
    label6.text = @"年收入";
    label6.tintColor = [UIColor blackColor];
    label6.textAlignment = NSTextAlignmentCenter;
    label6.font = [UIFont systemFontOfSize:16];
    [backView6 addSubview:label6];
    
    //6.3
    UIImageView *imageView6 = [[UIImageView alloc] init];
    imageView6.frame = CGRectMake(50, label5.bottom+10, backView5.width -100, 40);
    imageView6.image = [UIImage imageNamed:@"card.png"];
    [backView6 addSubview:imageView6];
    
    //添加最后一页的按钮
    UIButton *nextButton = [[UIButton alloc] init];
    nextButton.frame = CGRectMake(60, self.view.bottom-50, self.view.width - 120, 30);
    nextButton.backgroundColor = kDefaultColor;
    [nextButton setTitle:@"保存&下一步" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextButton.titleLabel.font = [UIFont systemFontOfSize:20];
    nextButton.layer.cornerRadius =15;
    [nextButton addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    _nextButton = nextButton;
   
}
//添加分页
- (void)addPageView
{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.center = CGPointMake(self.view.center.x,_scrollView.bottom+10);
    pageControl.bounds = CGRectMake(0, 0, self.view.width, 20);
    pageControl.numberOfPages = 6;
    pageControl.userInteractionEnabled = YES;
    pageControl.currentPage = _scrollView.frame.origin.x/(self.view.width-80);
    pageControl.pageIndicatorTintColor = kGrayColor;
    pageControl.currentPageIndicatorTintColor = kDefaultColor;
    [pageControl addTarget:self action:@selector(scrollPage) forControlEvents:UIControlEventTouchUpInside];
    pageControl.hidesForSinglePage = NO;
    _pageControl = pageControl;
    [self.view addSubview:_pageControl];
 }

- (void)backHome
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)next
{
    SecuritySearchViewController *securitySearchView = [[SecuritySearchViewController alloc]init];
    [self presentViewController:securitySearchView animated:YES completion:^{
        
    }];
    
}
- (void)scrollPage
{
    [UIView  animateWithDuration:0.2 animations:^{
       
        CGRect frame = _scrollView.frame;
        frame.origin.x = _pageControl.currentPage*220;
        [_scrollView scrollRectToVisible: frame animated:YES];
    }];
    
    if (_pageControl.currentPage ==5) {
        [self.view addSubview: _nextButton];
    }else
    {
        [_nextButton removeFromSuperview];
    }
}


- (void)bindingMobile
{
    MessageBookViewController *messageView = [[MessageBookViewController alloc] init];
    [self presentViewController:messageView animated:YES completion:^{
    
    }];
}
#pragma  mark - UIScrollView delegate
//控制page的跳转
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = _scrollView.contentOffset.x/220;
    if (_pageControl.currentPage == 5) {
        [self.view addSubview:_nextButton];
    }else
    {
        [_nextButton removeFromSuperview];
    }
    
}
@end
