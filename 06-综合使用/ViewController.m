//
//  ViewController.m
//  06-综合使用
//
//  Created by apple on 15/6/17.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *shopsView;
@end

@implementation ViewController

- (IBAction)add {
    /**************  一些常用的变量 begin **************/
    // 每一行的列数
    NSUInteger colsPerRow = 3;
    // 获得当前商品的索引
    NSUInteger index = self.shopsView.subviews.count;
    // 商品宽度
    CGFloat shopW = 70;
    // 商品高度
    CGFloat shopH = 90;
    /**************  一些常用的变量 end **************/
    
    
    /**************  计算X值 begin **************/
    // 求出列号
    NSUInteger col = index % colsPerRow;
    // 每一列之间的间距
    CGFloat xMargin = (self.shopsView.frame.size.width - colsPerRow * shopW) / (colsPerRow - 1);
    // 商品X
    CGFloat shopX = (shopW + xMargin) * col;
    /**************  计算X值 end **************/
    
    
    
    /**************  计算Y值 begin **************/
    // 求出行号
    NSUInteger row = index / colsPerRow;
    // 每一行之间的间距
    CGFloat yMargin = 20;
    // 商品Y
    CGFloat shopY = (shopH + yMargin) * row;
    /**************  计算X值 end **************/
    
    
    // 创建一个商品父控件
    UIView *shopView = [[UIView alloc] init];
    shopView.frame = CGRectMake(shopX, shopY, shopW, shopH);
    // 将商品父控件添加到shopsView中
    [self.shopsView addSubview:shopView];
    
    // 添加一个图片
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"qianbao"];
    iconView.frame = CGRectMake(0, 0, shopW, shopW);
    [shopView addSubview:iconView];
    
    // 添加一个文字
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(0, shopW, shopW, shopH - shopW);
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.text = @"钱包";
    [shopView addSubview:nameLabel];
}

- (IBAction)remove {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shopsView.clipsToBounds = YES;
}
@end