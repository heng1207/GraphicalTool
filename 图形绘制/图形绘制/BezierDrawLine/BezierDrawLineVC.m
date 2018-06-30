//
//  BezierDrawLineVC.m
//  xxxxxx
//
//  Created by 张恒 on 2018/6/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "BezierDrawLineVC.h"

#import "BezierLineView.h"



#define SCREEN_W  [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height

@interface BezierDrawLineVC ()


@property (strong,nonatomic)BezierLineView *lineView;
@property (strong,nonatomic)NSMutableArray *x_names;
@property (strong,nonatomic)NSMutableArray *targets;
@property (strong,nonatomic)NSMutableArray *y_names;


@end

@implementation BezierDrawLineVC


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
        _y_names = [NSMutableArray arrayWithArray:@[@"-4",@"-2",@"0",@"2",@"4",@"6",]];
    }
    return _y_names;
}


/**
 *  Y轴值
 */
-(NSMutableArray *)targets{
    if (!_targets) {
        _targets = [NSMutableArray arrayWithArray:@[@-3,@6,@2,@5,@-4,@6,@0]];
    }
    return _targets;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    

    [self drawLineChart];
    

    
    // Do any additional setup after loading the view.
}

-(void)drawLineChart{
    
    //1.初始化
    _lineView = [[BezierLineView alloc]initWithFrame:CGRectMake(30, 120, SCREEN_W-60, 250)];
    [self.view addSubview:_lineView];
    
    //直线
    [_lineView drawLineChartViewWithX_Value_Names:self.x_names Y_Value_Names:self.y_names TargetValues:self.targets LineType:LineType_Straight];
    
    //曲线
//    [_lineView drawLineChartViewWithX_Value_Names:self.x_names Y_Value_Names:self.y_names TargetValues:self.targets LineType:LineType_Curve];
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
