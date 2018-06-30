//
//  BezierViewController.m
//  图形绘制
//
//  Created by 恒 on 2018/1/10.
//  Copyright © 2018年 恒. All rights reserved.
//


//https://www.jianshu.com/p/5f5dd412b289
//https://www.jianshu.com/p/6b96e991218d

#import "BezierViewController.h"
#import "CustomView2.h"

@interface BezierViewController ()
@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)CustomView2 *customView;

@end

@implementation BezierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIBezierPath";
    self.view.backgroundColor =[UIColor whiteColor];
    
    self.titleArr =@[@"绘制三角形",@"绘制方形",@"绘制内切圆",@"绘制空心圆",@"圆角额矩形",@"可选角度的矩形",@"二次曲线",@"三次曲线"];
    
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
    for (NSInteger i =0; i<8; i++) {
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

    
    // Do any additional setup after loading the view.
}

-(void)click:(UIButton*)btn{
    
    [self.customView removeFromSuperview];
    self.customView =[[CustomView2 alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 350)];
    self.customView.backgroundColor =[UIColor whiteColor];
    [self.customView draw:[btn tag]];
    [self.view addSubview:self.customView];
    
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
