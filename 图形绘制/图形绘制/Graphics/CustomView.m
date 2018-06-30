//
//  CustomView.m
//  GraphicsDemo
//
//  Created by mac on 2018/6/22.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "CustomView.h"
@interface CustomView  ()

@property(nonatomic,strong) NSArray *dataArr;

@end
@implementation CustomView

-(NSArray *)dataArr{
    if (_dataArr ==nil) {
        _dataArr = @[
                     @{
                         @"name" : @"20",
                         @"icon" : @"30"
                         },
                     @{
                         @"name" : @"40",
                         @"icon" : @"60"
                         },
                     @{
                         @"name" : @"60",
                         @"icon" : @"30"
                         },
                     @{
                         @"name" : @"80",
                         @"icon" : @"50"
                         },
                     @{
                         @"name" : @"100",
                         @"icon" : @"30"
                         }
                     ];
    }
    return _dataArr;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect {
    // Drawing code

//    [self DrawWithGraphics];
    [self DrawWithBezierPathAndGraphics];


}

//绘制三次贝塞尔曲线
-(void)DrawWithGraphics{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /*
     绘制直线
     */
    //  设置直线宽度
    CGContextSetLineWidth(context, 1.0f);
    // 设置画笔颜色
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    // 设置起始点和终点
    CGContextMoveToPoint(context, 0, 100);
    CGContextAddLineToPoint(context, 200, 100);
    // 绘制直线
    CGContextStrokePath(context);
    
    
    
    /*
     绘制曲线
     */
    CGPoint PrePonit;
    for (NSInteger i = 0; i < self.dataArr.count; i++) {
        
        if (i==0) {
            NSDictionary *dic =self.dataArr[0];
            PrePonit = CGPointMake([dic[@"name"] floatValue], [dic[@"icon"] floatValue]);
            
            // 绘制曲线
            CGContextMoveToPoint(context, PrePonit.x,  PrePonit.y); //移动到起始位置
            
        }else{
            
            NSDictionary *dic =self.dataArr[i];
            CGPoint NowPoint = CGPointMake([dic[@"name"] floatValue], [dic[@"icon"] floatValue]);
            
            /**
             绘制二次贝塞尔曲线
             c:图形上下文
             cpx:控制点x坐标
             cpy:控制点y坐标
             x:结束点x坐标
             y:结束点y坐标
             */
            //            CGContextAddQuadCurveToPoint(context, (PrePonit.x+NowPoint.x)/2, NowPoint.y, NowPoint.x, NowPoint.y);
            
            /*绘制三次贝塞尔曲线
             c:图形上下文
             cp1x:第一个控制点x坐标
             cp1y:第一个控制点y坐标
             cp2x:第二个控制点x坐标
             cp2y:第二个控制点y坐标
             x:结束点x坐标
             y:结束点y坐标
             */
            CGContextAddCurveToPoint(context, (PrePonit.x+NowPoint.x)/2, PrePonit.y, (PrePonit.x+NowPoint.x)/2, NowPoint.y, NowPoint.x, NowPoint.y);
            
            PrePonit = NowPoint;
        }
    }
    
    
    [[UIColor orangeColor] setFill];
    [[UIColor redColor] setStroke];
    CGContextDrawPath(context, kCGPathStroke);
    

}

//绘制三次贝塞尔曲线和X轴填充渐变颜色
-(void)DrawWithBezierPathAndGraphics{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /*
     绘制曲线
     */
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint PrePonit;
    
    NSDictionary *dic =self.dataArr[0];
    PrePonit = CGPointMake([dic[@"name"] floatValue], [dic[@"icon"] floatValue]);
    [path moveToPoint:PrePonit];
    
    for (NSInteger i = 1; i < self.dataArr.count; i++) {
        
        NSDictionary *dic =self.dataArr[i];
        CGPoint NowPoint = CGPointMake([dic[@"name"] floatValue], [dic[@"icon"] floatValue]);
        
        /*绘制三次贝塞尔曲线
         c:图形上下文
         cp1x:第一个控制点x坐标
         cp1y:第一个控制点y坐标
         cp2x:第二个控制点x坐标
         cp2y:第二个控制点y坐标
         x:结束点x坐标
         y:结束点y坐标
         */
        [path addCurveToPoint:NowPoint controlPoint1:CGPointMake((PrePonit.x+NowPoint.x)/2, PrePonit.y) controlPoint2:CGPointMake((PrePonit.x+NowPoint.x)/2, NowPoint.y)]; //三次曲线
        PrePonit = NowPoint;
       
    }
    
    
    [path addLineToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(20, 100)];
    [path addLineToPoint:CGPointMake(20, 30)];
    
    //把路径添加到上下文
    CGContextAddPath(context, path.CGPath);
    [[UIColor orangeColor] setFill];
    [[UIColor blueColor] setStroke];
    //绘制渐变色
    [self drawLinearGradientWithContext:context path:path.CGPath beginColor:[UIColor orangeColor].CGColor endColor:[UIColor greenColor].CGColor];
    CGContextDrawPath(context, kCGPathFillStroke);
    

}

- (void)drawLinearGradientWithContext:(CGContextRef)context
                                 path:(CGPathRef)path
                           beginColor:(CGColorRef)beginColor
                             endColor:(CGColorRef)endColor;
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0, 1.0};
    NSArray *colorArr = @[(__bridge id)beginColor, (__bridge id)endColor];
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colorArr, locations);
    CGRect pathRect = CGPathGetBoundingBox(path);
    
    //具体方向可根据需求修改
    //垂直渐变
//    CGPoint startPoint = CGPointMake(CGRectGetMinX(pathRect), CGRectGetMidY(pathRect));
//    CGPoint endPoint = CGPointMake(CGRectGetMaxX(pathRect), CGRectGetMidY(pathRect));

    //水平渐变
    CGPoint startPoint = CGPointMake(CGRectGetMidX(pathRect), CGRectGetMinY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(pathRect), CGRectGetMaxY(pathRect));
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradientRef, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradientRef);
    CGColorSpaceRelease(colorSpace);
}


@end
