//
//  UIView+Fram.m
//  xunbaoji
//
//  Created by suxunbao on 14-10-28.
//  Copyright (c) 2014年 suxunbao. All rights reserved.
//

#import "UIView+Fram.h"

@implementation UIView (Fram)
@dynamic  left,right,top,bottom,width,height;

//左侧的坐标
- (CGFloat)left
{
    return self.frame.origin.x;
}

//右侧的坐标
- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

//顶部的坐标
- (CGFloat)top
{
    return self.frame.origin.y;
}

//底部的坐标
- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

//控件的宽
- (CGFloat)width
{
    return self.frame.size.width;
}

//控件的高
- (CGFloat)height
{
    return self.frame.size.height;
}
@end
