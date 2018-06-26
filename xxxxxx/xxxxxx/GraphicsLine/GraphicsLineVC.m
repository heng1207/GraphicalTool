//
//  GraphicsLineVC.m
//  xxxxxx
//
//  Created by mac on 2018/6/26.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "GraphicsLineVC.h"
#import "WSLineChartView.h"


/*
 https://blog.csdn.net/qq_26598077/article/details/53201837  折线图放大缩小，平移
 https://blog.csdn.net/jie863230900/article/details/51699268  可缩放、滑动显示的折线图
 https://www.jianshu.com/p/77240c51ff79 填充颜色渐变
 https://www.jianshu.com/p/4a36d839fac3 画曲线
 
 */


@interface GraphicsLineVC ()
@property (strong,nonatomic)NSMutableArray *x_names;
@property (strong,nonatomic)NSMutableArray *targets;
@property (strong,nonatomic)NSMutableArray *y_names;
@end

@implementation GraphicsLineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor grayColor];
    
    NSMutableArray *xArray = [NSMutableArray array];
    NSMutableArray *yArray = [NSMutableArray array];
    NSMutableArray *yArrayUnder = [NSMutableArray array];
    for (NSInteger i = 0; i < 20; i++) {
        
        [xArray addObject:[NSString stringWithFormat:@"%.1f",3+0.1*i]];
        [yArray addObject:[NSString stringWithFormat:@"%.2lf",20.0+arc4random_uniform(10)]];
        
        [yArrayUnder addObject:[NSString stringWithFormat:@"%.2lf",1000.0+arc4random_uniform(1000)]];
        
    }
    
    WSLineChartView *wsLine = [[WSLineChartView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 400) xTitleArray:xArray yValueArray:yArray yMax:30 yMin:15];
    
    
    //    WSLineChartView *wsLine = [[WSLineChartView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 400) xTitleArray:self.x_names yValueArray:self.targets yMax:-2 yMin:6];
    
    [self.view addSubview:wsLine];
    
    
    
    // Do any additional setup after loading the view.
}

/**
 *  X轴值
 */
-(NSMutableArray *)x_names{
    if (!_x_names) {
        _x_names = [NSMutableArray arrayWithArray:@[@"1/6",@"2/6",@"3/6",@"4/6",@"5/6",@"6/6",@"7/6"]];
    }
    return _x_names;
}

/**
 *  y轴值
 */
-(NSMutableArray *)y_names{
    if (!_y_names) {
        _y_names = [NSMutableArray arrayWithArray:@[@"-2",@"0",@"2",@"4",@"6"]];
    }
    return _y_names;
}


/**
 *  Y
 */
-(NSMutableArray *)targets{
    if (!_targets) {
        _targets = [NSMutableArray arrayWithArray:@[@1,@-2,@2,@5,@3,@2,@0]];
    }
    return _targets;
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
