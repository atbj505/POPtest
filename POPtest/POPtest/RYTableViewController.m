//
//  RYTableViewController.m
//  POPtest
//
//  Created by 杨启晖 on 14/12/3.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "RYTableViewController.h"
#import "LayerSizeViewController.h"
#import "LayerPositionViewController.h"
#import "ViewFrameViewController.h"
#import "ViewAlphaViewController.h"
#import "POPboxViewController.h"

@interface RYTableViewController (){
    NSArray *_titles;
}

@end

@implementation RYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"POPtest";
    
    NSDictionary *springDic = @{@"type":@"POPSpringAnimation",@"animations":@[@"kPOPLayerSize",@"kPOPLayerPosition",@"kPOPViewFrame"]};
    NSDictionary *basicDic = @{@"type":@"POPBasicAnimation",@"animations":@[@"kPOPViewAlpha"]};
    NSDictionary *combinDic = @{@"type":@"CombineAnimation",@"animations":@[@"POPbox"]};
    
    _titles = @[springDic,basicDic,combinDic];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _titles.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *senctionHeader = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    senctionHeader.text = _titles[section][@"type"];
    senctionHeader.backgroundColor = [UIColor lightGrayColor];
    senctionHeader.textAlignment = NSTextAlignmentLeft;
    senctionHeader.textColor = [UIColor whiteColor];
    senctionHeader.font = [UIFont systemFontOfSize:14];
    return senctionHeader;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = _titles[section][@"animations"];
    return array.count;
}

static NSString *identifier = @"cellIdentifier";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSArray *animations = _titles[indexPath.section][@"animations"];
    
    cell.textLabel.text = animations[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 0) {
                LayerSizeViewController *layerSize = [[LayerSizeViewController alloc]initWithNibName:nil bundle:nil];
                [self.navigationController pushViewController:layerSize animated:YES];
            }else if (indexPath.row == 1){
                LayerPositionViewController *layerPosition = [[LayerPositionViewController alloc]initWithNibName:nil bundle:nil];
                [self.navigationController pushViewController:layerPosition animated:YES];
            }else if (indexPath.row){
                ViewFrameViewController *viewFrame = [[ViewFrameViewController alloc]initWithNibName:nil bundle:nil];
                [self.navigationController pushViewController:viewFrame animated:YES];
            }
        }
            break;
        case 1:
        {
            ViewAlphaViewController *viewAlpha = [[ViewAlphaViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:viewAlpha animated:YES];
        }
            break;
            
        case 2:
        {
            POPboxViewController *popBox = [[POPboxViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:popBox animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
