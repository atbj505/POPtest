//
//  LayerSizeViewController.m
//  POPtest
//
//  Created by 杨启晖 on 14/12/5.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LayerSizeViewController.h"

@interface LayerSizeViewController ()
@property (nonatomic, strong)UIView *springView;
@end

@implementation LayerSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LayerSize";
    
    self.springView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.springView.center = self.view.center;
    
    self.springView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.springView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView)];
    [self.springView addGestureRecognizer:tap];
}
- (void)tapView{
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    
    CGRect frame = self.springView.frame;
    
    if (frame.size.height == 100) {
        springAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(300, 300)];
    }else{
        springAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(100, 100)];
    }
    
    springAnimation.springBounciness = 20;
    springAnimation.springSpeed = 20;
    
    [self.springView.layer pop_addAnimation:springAnimation forKey:@"LayerSize"];
}
@end
