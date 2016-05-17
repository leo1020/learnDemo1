//
//  SocialViewController.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/13.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "SocialViewController.h"

@interface SocialViewController ()

{
    UILabel *_city2;//城市标签
    UITextField *_textField;//添加身份输入框
    UITextField *_secrtField;//密码输入框
    UITextField *_labelField;//验证码输入框
    NSArray *cityArray; //城市数组
    UIControl * _mbControl;//添加蒙板
    UIPickerView *_pickerView;//添加城市切换
    
}
@end

@implementation SocialViewController

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
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"City.plist" ofType:nil];
    cityArray = [NSArray arrayWithContentsOfFile:plistPath];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [super viewDidLoad];
    //添加头部视图
    [self addheaderView];
    //添加城市
    [self addcitycontentView];
    //添加验证内容信息
    [self addcontentView];
    //添加查询按钮
    [self  addsearcheView];
    [self addChangeCityView];
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
    title.text = @"社保查询";
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
- (void)addcitycontentView
{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 44, self.view.width, 60);
    [self.view addSubview:view];
    
    UILabel *city1 = [[UILabel alloc] init];
    city1.frame = CGRectMake(20, 10,40, 20);
    city1.text = @"城市:";
    city1.font = [UIFont systemFontOfSize:16];
    city1.textColor = kDefaultColor;
    [view addSubview:city1];
    
    UILabel *city2 = [[UILabel alloc] init];
    city2.frame = CGRectMake(city1.right, city1.top, 100, 20);
    city2.text = @"北京";
    city2.textColor = [UIColor blackColor];
    city2.font = [UIFont systemFontOfSize:16];
    _city2 = city2;
    [view addSubview:_city2];
    
    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    changeButton.frame = CGRectMake(view.right - 60, city2.top, 50, 20);
    changeButton.layer.cornerRadius = 10;
    changeButton.backgroundColor = kDefaultColor;
    [changeButton setTitle:@"切换" forState:UIControlStateNormal];
    [changeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    changeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [changeButton addTarget:self action:@selector(changeCity) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:changeButton];
    
    
}
//城市切换
- (void)addChangeCityView
{
   //添加萌版
    UIControl *mbControl = [[UIControl alloc] init];
    mbControl.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    mbControl.alpha = 0.6;
    mbControl.backgroundColor = [UIColor blackColor];
    [mbControl addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    _mbControl = mbControl;
    
    //城市切换
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.center = _mbControl.center;
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    _pickerView = pickerView;
    
}

#pragma  mark - UIPickerView dataSource
//选择其中拔轮的个数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

//选择器中某个拔轮的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return cityArray.count;
    }else
    {
        NSInteger row = [pickerView selectedRowInComponent:0];
        NSArray *array = [cityArray objectAtIndex:row];
        return [array[1]count];
    }

}
#pragma mark - UIPickerView delegate
//为选择器中的某个轮拔的行数提供显示数据
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = nil;
    if (component == 0) {
        title = cityArray [row][0];
    }else
    {
        NSInteger row1 = [pickerView selectedRowInComponent:0];
        title = cityArray[row1][1][row];
    }
    return title;
}
//选中选择器中的某个轮拔中的某行时调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSInteger row0 = [pickerView selectedRowInComponent:0];
    NSInteger row1 = [pickerView selectedRowInComponent:1];
    if (component == 0) {
        //刷新指定行以及列
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        NSInteger row1 = [pickerView selectedRowInComponent:1];
        NSArray *temp = [cityArray objectAtIndex:row0];
        _city2.text = temp[1][row1];
    }else
    {
        NSArray *temp = [cityArray objectAtIndex:row0];
        _city2.text = temp[1][row1];
    }
}


//添加验证内容信息
- (void)addcontentView
{
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame =CGRectMake(10,110, self.view.width - 20, 150);
    imageView .image = [UIImage imageNamed:@"blank.gif"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview: imageView];
    
    //添加身份输入框
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(imageView.left +10, 10, imageView.width-40, 35);
    textField.font = [UIFont systemFontOfSize:16];
    textField.placeholder = @"请输入您的身份证号码:";
    textField.delegate = self;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField = textField;
    [imageView addSubview:_textField];
    
    //添加密码框
    
    UITextField *secrtField = [[UITextField alloc] init];
    secrtField.frame = CGRectMake(imageView.left+10, textField.bottom+10, textField.width, 35);
    secrtField.font = textField.font;
    secrtField.borderStyle = UITextBorderStyleRoundedRect;
    secrtField.placeholder = @"请输入密码:";
    secrtField.secureTextEntry = YES;
    secrtField.delegate = self;
    _secrtField = secrtField;
    [imageView addSubview:_secrtField];
    
    UILabel *lable = [[UILabel alloc] init];
    lable.frame = CGRectMake(imageView.left +10, secrtField.bottom+15, 60, 25);
    lable.text = @"验证码:";
    lable.font = [UIFont systemFontOfSize:18];
    lable.textColor = [UIColor blackColor];
    [imageView addSubview:lable];
    
    UITextField *labelField = [[UITextField alloc] init];
    labelField.frame = CGRectMake(lable.right+30, secrtField.bottom+10, imageView.width-lable.width -30-40, 35);
    labelField.borderStyle = UITextBorderStyleRoundedRect;
    labelField.delegate =self ;
    _labelField = labelField;
    [imageView addSubview:_labelField];
    
    UIButton *learnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    learnButton.frame = CGRectMake(imageView.left+10, imageView.bottom+10, 160, 25);
    [learnButton setTitle:@"如何获取验证码？" forState:UIControlStateNormal];
    [learnButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    learnButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:learnButton];
    
}
//添加查询按钮
- (void)addsearcheView
{
    UIButton *searcheButton = [[UIButton alloc] init];
    searcheButton.frame = CGRectMake(60, self.view.bottom-120, 200, 40);
    [searcheButton setTitle:@"查询" forState:UIControlStateNormal];
    [searcheButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    searcheButton.backgroundColor =kDefaultColor;
    searcheButton.layer.cornerRadius =20;
    searcheButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [searcheButton addTarget:self action:@selector(serarchOther) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:searcheButton];
}


- (void)backHome
{
    [self dismissViewControllerAnimated:YES completion:^{
     }];
}


- (void)changeCity
{
    [UIView animateWithDuration:0.2 animations:^{
        [self.view addSubview:_mbControl];
        [self.view addSubview:_pickerView];
    }];
    
}

- (void)closeView
{
    [_mbControl removeFromSuperview];
    [_pickerView removeFromSuperview];
    
}
- (void)serarchOther
{
    
}

#pragma  mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if (textField == _textField) {
        [_textField becomeFirstResponder];
    }
    else if (textField == _secrtField)
    {
        [_secrtField becomeFirstResponder];
    }else{
    [textField resignFirstResponder];
    }
    return YES;
}


@end
