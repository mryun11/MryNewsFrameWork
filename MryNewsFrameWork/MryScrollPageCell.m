//
//  VCTableViewCell.m
//  MryNewsFrameWork
//
//  Created by mryun11 on 16/6/6.
//  Copyright © 2016年 mryun11. All rights reserved.
//

#import "MryScrollPageCell.h"

@interface MryScrollPageCell()

@end

@implementation MryScrollPageCell

- (void)setTableView:(UITableView *)tableView{
    [_tableView removeFromSuperview];
    _tableView = tableView;
    [self.contentView addSubview:tableView];
    tableView.transform = CGAffineTransformMakeRotation(90 * M_PI / 180);
}

- (void)layoutSubviews{
    self.tableView.frame = self.contentView.bounds;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
