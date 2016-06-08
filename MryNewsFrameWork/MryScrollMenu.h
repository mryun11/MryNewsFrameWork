//
//  MryScrollNav.h
//  MryNewsFrameWork
//
//  Created by mryun11 on 16/6/6.
//  Copyright © 2016年 mryun11. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MryScrollMenuDelegate <NSObject>

@optional

- (void)menuBtnClickAtIndex:(NSInteger)index;

@end

@interface MryScrollMenu : UIView

@property (nonatomic,weak) id<MryScrollMenuDelegate> delegate;

@property (nonatomic,weak) UIButton *selectedBtn;
@property (nonatomic,strong) NSMutableArray *menuArray;
@property (nonatomic,assign) BOOL isShowBreakline;

- (void)setbBreaklineColor:(UIColor *)color;
- (void)setselectedIndex:(NSInteger)index;

@end
