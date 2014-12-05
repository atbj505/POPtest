//
//  ViewFrameViewController.m
//  POPtest
//
//  Created by 杨启晖 on 14/12/5.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "ViewFrameViewController.h"

@interface ViewFrameViewController ()
@property (nonatomic, strong)UIView *springView;
@end

@implementation ViewFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ViewFrame";
    
    self.springView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    self.springView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.springView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)tapView{
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    
    if (self.springView.frame.size.height == 100) {
        springAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(SCREENWIDTH - 200, SCREENHEIGHT - 200, 200, 200)];
    }else{
        springAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
    }
    
    [self.springView pop_addAnimation:springAnimation forKey:@"ViewFrame"];
}
@end
