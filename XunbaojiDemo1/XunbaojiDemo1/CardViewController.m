//
//  CardViewController.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/10.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "CardViewController.h"
#define kLabelFont [UIFont systemFontOfSize:14]
@interface CardViewController ()


{
    UIView *_view;
    UITextField *_textField;
}
@end

@implementation CardViewController

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
    [self addHeaderView];
    //添加视图
    [self addContentView];

    //添加搜索
    [self addsearch];
    
    //添加表示图
    [self addTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    }

//添加头部视图
- (void)addHeaderView
{
    //创建头部视图
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, self.view.width, 44);
    headerView.backgroundColor = kDefaultColor;
    [self.view addSubview:headerView];
    //添加文字
    UILabel *label1= [[UILabel alloc] init];
    label1.frame = CGRectMake( 60, 15, 200, 20);
    label1.font = [UIFont systemFontOfSize:20];
    label1.text = @"名片";
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
    
    
}

//添加视图
-(void)addContentView
{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 44, self.view.width, 180);
    view.backgroundColor = [UIColor whiteColor];
    _view  = view;
    [self.view addSubview:view];
    
    //添加头部图片
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(10, 10, 100, 100);
    imageView.image = [UIImage imageNamed:@"personal_picture.png"];
    [_view addSubview:imageView];
    
    //添加是否收藏
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(imageView.left, imageView.bottom +10, 100, 35);
    button.layer.cornerRadius = 15;
    button.backgroundColor = kDefaultColor;
    [button setTitle:@"不收藏" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [_view addSubview:button];
    
    for (int i = 0; i<6; i++) {
        //图片背景
        UIImageView *imageView1 = [[UIImageView alloc] init];
        imageView1.frame = CGRectMake(imageView.right+10, 10+i*20, 15, 15);
        [_view addSubview:imageView1];
        
        //标签
        UILabel *label = [[UILabel alloc] init];
        label.font = kLabelFont;
        [_view addSubview: label];
        switch (i) {
            case 0:
                label.frame = CGRectMake(imageView1.right, imageView1.top, 40, 20);
                label.text = @"姓名:";
                break;
            case 1:
                label.frame = CGRectMake(imageView1.right, imageView1.top, 40, 20);
                label.text = @"机构:";
                break;
            case 2:
                label.frame = CGRectMake(imageView1.right, imageView1.top, 65, 20);
                label.text = @"星级服务:";
                break;
            case 3:
                label.frame = CGRectMake(imageView1.right, imageView1.top, 50, 20);
                label.text = @"好评数:";
                break;
            case 4:
                label.frame = CGRectMake(imageView1.right, imageView1.top, 65, 20);
                label.text = @"已做方案:";
                break;
    
            default:
                label.frame = CGRectMake(imageView1.right, imageView1.top, 65, 20);
                label.text = @"被收藏数:";
                break;
        }
        
        //内容
        UILabel *contentlabel = [[UILabel alloc] init];
        contentlabel.frame = CGRectMake(label.right, label.top, 80, 20);
        contentlabel.font = kLabelFont;
        [_view addSubview:contentlabel];
        switch (i) {
            case 0:
                contentlabel.text = @"马大嘴";
                contentlabel.textColor = kColor(0, 0, 0, 0.8);
                break;
            case 1:
                contentlabel.text = @"平安保险";
                contentlabel.textColor = kColor(0, 0, 0, 0.8);
                break;
            case 2:
                contentlabel.text = @"3星";
                contentlabel.textColor = kColor(0, 0, 0, 0.8);
                break;
            case 3:
                contentlabel.text = @"20";
                contentlabel.textColor = kDefaultColor;
                break;
            case 4:
                contentlabel.text = @"30";
                contentlabel.textColor = kDefaultColor;
                break;
 
            default:
                contentlabel.text = @"20";
                contentlabel.textColor = kDefaultColor;
                break;
        }
        
    }
    
}


//添加搜索框
- (void)addsearch
{
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(10, _view.bottom +10, self.view.width-80, 30);
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"我的问题";
    textField.delegate = self;
    _textField = textField;
    [self.view addSubview:_textField];
    
    //添加按钮
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake(_textField.right+10, _textField.top, _textField.height, _textField.height);
    searchButton.layer.cornerRadius = 15;
    [searchButton setTitle:@"GO" forState:UIControlStateNormal];
    searchButton.backgroundColor = kDefaultColor;
    [self.view addSubview:searchButton];

    
}

//添加表示图

- (void)addTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, _textField.bottom +10, self.view.width, self.view.height - _textField.bottom -10);
    tableView.tableHeaderView.backgroundColor = kGrayColor;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
}


#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_textField resignFirstResponder];
    return YES;
}


- (void)backHome
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 10;
    }else return 0;
}



#pragma mark - UITableView dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    if (indexPath.section == 0)
    {
        if (indexPath.row ==0)
        {
            cell.textLabel.text = @"最新问答:";
        }
        else if(indexPath.row == 1)
        {
            cell.textLabel.text = @"一是事业单位养老保险";
        }
        else
        {
           cell.textLabel.text = @"二是养老保险的好处";
            
        }
        
        
    }
    else
    {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"最热问答:";
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text =@"一是事业单位养老保险";
        }
        else
        {
            cell.textLabel.text = @"二是养老保险的好处";
            
        }
    }
    
    return cell;
}


@end
