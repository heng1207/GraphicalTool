//
//  ViewController.m
//  图形绘制
//
//  Created by 张恒 on 2018/6/30.
//  Copyright © 2018年 张恒. All rights reserved.
//


#import "ViewController.h"

#import "BezierViewController.h"
#import "CoreGraphicsVC.h"
#import "BezierSlideLineVC.h"
#import "TestViewController.h"
#import "LineChartViewController.h"
#import "BezierDrawLineVC.h"
#import "GraphicsVC.h"
#import "GraphicsLineVC.h"


#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row==0) {
        cell.textLabel.text =@"Bezier基础";
    }else if (indexPath.row==1){
        cell.textLabel.text =@"BezierDrawLine不能移动放大缩小";
    }else if (indexPath.row==2){
        cell.textLabel.text =@"BezierDrawLine可移动放大缩小";
    }else if (indexPath.row==3){
        cell.textLabel.text =@"Graphics基础";
    }else if (indexPath.row==4){
        cell.textLabel.text =@"Graphics,把横坐标和曲线之间填充";
    }else if (indexPath.row==5){
        cell.textLabel.text =@"用Graphics画高密集曲线，可捏合放大缩小，左右滑动";
    }else if (indexPath.row==6){
        cell.textLabel.text =@"Chart曲线";
    }else if (indexPath.row==7){
        cell.textLabel.text =@"Chart折线";
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        BezierViewController *vc =[BezierViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row==1){
        BezierDrawLineVC *vc=[BezierDrawLineVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row==2){
        BezierSlideLineVC *vc=[BezierSlideLineVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row==3){
        CoreGraphicsVC *vc=[CoreGraphicsVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row==4){
        GraphicsVC *vc=[GraphicsVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row==5){
        GraphicsLineVC *vc=[GraphicsLineVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row==6){
        TestViewController *vc=[TestViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row==7){
        LineChartViewController *vc=[LineChartViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
