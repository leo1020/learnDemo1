//
//  ExpertTableViewCell.h
//  XunbaojiDemo1
//
//  Created by 李游 on 15/12/9.
//  Copyright (c) 2015年 3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpertTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;//姓名标签
@property (nonatomic, strong) UILabel *name;//姓名
@property (nonatomic, strong) UILabel *starLabel;//星级服务
@property (nonatomic, strong) UILabel *star;//星级
@property (nonatomic, strong) UILabel *institutionLabel;//机构标签
@property (nonatomic, strong) UILabel *institution;//机构
@property (nonatomic, strong) UILabel *saveLabel;//收藏标签
@property (nonatomic, strong) UILabel *save;//收藏
@property (nonatomic, strong) UILabel *planLabel;//方案标签
@property (nonatomic, strong) UILabel *plan;//方案
@property (nonatomic, strong) UILabel *cummentLabel;//评论标签
@property (nonatomic, strong) UILabel *cumment;//评论

@end
