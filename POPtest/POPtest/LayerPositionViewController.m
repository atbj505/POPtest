//
//  LayerPositionViewController.m
//  POPtest
//
//  Created by 杨启晖 on 14/12/5.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LayerPositionViewController.h"

@interface LayerPositionViewController ()
@property (nonatomic, strong)UIView *springView;
@end

@implementation LayerPositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"LayerPosition";
    
    self.springView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.springView.center = self.view.center;
    
    self.springView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.springView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panView:)];
    
    [self.view addGestureRecognizer:pan];
}
- (void)panView:(UIPanGestureRecognizer*)pan{
    
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    
    CGPoint point = [pan locationInView:self.view];
    
    springAnimation.toValue = [NSValue valueWithCGPoint:point];
    
    [self.springView pop_addAnimation:springAnimation forKey:@"LayerPosition"];
}
@end
