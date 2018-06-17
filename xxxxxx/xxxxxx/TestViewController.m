//
//  TestViewController.m
//  xxxxxx
//
//  Created by mac on 2018/6/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TestViewController.h"
#import "xxxxxx-Bridging-Header.h"

@interface TestViewController ()
@property (nonatomic, strong) LineChartView *lineChartView;
@property (nonatomic, strong) NSArray *turnovers;
@property (nonatomic, strong) NSArray *Yturnovers;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];

    LineChartView *lineChartView = [[LineChartView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
    [self.view addSubview:lineChartView];
    self.lineChartView = lineChartView;
    
    lineChartView.doubleTapToZoomEnabled = NO;//禁止双击缩放 有需要可以设置为YES
    lineChartView.gridBackgroundColor = [UIColor blueColor];//表框以及表内线条的颜色以及隐藏设置 根据自己需要调整
    lineChartView.borderColor = [UIColor grayColor];
    lineChartView.drawGridBackgroundEnabled = NO;
    lineChartView.drawBordersEnabled = NO;
//    lineChartView.descriptionText = @"XXX";//该表格的描述名称
//    lineChartView.descriptionTextColor = [UIColor whiteColor];//描述字体颜色
    
    lineChartView.legend.enabled = YES;//是否显示折线的名称以及对应颜色 多条折线时必须开启 否则无法分辨
    lineChartView.legend.textColor = [UIColor redColor];//折线名称字体颜色
    
    //设置动画时间
    [lineChartView animateWithXAxisDuration:1];
    
//    设置纵轴坐标显示在左边而非右边
    ChartYAxis *leftAxis = self.lineChartView.leftAxis;//获取左边Y轴
    leftAxis.drawGridLinesEnabled = NO;
    leftAxis.labelTextColor = [UIColor blueColor];
    
    
    ChartYAxis *rightAxis = self.lineChartView.rightAxis;//获取左边Y轴
    rightAxis.drawGridLinesEnabled = NO;//不绘制网格线
    rightAxis.labelTextColor = [UIColor whiteColor];
    

    //设置横轴坐标显示在下方 默认显示是在顶部
    ChartXAxis *xAxis = lineChartView.xAxis;
    xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.labelTextColor = [UIColor blueColor];
    xAxis.labelCount = 3;
    xAxis.drawGridLinesEnabled = NO;//不绘制网格线
    
    //用于存放多个折线数据的数组
    NSMutableArray *sets = [NSMutableArray array];
    
    //turnovers是用于存放模型的数组
    //模型数组 这里是使用的随机生成的模型数据
    self.turnovers = @[
                       @{
                           @"name" : @"10",
                           @"icon" : @"15"
                           },
                       @{
                           @"name" : @"20",
                           @"icon" : @"30"
                           },
                       @{
                           @"name" : @"30",
                           @"icon" : @"15"
                           },
                       @{
                           @"name" : @"40",
                           @"icon" : @"30"
                           },
                       @{
                           @"name" : @"50",
                           @"icon" : @"15"
                           }
                       ];
    self.turnovers = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",];
    self.Yturnovers = @[@"15",@"20",@"15",@"40",@"60",@"80",@"15",@"40",@"60",@"80",@"15",@"33",@"70",];

    //横轴数据
    NSMutableArray *xValues = [NSMutableArray array];
    for (int i = 0; i < self.turnovers.count; i ++) {

        //取出模型数据
//        ChartsModel *model = self.turnovers[i];
//        [xValues addObject:model.enterDate];
        NSDictionary *dict= self.turnovers[i];
        [xValues addObject:self.turnovers[i]];
    }

    //设置横轴数据给chartview
    self.lineChartView.xAxis.valueFormatter = [[ChartIndexAxisValueFormatter alloc] initWithValues:xValues];

    
    
    //纵轴数据
    NSMutableArray *yValues1 = [NSMutableArray array];
    for (int i = 0; i < self.Yturnovers.count; i ++) {
        
//        ChartsModel *model = self.turnovers[i];
//        NSDictionary *dict= self.Yturnovers[i];
        double y = [self.Yturnovers[i] doubleValue];
        ChartDataEntry *entry = [[ChartDataEntry alloc]initWithX:i y:y];
        [yValues1 addObject:entry];
        
//        [yValues1 addObject:dict[@"icon"]];
    }

    
    //创建LineChartDataSet对象
    LineChartDataSet *set1 = [[LineChartDataSet alloc] initWithValues:yValues1 label:@"成交额"];

    set1.circleRadius = 1.0;
    set1.circleHoleRadius = 0.5;
    [set1 setColor:[UIColor redColor]];
    set1.fillColor = UIColor.blueColor;
    set1.fillAlpha = 1.f;
    set1.mode = LineChartModeCubicBezier;
    set1.drawValuesEnabled = NO;
    set1.fillAlpha = 1.f;
    set1.drawFilledEnabled =YES;
    //sets内存放所有折线的数据 多个折线创建多个LineChartDataSet对象即可
    [sets addObject:set1];
    
    LineChartData *data = [[LineChartData alloc] initWithDataSets:sets];
    
    self.lineChartView.data = data;
        


    
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
