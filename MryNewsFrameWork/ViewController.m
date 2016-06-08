//
//  ViewController.m
//  MryNewsFrameWork
//
//  Created by mryun11 on 16/6/6.
//  Copyright © 2016年 mryun11. All rights reserved.
//

#import "ViewController.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

    //设置数据源
    self.menuArray = [NSMutableArray arrayWithArray:@[@"推荐",@"热点",@"科技",@"体育",@"视频",@"要闻",@"时政",@"美女",@"搞笑",@"娱乐"]];
    self.tableArray = [NSMutableArray arrayWithCapacity:self.menuArray.count];
    for (NSString *title in self.menuArray) {
        MryPageTable *table = [[MryPageTable alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        table.title = title;
        [self.tableArray addObject:table];
    }
    
    //设置控件位置
    self.menuframe = CGRectMake(0, 20, ScreenW, 40);
    self.tableframe = CGRectMake(0, CGRectGetMaxY(self.menuframe), ScreenW, ScreenH - CGRectGetMaxY(self.menuframe));
    
    //调用父类方法加载控件
    [super viewDidLoad]; //最后执行
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
