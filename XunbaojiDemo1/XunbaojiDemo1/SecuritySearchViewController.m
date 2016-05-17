//
//  SecuritySearchViewController.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/15.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "SecuritySearchViewController.h"
#import "OtherViewController.h"
#import "SaveExpertViewController.h"

@interface SecuritySearchViewController ()

{
    UITextField * _textField;
}
@end

@implementation SecuritySearchViewController

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
    self.view.backgroundColor  = kGrayColor;
    [super viewDidLoad];
   //添加头部视图
    [self addheaderView];
    //添加视图内容
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
    title.text = @"保险查询－险种试算";
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

//添加视图内容
- (void)addcontentView
{
    for (int i = 0; i <4; i++) {
        
        UIView *view1 = [[UIView alloc] init];
        view1.frame = CGRectMake(0, 55+i*57, self.view.width, 60);
        view1.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:view1];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(10, 10, 180, 20);
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:14];
        [view1 addSubview:label];
        
        UITextField * textField = [[UITextField alloc] init];
        textField.frame = CGRectMake(label.right+10, 10, 100, 20);
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.tag = 10 +i;
        textField.delegate = self;
        textField.backgroundColor = [UIColor whiteColor];
        _textField = textField;
        [view1 addSubview:_textField];
        
        UISlider *slider = [[UISlider alloc] init];
        slider.frame = CGRectMake(10, label.bottom +8, view1.width - 20, 20);
        slider.minimumTrackTintColor = kDefaultColor;
        slider.maximumTrackTintColor = kGrayColor;
        slider.tag = 20 +i;
        [slider  setThumbImage:[UIImage imageNamed:@"slider_thumb_background.png"] forState:UIControlStateNormal];
        [view1 addSubview:slider];
        
        switch (i) {
            case 0:
                label.text = @"养老补充: 退休后每月可领:";
                break;
            case 1:
                label.text = @"意外补充:";
                break;
            case 2:
                label.text = @"重疾补充:";
                break;

            default:
                
                label.text = @"教育金补充:";
                
                
                break;
        }
        //添加标签
        UIButton *otherButton = [[UIButton alloc] init];
        otherButton.frame = CGRectMake(0,view1.bottom +10, 100, 50);
        otherButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [otherButton setTitle:@"其他险种？" forState:UIControlStateNormal];
        [otherButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [otherButton addTarget:self action:@selector(otherThings) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:otherButton];
        
       

    }
    
    //添加底部标签
    UIView * view2 = [[UIView alloc] init];
    view2.frame = CGRectMake(0, self.view.height - 120, self.view.width, 50);
    view2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view2];
    
    UILabel *footerLabel1 = [[UILabel alloc] init];
    footerLabel1.frame = CGRectMake(10, 15 , 100, 20);
    footerLabel1.font = [UIFont systemFontOfSize:18];
    footerLabel1.backgroundColor = [UIColor whiteColor];
    footerLabel1.text = @"计算价格:";
    footerLabel1.textColor = [UIColor blackColor];
    [view2 addSubview:footerLabel1];
    
    UILabel *footerLabel2 = [[UILabel alloc] init];
    footerLabel2.frame = CGRectMake(footerLabel1.right +20,footerLabel1.top, 100, 20);
    footerLabel2.font = footerLabel1.font;
    footerLabel2.backgroundColor = [UIColor whiteColor];
    footerLabel2.text = @"9999: 00";
    footerLabel2.textColor = kDefaultColor;
    [view2 addSubview:footerLabel2];
    
    UILabel *footerLabel3 = [[UILabel alloc] init];
    footerLabel3.frame = CGRectMake(footerLabel2.right +50, footerLabel2.top , 50, 20);
    footerLabel3.font = [UIFont systemFontOfSize:18];
    footerLabel3.backgroundColor = [UIColor whiteColor];
    footerLabel3.text = @"元／年";
    footerLabel3.textColor = [UIColor blackColor];
    [view2 addSubview:footerLabel3];
    
    
    UIButton *nextButton = [[UIButton alloc] init];
    nextButton.frame = CGRectMake(100, view2.bottom +25, 120, 30);
    nextButton.backgroundColor = kDefaultColor;
    nextButton.layer.cornerRadius = 15;
    [nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [nextButton addTarget:self action:@selector(nextThings) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];

    
}

- (void)backHome
{
    [self dismissViewControllerAnimated:YES completion:^{
      
    }];
}
- (void)otherThings
{
    OtherViewController *otherThings = [[OtherViewController alloc] init];
    [self presentViewController:otherThings animated:YES completion:^{
        
    }];
}

-(void)nextThings
{
    SaveExpertViewController *saveExperView = [[SaveExpertViewController alloc] init];
    [self presentViewController:saveExperView animated:YES completion:^{
        
    }];
}

#pragma  mark - UITextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    UITextField *Field = (UITextField *)[self.view viewWithTag:textField.tag +1];
    switch (textField.tag) {
        case 10:
        case 11:
        case 12:
            [Field becomeFirstResponder];
            break;
        default:
            [Field resignFirstResponder ];
            [self nextThings];
        break;
    }
    return YES;
}


@end
