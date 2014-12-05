//
//  ViewAlphaViewController.m
//  POPtest
//
//  Created by 杨启晖 on 14/12/5.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "ViewAlphaViewController.h"

@interface ViewAlphaViewController ()
@property (nonatomic, strong)UIView *springView;
@end

@implementation ViewAlphaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ViewAlpha";
    
    self.springView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    self.springView.center = self.view.center;
    
    self.springView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.springView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView)];
    
    [self.view addGestureRecognizer:tap];
}
- (void)tapView{
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
    
    if (self.springView.alpha == 1) {
        springAnimation.toValue = @0.5;
    }else{
        springAnimation.toValue = @1.0;
    }
    
    [self.springView pop_addAnimation:springAnimation forKey:@"ViewAlpha"];
}
@end
