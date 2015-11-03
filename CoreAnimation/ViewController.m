//
//  ViewController.m
//  CoreAnimation
//
//  Created by apple on 15/10/12.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *redLayer = [CALayer layer];
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    redLayer.frame = CGRectMake(100, 100, 200, 100);
   //redLayer.zPosition =  100;
    redLayer.contents = (__bridge id)([UIImage imageNamed:@"1.jpg"].CGImage);
       [self.view.layer addSublayer:redLayer];
    // redLayer.contentsGravity = kCAGravityResize;
    // redLayer.contentsGravity = kCAGravityCenter;
    redLayer.contentsGravity = kCAGravityResizeAspect;
    self.view.layer.contentsGravity = kCAGravityResize;
    //redLayer.contentsGravity = kCAGravityResizeAspectFill;
    //redLayer.contentsGravity = kCAGravityCenter;
    redLayer.contentsRect = CGRectMake(0.5, 0, 0.5, 1);
    
    CALayer *greenLayer = [CALayer layer];
greenLayer.backgroundColor = [UIColor greenColor].CGColor;
    greenLayer.frame = CGRectMake(100, 250, 200, 100);
   // greenLayer.zPosition =  -100;
    greenLayer.contents = (__bridge id)([UIImage imageNamed:@"1.jpg"].CGImage);
    greenLayer.contentsRect = CGRectMake(0, 0, 0.5, 1);
    [self.view.layer addSublayer:greenLayer];
    
    CALayer *aLayer = [CALayer layer];
  //  aLayer.backgroundColor = [UIColor greenColor].CGColor;
    aLayer.frame = CGRectMake(20, 450, 300, 150);
   // aLayer.zPosition =  -100;
    aLayer.contents = (__bridge id)([UIImage imageNamed:@"1.png"].CGImage);
    aLayer.contentsCenter = CGRectMake(0.2, 0.2, 0.1, 0.1);
     [self.view.layer addSublayer:aLayer];
    NSLog(@"frame:%@",NSStringFromCGRect(aLayer.frame));
    NSLog(@"bounds:%@",NSStringFromCGRect(aLayer.bounds));
    NSLog(@"position:%@",NSStringFromCGPoint(aLayer.position));
    NSLog(@"anchor point:%@",NSStringFromCGPoint(aLayer.anchorPoint));
    aLayer.borderColor = [UIColor redColor].CGColor;
    aLayer.borderWidth = 10;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        aLayer.anchorPoint = (CGPoint){0.,0.};
        aLayer.cornerRadius = 40;
        //aLayer.masksToBounds = YES;
        aLayer.borderWidth = 4;
        aLayer.borderColor = [UIColor orangeColor].CGColor;
        aLayer.shadowColor = [UIColor blueColor].CGColor;
        aLayer.shadowOpacity = 0.5;
        aLayer.shadowOffset = CGSizeMake(20, 20);
        aLayer.shadowRadius = 10;//模糊
        
        NSLog(@"frame:%@",NSStringFromCGRect(aLayer.frame));
        NSLog(@"bounds:%@",NSStringFromCGRect(aLayer.bounds));
        NSLog(@"position:%@",NSStringFromCGPoint(aLayer.position));
        NSLog(@"anchor point:%@",NSStringFromCGPoint(aLayer.anchorPoint));
        //蒙板
/*
        CALayer *mask = [CALayer layer];
        mask.frame = aLayer.bounds;
        mask.contents = (__bridge id)([UIImage imageNamed:@"mengban.png"].CGImage);
        aLayer.mask = mask;
 */
        /*
  //阴影的形状
        CGMutablePathRef circlePath = CGPathCreateMutable()
        ;
        CGPathAddEllipseInRect(circlePath, NULL,aLayer.bounds );
        aLayer.shadowPath = circlePath;
        //旋转45度
        aLayer.affineTransform = CGAffineTransformMakeRotation(M_PI_4);
    //平移
        aLayer.affineTransform = CGAffineTransformMakeTranslation(100, 50);
        aLayer.affineTransform = CGAffineTransformMakeScale(1.0/2,1.0/3);
         */
#if 0
        CATransform3D t = CATransform3DIdentity;
        //投影变换（z变换）
        //m34 ＝ － 1.0/d表示透视效果，d一半在500-1000，为相机与屏幕的距离，距离越小透视效果越明显
        t.m34 = -1.0/500;
        t = CATransform3DRotate(t, M_PI_4, 0, 0, 1 );
        aLayer.transform = t;
#endif
        
    });
    //sublayers
    UIView *containerView = [[UIView alloc]initWithFrame:self.view.bounds];
    containerView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:containerView];
    
    CALayer *layer1 = [CALayer layer];
    layer1.backgroundColor = [UIColor orangeColor].CGColor;
    layer1.frame = CGRectMake(20, 200, 200, 100);
    CALayer *layer2 = [CALayer layer];
    layer2.backgroundColor = [UIColor purpleColor].CGColor;
    layer2.frame = CGRectMake(20, 400, 200, 100);
    [containerView.layer addSublayer:layer1];
    [containerView.layer addSublayer:layer2];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //公共的透视变换
        CATransform3D perspective = CATransform3DIdentity ;
        perspective.m34 = -1.0/500.0;
        containerView.layer.sublayerTransform = perspective;

    //绕y轴旋转45度
    CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    layer1.transform = transform1;
    //反向旋转45度
    CATransform3D transfrom2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    layer2.transform = transfrom2;
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end













