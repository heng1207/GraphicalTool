//
//  CustomView1.m
//  图形绘制
//
//  Created by 恒 on 2018/1/10.
//  Copyright © 2018年 恒. All rights reserved.
//

#import "CustomView1.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation CustomView1

-(void)draw:(NSInteger)flag {
    self.flag = flag;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if (self.flag == 0) {
        /*
         绘制直线
         */
        // 获取上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        //  设置直线宽度
        CGContextSetLineWidth(context, 3.0f);
        // 设置画笔颜色
        CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
        // 设置起始点和终点
        CGContextMoveToPoint(context, 30, 30);
        CGContextAddLineToPoint(context, 150, 150);
        // 绘制直线
        CGContextStrokePath(context);
    }
    else if (self.flag == 1) {
        /*
         绘制三角形
         */
        // 获取上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        // 设置直线宽度
        CGContextSetLineWidth(context, 3.0f);
        // 设置画笔颜色
        CGContextSetStrokeColorWithColor(context, [[UIColor yellowColor] CGColor]);
        // 设置三角形的三个点，原理就是绘制直线
        CGContextMoveToPoint(context, 30, 30);
        CGContextAddLineToPoint(context, 150, 50);
        CGContextAddLineToPoint(context, 20, 80);
        CGContextAddLineToPoint(context, 30, 30);
        // 绘制路径
        CGContextStrokePath(context);
    }
    else if (self.flag == 2) {
        /*
         绘制圆形
         */
        // 获取上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        // 设置直线宽度
        CGContextSetLineWidth(context, 5.0f);
        // 设置画笔颜色
        CGContextSetStrokeColorWithColor(context, [[UIColor yellowColor] CGColor]);
        // 设置背景填充颜色
        CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
        // 设置绘制圆形的区域
        CGContextAddEllipseInRect(context, CGRectMake(40, 40, 120, 120));
        // 绘制路径
//        CGContextDrawPath(context, kCGPathFillStroke);//画边框圆，并填充圆
//        CGContextFillPath(context); //填充圆，无边框
        CGContextDrawPath(context, kCGPathFill);//仅填充，无边框
        
    }
    else if (self.flag == 3){
        /*
         绘制扇形
         */
        // 上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        UIColor *color1 = [UIColor redColor];
        CGContextSetFillColorWithColor(context, color1.CGColor);//填充颜色
        
        //以10为半径围绕圆形画指定角度的扇形
        CGContextMoveToPoint(context, 40, 100);
        CGContextAddArc(context, 40, 100, 40, -60 * M_PI /180, - 120 * M_PI /180, 1);
        CGContextClosePath(context);//路径结束标志
        CGContextDrawPath(context, kCGPathFillStroke);//绘制路径
        
        
    }
    else if (self.flag == 4) {
        /*
         绘制方形
         */
        // 上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        // 设置画笔直线宽度
        CGContextSetLineWidth(context, 2.0f);
        // 设置画笔颜色
        CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
        // 设置背景填充色
        CGContextSetFillColorWithColor(context, [[UIColor yellowColor] CGColor]);
        // 设置绘制方形区域
        CGContextAddRect(context, CGRectMake(30, 30, 150, 150));
        // 绘制路径
//        CGContextFillPath(context); //画填充块,不带矩形框
//        CGContextDrawPath(context, kCGPathStroke);//画矩形框
        CGContextDrawPath(context, kCGPathFillStroke);//画填充块,带矩形框
        
    }
    else if (self.flag == 5) {
        /*
         画圆角矩形
         */
        
        // 上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        float fw = 50;
        float fh = 60;
        
        CGContextMoveToPoint(context, fw+20, fh);//开始坐标，右边开始
        // 设置画笔直线宽度
        CGContextSetLineWidth(context, 2.0f);
        // 设置画笔颜色
        CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
        // 设置背景填充色
        CGContextSetFillColorWithColor(context, [[UIColor yellowColor] CGColor]);
        //圆弧与(x1,y1)(x2,y2)的直线相切
        /*CGContextAddArcToPoint(<#CGContextRef  _Nullable c#>,
         <#CGFloat x1#>,
         <#CGFloat y1#>,
         <#CGFloat x2#>,
         <#CGFloat y2#>,
         <#CGFloat radius#>);
         */
        
        CGContextAddArcToPoint(context, fw, fh, fw, fh+20, 10);//左上角角度
        CGContextAddArcToPoint(context, fw, 300, fw+20, 300, 10);//左下角角度
        CGContextAddArcToPoint(context, 280, 300, 300-20, 280, 10);//右下角
        CGContextAddArcToPoint(context,280, fh, 280-20, fh, 10);//右上角
        CGContextClosePath(context);//封闭路径
        CGContextDrawPath(context, kCGPathStroke);//根据坐标绘制路径
        
    }
    else if (self.flag == 6) {
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(UIGraphicsGetCurrentContext());
        
        //设置渐变
        CGFloat locations [2] ={0.0,1.0};
        CGFloat components[8] ={1.0,0.0,0.0,1.0,    //起始颜色为红色
            0.0,1.0,0.0,1.0};   //终止颜色为黄色
        
        //色彩范围容器
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        
        //渐变属性：颜色空间、颜色、位置、有效数量
        //CGGradientCreateWithColorComponents:创建包含渐变的CGGradientRef对象
        CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
        
        //画矩形
        CGContextMoveToPoint(context, 50, 130);
        CGContextAddLineToPoint(context, 150, 130);
        CGContextAddLineToPoint(context, 150, 180);
        CGContextAddLineToPoint(context, 50, 180);
        CGContextClip(context);//裁剪路径
        
        //控制渐变的方向和形状
        CGPoint startPoint = CGPointMake(50,130);
        CGPoint endPoint = CGPointMake(150,180);
        
        //绘制线性渐变
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, kCGGradientDrawsAfterEndLocation);
        
        CGGradientRelease(gradient);
        CGColorSpaceRelease(colorspace);
        
        //恢复Graphical Context图形上下文
        CGContextRestoreGState(UIGraphicsGetCurrentContext());
        
        
    }
    else if (self.flag == 7) {
        /*
         1 - 直接用UIView方法在view上绘制文字
         */
        // 绘制的文字的内容
        NSString *text = @"钓鱼岛是中国的!!";
        // 设置文字的大小
//        UIFont *font = [UIFont systemFontOfSize:28];
        UIFont *font = [UIFont boldSystemFontOfSize:28];
        // 设置绘图位置
        CGRect textRect;
        //iOS7以前使用，iOS7以后弃用
//        textRect.size = [text sizeWithFont:font];
        //iOS7以后使用
        textRect.size = [text sizeWithAttributes:@{NSFontAttributeName:font} ];
        
        textRect.origin.x = 30;
        textRect.origin.y = 80;
        [[UIColor blackColor] setFill];
        // 在view上绘制文字
        //iOS7以前使用，iOS7以后弃用
//        [text drawInRect:textRect withFont:font];
        //iOS7以后使用
        [text drawInRect:textRect withAttributes:@{NSFontAttributeName:font}];
  
        
        /*
         2 - 用Quartz2D方式绘制文字
         */
        // 获取绘图上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        // 设置绘制的文字
        char *name = "right!";
        
        // 选择绘制的文字(参数：上下文、字体、大小、转码方式)
        CGContextSelectFont(context, "Helvetica",28.f , kCGEncodingFontSpecific);

        
        // 设置文字绘制方式(描边、填充、描边填充)
        CGContextSetTextDrawingMode(context,kCGTextFillStroke);
        // 设置画笔和填充颜色
        CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
        CGContextSetFillColorWithColor(context, [[UIColor yellowColor] CGColor]);
        // 绘制文字
        CGContextShowTextAtPoint(context, 50, 250, name, strlen(name));
    }
    else if (self.flag == 8) {
        /*
         绘制图片-方式1：UIImage自带方式
         */
        UIImage *img1 = [UIImage imageNamed:@"nba-1.png"];
        [img1 drawAtPoint:CGPointMake(30, 30)];
        
        /*
         绘制图片-方式2：Quartz2D方式
         */
        // 获取上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        // 绘制的图片
        UIImage *img2 = [UIImage imageNamed:@"nba.png"];
        // 使用Quarzt2D绘制的图片是倒置的，使用下方法设置坐标原点和显示比例来改变坐标系
        CGContextTranslateCTM(context, 0.0f, self.frame.size.height);
        CGContextScaleCTM(context, 1.0,-1.0);
        // 在上下文绘制图片
        CGContextDrawImage(context, CGRectMake(220, 130, img2.size.width, img2.size.height), [img2 CGImage]);
    }
  
    else if (self.flag == 9) {
        /*
         为图片添加阴影
         */
        
        // 保存绘图状态
        CGContextSaveGState(UIGraphicsGetCurrentContext());
        
        // 添加阴影：设置阴影偏移量、模糊指数
        CGContextSetShadow(UIGraphicsGetCurrentContext(), CGSizeMake(4, 7), 2);
        
        // 创建UIImage对象
        UIImage *logoImage2 = [UIImage imageNamed:@"nba-1.png"];
        
        // 将图像绘制到视图
        CGRect logoBounds = CGRectMake(30, 50, 170, 143);
        [logoImage2 drawInRect:logoBounds];
        
        // 恢复绘图状态
        CGContextRestoreGState(UIGraphicsGetCurrentContext());
    }
    else if (self.flag == 10) {
        /*
         渐变
         */
        
        //设置渐变
        CGContextSaveGState(UIGraphicsGetCurrentContext());
        
        CGFloat locations [2] ={0.0,1.0};
        CGFloat components[8] ={1.0,0.5,0.0,1.0,    //起始颜色为红色
            0.0,1.0,1.0,1.0};   //终止颜色为黄色
        
        //色彩范围容器
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        
        //渐变属性：颜色空间、颜色、位置、有效数量
        //CGGradientCreateWithColorComponents:创建包含渐变的CGGradientRef对象
        CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
        
        CGPoint startPoint = CGPointMake(30,40);
        CGPoint endPoint = CGPointMake(50,150);
        
        //绘制线性渐变
        CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), gradient, startPoint, endPoint, 0);
        
        CGGradientRelease(gradient);
        CGColorSpaceRelease(colorspace);
        
        //恢复Graphical Context图形上下文
        CGContextRestoreGState(UIGraphicsGetCurrentContext());

    }
    
}


@end
