//
//  NotifiyViewCell.m
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/5.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import "NotifiyViewCell.h"

@implementation NotifiyViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _rightLabel = [[UILabel alloc] init];
        _lookUpLabel = [[UILabel alloc] init];
        _lineLabel  = [[UILabel alloc] init];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //0.设置contentView的背景
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    //1.设置contentView的大小
    self.contentView.frame = CGRectMake(10, 10, self.frame.size.width-20, self.frame.size.height-20);
    self.contentView.layer.cornerRadius = 6;
    
    //2.设置textlabel
    self.textLabel.frame = CGRectMake(10, 10, 150, 20);
    
    //3.设置detaillabel
    self.detailTextLabel.frame = CGRectMake(self.textLabel.left, self.textLabel.bottom+10, self.contentView.frame.size.width-20, self.contentView.frame.size.height-80);
    
    //4.设置rightlabel
    _rightLabel.frame = CGRectMake(self.contentView.frame.size.width-50, 10, 50, 20);
    [self.contentView addSubview:_rightLabel];
    
    //5.设置lookUpLabel
    _lookUpLabel.frame = CGRectMake(self.textLabel.left, self.contentView.frame.size.height-30, 35, 20);
    [self.contentView addSubview:_lookUpLabel];
    
    //设置_lineLabel
    _lineLabel.frame = CGRectMake(_lookUpLabel.left, _lookUpLabel.bottom-2, _lookUpLabel.frame.size.width, 2);
    _lineLabel.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:_lineLabel];
}

@end