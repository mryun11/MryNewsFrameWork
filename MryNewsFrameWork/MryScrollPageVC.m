//
//  MryScrollPageVC.m
//  MryNewsFrameWork
//
//  Created by mryun11 on 16/6/7.
//  Copyright © 2016年 mryun11. All rights reserved.
//

#import "MryScrollPageVC.h"

@interface MryScrollPageVC ()<UITableViewDataSource,UITableViewDelegate,MryScrollMenuDelegate>

@property (nonatomic,weak) UITableView *containerTable;
@property (nonatomic,weak) MryScrollMenu *scrollMenu;

@end

@implementation MryScrollPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化滚动目录
    MryScrollMenu *scrollMenu = [[MryScrollMenu alloc]initWithFrame:self.menuframe];
    scrollMenu.delegate = self;
    scrollMenu.menuArray = self.menuArray;
    [self.view addSubview:scrollMenu];
    self.scrollMenu = scrollMenu;
    
    //初始化容器
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.transform = CGAffineTransformMakeRotation(270 * M_PI / 180);
    tableView.frame = self.tableframe;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.pagingEnabled = YES;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.containerTable = tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MryScrollPageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCellID"];
    if (cell == nil) {
        cell = [[MryScrollPageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableCellID"];
    }
    cell.tableView = self.tableArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.frame.size.width;
}

//拖动动画完成
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSIndexPath *indexPath = [self.containerTable indexPathForRowAtPoint:scrollView.contentOffset];
    [self.scrollMenu setselectedIndex: indexPath.row];
}

//点击目录
- (void)menuBtnClickAtIndex:(NSInteger)index{
    [self.containerTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
