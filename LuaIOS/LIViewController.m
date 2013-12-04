//
//  LIViewController.m
//  LuaIOS
//
//  Created by ZKF on 13-12-3.
//  Copyright (c) 2013年 朱克锋. All rights reserved.
//

#import "LIViewController.h"

@interface LIViewController ()

@end

@implementation LIViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row + 1];
    return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"lllll");
   
}
@end
