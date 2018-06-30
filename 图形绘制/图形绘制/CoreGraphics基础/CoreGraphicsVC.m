//
//  CoreGraphicsVC.m
//  图形绘制
//
//  Created by 张恒 on 2018/6/30.
//  Copyright © 2018年 张恒. All rights reserved.
//

#import "CoreGraphicsVC.h"
#import "CustomView1.h"


@interface CoreGraphicsVC ()

@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)CustomView1 *customView;
@end

@implementation CoreGraphicsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"Core Graphics";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleArr =@[@"绘制直线",@"绘制三角",@"绘制圆形",@"绘制扇形",@"绘制方形",@"画圆角矩形",@"画矩形，并填充渐变色",@"绘制文字",@"绘制图片",@"为图片添加阴影",@"渐变"];
    
    //左侧间隔
    CGFloat leftD = 42;
    //中间间隔X
    CGFloat zhongJianX = 25;
    //中间间隔Y
    CGFloat zhongJianY = 10;
    //按钮宽度
    CGFloat buttonW = 80;
    //按钮高度
    CGFloat buttonH = 30;
    for (NSInteger i =0; i<11; i++) {
        CGFloat x = leftD + zhongJianX*(i%3) + buttonW*(i%3);
        NSInteger row = i/3;
        CGFloat y = row*buttonH + row*zhongJianY + 500;
        UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, buttonW, buttonH)];
        [self.view addSubview:btn];
        btn.backgroundColor =[UIColor grayColor];
        btn.tag = i;
        [btn setTitle:self.titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)click:(UIButton*)btn{
    
    [self.customView removeFromSuperview];
    self.customView =[[CustomView1 alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 350)];
    self.customView.backgroundColor =[UIColor whiteColor];
    [self.customView draw:[btn tag]];
    [self.view addSubview:self.customView];

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
