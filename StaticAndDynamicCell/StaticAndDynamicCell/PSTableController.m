//
//  PSTableController.m
//  StaticAndDynamicCell
//
//  Created by 彭帅 on 2017/5/15.
//  Copyright © 2017年 pengshuai. All rights reserved.
//

#import "PSTableController.h"

@interface PSTableController ()

@end

@implementation PSTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"静态与动态Cell的混用";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"6666"];

    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%s",__func__);
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%s",__func__);
    if (section == 1) {
        return 5;
    }else{
        return [super tableView:tableView numberOfRowsInSection:section];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__func__);
    if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"6666"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"6666"];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"我是动态的cell-%ld",indexPath.row];
        return cell;
    }else{
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__func__);
    if (indexPath.section == 1) {
        return 64;
    }else{
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__func__);
    if (indexPath.section == 1) {
        return [super tableView:tableView indentationLevelForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    }else{
        return [super tableView:tableView indentationLevelForRowAtIndexPath:indexPath];
    }
}


@end
