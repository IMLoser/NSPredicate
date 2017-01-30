//
//  HWSearchVC.m
//  NSPredicate
//
//  Created by 曹航玮 on 2017/1/28.
//  Copyright © 2017年 曹航玮. All rights reserved.
//

#import "HWSearchVC.h"

@interface HWSearchVC () <UISearchBarDelegate>

/**
 *  数据数组
 */
@property (strong, nonatomic) NSArray * dataArray;

/**
 *  联想到的数据数组
 */
@property (strong, nonatomic) NSArray * searchedArray;

@end

@implementation HWSearchVC

- (NSArray *)dataArray
{
    if (!_dataArray) {
        
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@".plist"];
        _dataArray = [NSArray arrayWithContentsOfFile:dataPath];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self settingNav];
}

// 初始化搜索条
- (void)settingNav
{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    searchBar.delegate = self;
    searchBar.placeholder = @"请查看Data.plist文件数据进行搜索 如:猫、东、淘";
    self.navigationItem.titleView = searchBar;
    
}

#pragma mark - < UISearchBarDelegate >

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", searchText];
    self.searchedArray = [self.dataArray filteredArrayUsingPredicate:pre];
    [self.tableView reloadData];
}

#pragma mark - < data >

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchedArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.searchedArray[indexPath.row];
    return cell;
}

#pragma mark - < delegate >

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.navigationItem.titleView resignFirstResponder];
}

@end
