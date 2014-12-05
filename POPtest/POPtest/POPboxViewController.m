//
//  POPboxViewController.m
//  POPtest
//
//  Created by 杨启晖 on 14/12/5.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "POPboxViewController.h"

@interface POPboxViewController (){
    BOOL _isOpen;
    CGRect _hidePosition;
    CGRect _showPosition;
}
@property (nonatomic, strong)UIView *springView;
@end

@implementation POPboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"popBox";
    
    self.springView = [[UIView alloc]initWithFrame:CGRectMake(310, 60, 0, 0)];
    
    self.springView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.springView];
    
    _hidePosition = self.springView.frame;
    
    _showPosition = CGRectMake(260, 60, 50, 100);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(showPop)];
}
- (void)showPop{
    if (_isOpen) {
        [self hidePop];
        return;
    }
    _isOpen = YES;
    
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    
    springAnimation.fromValue = [NSValue valueWithCGRect:_hidePosition];
    
    springAnimation.toValue = [NSValue valueWithCGRect:_showPosition];
    
    [self.springView pop_addAnimation:springAnimation forKey:@"POPbox"];
}
- (void)hidePop{
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    
    springAnimation.fromValue = [NSValue valueWithCGRect:_showPosition];
    
    springAnimation.toValue = [NSValue valueWithCGRect:_hidePosition];
    
    [self.springView pop_addAnimation:springAnimation forKey:@"POPbox"];
    
    _isOpen = NO;
}
@end
