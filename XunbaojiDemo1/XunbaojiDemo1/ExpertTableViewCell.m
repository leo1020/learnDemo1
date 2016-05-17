//
//  ExpertTableViewCell.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/9.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "ExpertTableViewCell.h"
#define kLabelFont [UIFont systemFontOfSize:14]
@implementation ExpertTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _nameLabel = [[UILabel alloc] init];
        _name    = [[UILabel alloc] init];
        _starLabel = [[UILabel alloc] init];
        _star = [[UILabel alloc] init];
        _institutionLabel = [[UILabel alloc] init];
        _institution = [[UILabel alloc] init];
        _save = [[UILabel alloc] init];
        _saveLabel = [[UILabel alloc] init];
        _planLabel = [[UILabel alloc] init];
        _plan = [[UILabel alloc] init];
        _cumment= [[UILabel alloc] init];
        _cummentLabel = [[UILabel alloc] init];
    
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
  
    self.contentView.frame = CGRectMake(0, 10, self.width, self.height - 20);
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    //1个人图像
    self.imageView.frame = CGRectMake(10, 10, 100, 100);
    
    //2姓名
    _nameLabel.frame = CGRectMake(self.imageView.right, 10, 35, 20);
    _nameLabel.text = @"姓名:";
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.font = kLabelFont;
      [self.contentView addSubview:_nameLabel];
    
    _name.frame = CGRectMake(_nameLabel.right, _nameLabel.top, 60, 20);
    _name.text = @"马大嘴";
    _name.font = kLabelFont;
    _name.textColor = kColor(0, 0, 0, 0.8);
    [self.contentView addSubview:_name];

    
    //3星级服务
    _starLabel.frame = CGRectMake(_name.right, _name.top, 70, 20);
    _starLabel.text = @"星级服务:";
    _starLabel.textColor = [UIColor blackColor];
    _starLabel.font = kLabelFont;
    [self.contentView addSubview:_starLabel];

    
    _star.frame = CGRectMake(_starLabel.right, _starLabel.top, 25, 20);
    _star.text = @"3级";
    _star.font = kLabelFont;
    _star.textColor = kColor(0, 0, 0, 0.5);
    [self.contentView addSubview:_star];

    
    //4机构
    _institutionLabel.frame = CGRectMake(self.imageView.right, _nameLabel.bottom+10, 35, 20);
    _institutionLabel.text = @"机构:";
    _institutionLabel.font = kLabelFont;
    _institutionLabel.textColor = [UIColor blackColor];
    [self.contentView  addSubview: _institutionLabel];

    _institution.frame = CGRectMake(_institutionLabel.right, _institutionLabel.top, 60, 20);
    _institution.text = @"平安保险";
    _institution.font = kLabelFont;
    _institution.textColor = kColor(0, 0, 0, 0.5);
    [self.contentView addSubview:_institution];
    
    //5收藏
    _saveLabel.frame = CGRectMake(self.imageView.right, _institutionLabel.bottom +10, 65, 20);
    _saveLabel.text = @"被收藏数:";
    _saveLabel.textColor = [UIColor blackColor];
    _saveLabel.font = kLabelFont;
    [self.contentView addSubview:_saveLabel];
    
    _save.frame = CGRectMake(_saveLabel.right, _saveLabel.top, 30, 20);
    _save.text = @"500";
    _save.font = kLabelFont;
    _save.textColor = kDefaultColor;
    [self.contentView addSubview:_save];
    
    //6方案
    _planLabel.frame = CGRectMake(_save.right, _saveLabel.top, 70, 20);
    _planLabel.text = @"已做方案:";
    _planLabel.textColor = [UIColor blackColor];
    _planLabel.font = kLabelFont;
    [self.contentView addSubview:_planLabel];
    
    _plan.frame = CGRectMake(_planLabel.right, _saveLabel.top, 30, 20);
    _plan.text = @"500";
    _plan.font = kLabelFont;
    _plan.textColor = kDefaultColor;
    [self.contentView addSubview:_plan];
    
    //评论数
    _cummentLabel.frame = CGRectMake(self.imageView.right, _saveLabel.bottom +10, 50, 20);
    _cummentLabel.text = @"好评数:";
    _cummentLabel.textColor = [UIColor blackColor];
    _cummentLabel.font = kLabelFont;
    [self.contentView addSubview:_cummentLabel];
    
    _cumment.frame = CGRectMake(_cummentLabel.right, _cummentLabel.top, 30, 20);
    _cumment.text = @"500";
    _cumment.font = kLabelFont;
    _cumment.textColor = kDefaultColor;
    [self.contentView addSubview:_cumment];


}

@end
