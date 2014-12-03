//
//  RYTableViewController.m
//  POPtest
//
//  Created by 杨启晖 on 14/12/3.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "RYTableViewController.h"

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
    NSDictionary *combinDic = @{@"type":@"CombineAnimation",@"animations":@[@" POPbox"]};
    
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
