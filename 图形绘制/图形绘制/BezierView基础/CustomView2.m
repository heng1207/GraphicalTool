//
//  CustomView2.m
//  图形绘制
//
//  Created by 恒 on 2018/1/10.
//  Copyright © 2018年 恒. All rights reserved.
//

#import "CustomView2.h"

#define k_ScreenWidth [UIScreen mainScreen].bounds.size.width
#define k_ScreenHeight [UIScreen mainScreen].bounds.size.height
#define k_CurrentHeight self.frame.size.height
#define k_CurrentWidth self.frame.size.width
#define Pi 3.1415926
#define k_DegreesToRadians(degrees) ((Pi * degrees)/ 180)



@implementation CustomView2

-(void)draw:(NSInteger)flag {
    self.flag = flag;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if (self.flag == 0) {
        //绘制一个三角形  该方法会详细讲述各个参数的意思及使用方法,后面的方法仅仅展示使用方法
        //绘制一条完整路径  首先创建路径对象,接着按绘制顺序添加关键点,最后调用[path closePath]方法闭合路径
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(40, self.frame.size.height - 40)];
        [path addLineToPoint:CGPointMake(self.frame.size.width-40, self.frame.size.height - 40)];
        [path addLineToPoint:CGPointMake(self.frame.size.width/2, 40)];
        [path closePath];
        
        /*设置填充颜色   创建一个颜色对象之后,需要调用颜色的set方法设置上下文环境,接着调用路径的fill方法使用上下文环境中的颜色来填充
         Tip: 这个fill方法很有意思
         如果第一次设置上下文环境为红色,那么调用fill的则会为该路径内填充红色
         但是第二次设置上下文环境为绿色时,调用fill方法并不是说将路径内的红色替换掉,而是在红色的上方填充一次绿色
         我会在博客里验证,读者也可自行验证
         */
        UIColor *redColor = [UIColor redColor];
        [redColor set];
        [path fill];
        
        //设置线条属性
        path.lineCapStyle = kCGLineJoinRound;  //线段端点格式
        path.lineJoinStyle = kCGLineJoinRound; //线段接头格式
        path.lineWidth = 8;
        
        
        //设置路径颜色  原理和设置填充颜色一样,这不过是调用[path stroke]方法来设置路径额颜色 设置线宽为8
        UIColor *blackColor = [UIColor blackColor];
        [blackColor set];
        [path stroke];
        
    }
    #pragma mark:由于设置填充颜色、线条颜色、线条宽度代码重复冗余,所以将其写到一个方法里,统一设置为填充颜色为红色,线条颜色为黑色,线条宽度为8  setPath方法
   
    else if (self.flag == 1){
        //绘制一个矩形
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(40,40 ,self.frame.size.width - 80 , self.frame.size.height - 80)];
        [self setPath:path];
        
    }
    else if (self.flag == 2){
        /*
         该方法是使用一个矩形为基准绘制其内切圆
         当该矩形是正方形时,绘制出的为圆形
         当该矩形为长方形的时候,绘制出来的是椭圆
         */
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(40, 80, self.frame.size.width - 80, self.frame.size.width - 80)];
        [self setPath:path];
        
    }
    else if (self.flag == 3){
        //绘制一个空心圆形  主要为了展示使用不同的工厂方法来创建圆形
        
        //从右中间顺时针 旋转
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:(self.frame.size.width - 40)/2
                                                        startAngle:k_DegreesToRadians(50)
                                                          endAngle:k_DegreesToRadians(100)
                                                         clockwise:YES];
        //设置填充颜色
        UIColor *redColor = [UIColor clearColor];
        [redColor set];
        [path fill];
        
        //设置路径格式
        path.lineWidth = 8;
        path.lineCapStyle = kCGLineJoinRound;
        path.lineJoinStyle = kCGLineJoinRound;
        
        //设置路径颜色
        UIColor *blackColor = [UIColor blackColor];
        [blackColor set];
        [path stroke];
    }
    else if (self.flag == 4){
        //绘制一个四个角都是圆角额矩形
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(40,40 ,k_CurrentWidth - 80 , k_CurrentHeight - 80)
                                                        cornerRadius:20];
        [self setPath:path];
        
    }
    else if (self.flag == 5){
        //绘制一个可选角度的矩形
        /*
         参数解析:
         bezierPathWithRoundedRect   绘制矩形的大小
         byRoundingCorners           有哪几个角需要绘制
         cornerRadii                 圆角角度,使用角的顶点作为圆心来切圆角
         */
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(40,40 ,k_CurrentWidth - 80 , k_CurrentHeight - 80)
                                                   byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight
                                                         cornerRadii:CGSizeMake((k_CurrentWidth - 80)/2, (k_CurrentWidth - 80)/2)];
        [self setPath:path];
        
    }
    else if (self.flag == 6){
        [self drawSecondBezierPath];
    }
    else if (self.flag == 7){
        [self drawThirdBezierPath];
    }
}

- (void)drawSecondBezierPath {
    UIBezierPath *path = [UIBezierPath bezierPath];
    //设置一个起始点
    [path moveToPoint:CGPointMake(20, self.frame.size.height - 100)];
    // 添加二次曲线
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.width - 20, self.frame.size.height - 100)
                 controlPoint:CGPointMake(self.frame.size.width / 2, 0)];
    
    path.lineCapStyle = kCGLineJoinRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 8.0;
    
    UIColor *strokeColor = [UIColor blackColor];
    [strokeColor set];
    [path stroke];
}

- (void)drawThirdBezierPath {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 200)];
    
    [path addCurveToPoint:CGPointMake(300, 200)
            controlPoint1:CGPointMake(160, 50)
            controlPoint2:CGPointMake(160, 300)];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor blackColor];
    [strokeColor set];
    [path stroke];
}


-(void)setPath:(UIBezierPath*)path{
    //设置填充颜色
    UIColor *redColor = [UIColor redColor];
    [redColor set];
    [path fill];
    
    //设置路径格式
    path.lineWidth = 8.0;
    path.lineCapStyle = kCGLineJoinRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    //设置路径颜色
    UIColor *blackColor = [UIColor blackColor];
    [blackColor set];
    [path stroke];
}

@end
