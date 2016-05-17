//
//  DetailViewController.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/11.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
{
    UIScrollView *_scrollView;
}


@end

@implementation DetailViewController

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
    //添加底部滚动视图
    [self addScrollView];
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
    title.text = @"健康保险计划";
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

//添加底部的滚动视图
 - (void)addScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 44, self.view.width,self.view.height-44);
    scrollView.contentSize = CGSizeMake(self.view.width, 600);
    scrollView.showsVerticalScrollIndicator = NO;
    _scrollView = scrollView;
    [self.view addSubview:_scrollView];
    
}

//添加内容
- (void)addcontentView
{
    
    //1添加标签
    
    UILabel *headerLabel = [[UILabel alloc] init];
    headerLabel.text = @"友邦全佑一生七合一保险";
    headerLabel.frame = CGRectMake(0, 0, self.view.width, 40);
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.font = [UIFont systemFontOfSize:18];
    [_scrollView addSubview: headerLabel];
    
   //2保障内容
    UIView *view1 = [[UIView alloc] init];
    view1.frame = CGRectMake(0, headerLabel.bottom +10, self.view.width, 120);
    view1.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview: view1];
    
    UILabel *title = [[UILabel alloc] init];
    title.frame = CGRectMake(10, 10, self.view.width, 30);
    title.text = @"保障范围:";
    title.font = [UIFont systemFontOfSize:16];
    title.textColor = [UIColor blackColor];
    [view1 addSubview:title];
   
    NSArray *array = [NSArray arrayWithObjects:@"身故保障20万",@"意外身故40万" ,@"全残保障20万",@"重疾保障20万",@"意外残疾40万",nil];
    for (int i= 0; i<array.count; i++) {
        UILabel *label = [[UILabel alloc] init];
        CGFloat width =(self.view.width - 10*4)/3;
        CGFloat height = 30 ;
        label.frame = CGRectMake(10 +i%3*(width +10), 40+i/3*(height+10), width, height);
        label.font = [UIFont systemFontOfSize:14];
        label.backgroundColor = [UIColor colorWithRed:0.9882 green:0.7373 blue:0.1804 alpha:1];
        label.textColor = [UIColor whiteColor];
        label.text = array[i];
        label.textAlignment = NSTextAlignmentCenter;
        [view1 addSubview:label];
    }
    
    UIView *view2 = [[UIView alloc] init];
    view2 .frame = CGRectMake(0, view1.bottom+10, self.view.width, 120);
    view2.backgroundColor = [UIColor whiteColor ];
    [_scrollView addSubview:view2];
    
    NSArray * arrayLabel = [NSArray arrayWithObjects:@"保障期限:",@"缴费期限:",@"保障期限:",@"每年保费:", nil];
    NSArray *arrayContentLabel = [NSArray arrayWithObjects:@"终身",@"2015年12月12日",@"终身",@"7000元", nil];
    
    for (int i = 0; i<4;i++) {
        UILabel *label =[[UILabel alloc] init];
        label.frame = CGRectMake(10, 10+i*25, 100, 25);
        label.text = arrayLabel[i];
        label.font = [UIFont systemFontOfSize: 18];
        label.textColor = [UIColor blackColor];
        [view2 addSubview:label];
        
        UILabel *contentLable = [[UILabel alloc] init];
        contentLable.frame = CGRectMake(label.right, label.top, label.width+10, 25);
        contentLable.text = arrayContentLabel[i];
        contentLable.font = label.font;
        contentLable.textColor = label.textColor;
        [view2 addSubview:contentLable];
        
        
    }
    
    //3备注
    
    UIView *view3 = [[UIView alloc] init];
    view3.frame = CGRectMake(0, view2.bottom + 10, self.view.width , 90);
    view3.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:view3];
    
    UILabel *content = [[UILabel alloc] init];
    content.frame = CGRectMake(10, 10, self.view.width -20, 40);
    content.text = @"备注：老年护理金500/月老年护理金500/月老年护理金500/月老年护理金500/月老年护理金500/月老年护理金500/月老年护理金500/月老年护理金500/月";
    content.font = [UIFont systemFontOfSize:10];
    content.textColor = [UIColor blackColor];
    content.alpha = 0.6;
    content.numberOfLines = 0;
    [view3 addSubview:content];
    
    //3.1添加下拉按钮
    
    UIButton *button = [[UIButton alloc] init ] ;
    button.center = CGPointMake(self.view.width/2, content.bottom+20);
    button.bounds = CGRectMake(0, 0, 30, 30);
    [button setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"down.png"] forState: UIControlStateSelected];
    [button addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [view3 addSubview:button];
    
    //4添加代理人信息
    UIView *view4 = [[UIView alloc] init];
    view4.frame = CGRectMake(0, view3.bottom +10, self.view.width, 110);
    view4.backgroundColor = kColor(1.0000, 0.9922, 0.8784, 1);
    [_scrollView addSubview: view4];
    
    //添加视图
    UIImageView *delegateImageview = [[UIImageView alloc] init];
    delegateImageview.frame = CGRectMake(10, 10, 90, 90);
    delegateImageview.image = [UIImage imageNamed:@"personal_picture.png"];
    [view4 addSubview:delegateImageview];
    
    UILabel *delegateLabel = [[UILabel alloc] init];
    delegateLabel.frame = CGRectMake(delegateImageview.right +20, 20, 50, 20);
    delegateLabel.text = @"代理人:";
    delegateLabel.font = [UIFont systemFontOfSize:14];
    delegateLabel.textColor = [UIColor blackColor];
    [view4 addSubview:delegateLabel];
    
    UILabel *delegatecontentlabel = [[UILabel alloc] init];
    delegatecontentlabel.frame = CGRectMake(delegateLabel.right, 20, 50, 20);
    delegatecontentlabel.text = @"马大嘴";
    delegatecontentlabel.font = delegateLabel.font;
    delegatecontentlabel.textColor = delegateLabel.textColor;
    delegatecontentlabel.alpha = 0.5;
    [view4 addSubview:delegatecontentlabel];
    
    for (int i = 0; i <5; i++) {
        UIImageView *starImage = [[UIImageView alloc] init];
        starImage.frame = CGRectMake(delegateImageview.right + i*30, delegatecontentlabel.bottom+10, 25, 25);
        [view4 addSubview:starImage];
        if (i<=2)
        {
            starImage.image = [UIImage imageNamed:@"star_dig_cumment.png"];
        }else
            starImage.image = [UIImage imageNamed:@"star_bury_cumment.png"];
    }
    
    //添加电话
    UIImageView *cellPhone = [[UIImageView alloc] init];
    cellPhone.frame = CGRectMake(view4.right- 60, 30, 45, 45);
    cellPhone.image = [UIImage imageNamed:@"cellphone.png"];
    [view4 addSubview:cellPhone];
    
    
    //5添加搜索框
    
    UIView *view5 = [[UIView alloc] init];
    view5.frame = CGRectMake(0, view4.bottom +10, self.view.width, 60);
    view5.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview: view5];
    
    
    UITextField *textFeild = [[UITextField alloc] init];
    textFeild.frame = CGRectMake(10, 10, self.view.width -80, 40);
    textFeild.borderStyle = UITextBorderStyleRoundedRect;
    textFeild.delegate = self;
    [view5 addSubview:textFeild];
    
    //添加按钮
    UIView *view6 = [[UIView alloc] init];
    view6.frame =CGRectMake(textFeild.right+10, textFeild.top, 50, 40);
    view6.backgroundColor = kDefaultColor;
    view6.layer.cornerRadius =15;
    [view5 addSubview:view6];
    
    UIButton *askButton = [UIButton buttonWithType:UIButtonTypeCustom];
    askButton.center = view6.center;
    askButton.bounds = CGRectMake(0, 0, 48, 38);
    askButton.layer.cornerRadius = 15;
    askButton.backgroundColor = [UIColor whiteColor];
    [askButton setTitle:@"提问" forState:UIControlStateNormal];
    [askButton setTitleColor:kDefaultColor forState:UIControlStateNormal];
    askButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [view5 addSubview:askButton];
    
//    UIButton *askButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    askButton.frame=CGRectMake(textFeild.right+10, textFeild.top, 50, 40);
//    askButton.layer.cornerRadius = 16;
//    askButton.backgroundColor = [UIColor whiteColor];
//    [askButton setTitle:@"提问" forState:UIControlStateNormal];
//    [askButton setTitleColor:kDefaultColor forState:UIControlStateNormal];
//    askButton.titleLabel.font = [UIFont systemFontOfSize:15];
//    [view5 addSubview:askButton];
//    //2.设置边框的属性
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0.9725, 0.3961, 0.1333, 1});
//    [askButton.layer setCornerRadius:askButton.height/2];
//    [askButton.layer setBorderWidth:1];
//    [askButton.layer setBorderColor:colorref];
//    [view5 addSubview:askButton];

}

- (void)backHome
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

- (void)change:(UIButton *)button;
{
    button.selected = !button.selected;
    
}

#pragma mark - UITextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _scrollView.frame = CGRectMake( 0, -160,_scrollView.width , _scrollView.height);
    }
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _scrollView.frame = CGRectMake(0, 44, _scrollView.width, _scrollView.height);
     
}

@end
