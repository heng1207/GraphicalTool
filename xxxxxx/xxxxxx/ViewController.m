//
//  ViewController.m
//  xxxxxx
//
//  Created by mac on 2018/6/12.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "LineChartViewController.h"
#import "BezierDrawLineVC.h"
#import "GraphicsVC.h"


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
        cell.textLabel.text =@"BezierDrawLine";
    }else if (indexPath.row==1){
        cell.textLabel.text =@"Chart曲线";
    }else if (indexPath.row==2){
        cell.textLabel.text =@"Chart折线";
    }else if (indexPath.row==3){
        cell.textLabel.text =@"Graphics";
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        BezierDrawLineVC *vc=[BezierDrawLineVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row==1){
        TestViewController *vc=[TestViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row==2){
        LineChartViewController *vc=[LineChartViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row==3){
        GraphicsVC *vc=[GraphicsVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
