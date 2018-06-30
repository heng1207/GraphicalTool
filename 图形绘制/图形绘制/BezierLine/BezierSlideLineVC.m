//
//  BezierSlideLineVC.m
//  xxxxxx
//
//  Created by mac on 2018/6/26.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "BezierSlideLineVC.h"
#import "BezierView.h"


#define SCREEN_W  [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height


@interface BezierSlideLineVC ()

@property (strong,nonatomic)BezierView *bezierView;

@property (strong,nonatomic)NSMutableArray *x_names;
@property (strong,nonatomic)NSMutableArray *targets;
@property (strong,nonatomic)NSMutableArray *y_names;

@end

@implementation BezierSlideLineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    
    //1.初始化
    _bezierView = [[BezierView alloc]initWithFrame:CGRectMake(0, 120, SCREEN_W, 250) WithX_Value_Names:self.x_names Y_Value_Names:self.y_names TargetValues:self.targets Type:Type_quxian];
    _bezierView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:_bezierView];
    
    // Do any additional setup after loading the view.
}

/**
 *  X轴值
 */
-(NSMutableArray *)x_names{
    if (!_x_names) {
        _x_names = [NSMutableArray arrayWithArray:@[@"1/6",@"2/6",@"3/6",@"4/6",@"5/6",@"6/6",@"7/6",@"8/6",@"9/6",@"10/6",@"11/6",@"12/6"]];
    }
    return _x_names;
}
/**
 *  y轴值
 */
-(NSMutableArray *)y_names{
    if (!_y_names) {
        _y_names = [NSMutableArray arrayWithArray:@[@"-4",@"-2",@"0",@"2",@"4",@"6"]];
    }
    return _y_names;
}


/**
 *  Y轴值
 */
-(NSMutableArray *)targets{
    if (!_targets) {
        _targets = [NSMutableArray arrayWithArray:@[@3,@6,@-4,@5,@4,@0,@4,@-3,@4,@0,@4,@-3]];
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
