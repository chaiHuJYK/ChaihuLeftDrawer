//
//  AppDelegate.h
//  QQ侧滑菜单Demo
//
//  Created by MCL on 16/7/13.
//  Copyright © 2016年 CHLMA. All rights reserved.
//

#import "LeftMenuTableView.h"
#import "MenuTableViewCell.h"

@interface LeftMenuTableView()<UITableViewDataSource, UITableViewDelegate>
{
    UIView *badgeView;
    UIView *badgeView1;
}
@property (nonatomic, strong) NSArray *dataSourceArr;
@property (nonatomic, strong) NSArray *imageSourceArr;
@property (nonatomic, strong) NSArray *classSourceArr;

@end

@implementation LeftMenuTableView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self =[super initWithFrame:frame];
    if (self) {
        
        self.delegate=self;
        self.dataSource=self;
        self.rowHeight = 58;
        self.scrollEnabled = YES;
        self.layoutMargins = UIEdgeInsetsZero;
        self.separatorInset = UIEdgeInsetsZero;
        self.classSourceArr= @[@"所有订单",@"客户管理",@"活动二维码",@"当面推",@"请假",@"消息",@"评价",@"版本检测",@"帮助",@"退出登录"];
        self.dataSourceArr= @[@"AllOrderlistViewController",@"CustomersViewController",@"ActivityCodeViewController",@"FaceToViewController",@"AskForLeaveViewController",@"MessagesViewController",@"CommentListViewController",@"VerSionCheck",@"HelpCenterViewController",@"Logout"];
        UIView *footerView = [[UIView alloc] init];
        footerView.backgroundColor = [UIColor whiteColor];
        self.tableFooterView = footerView;
    }
    return  self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _classSourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    cell.textLabel.text = [_classSourceArr objectAtIndex:indexPath.row];
    if (indexPath.row ==5) {
        //新建小红点
        if (badgeView) {
            [badgeView removeFromSuperview];
        }
        badgeView = [[UIView alloc]init];
        badgeView.layer.cornerRadius = 4;//圆形
        badgeView.backgroundColor = [UIColor redColor];//颜色：红色
        CGRect tabFrame = cell.frame;
        
        //确定小红点的位置
        float percentX = 50;
        CGFloat x = ceilf(percentX);
        CGFloat y = ceilf(0.1 * tabFrame.size.height+18);
        badgeView.frame = CGRectMake(x, y, 8, 8);//圆形大小为10
        [cell addSubview:badgeView];
        badgeView.hidden = NO;
    }
    
    if (indexPath.row ==7) {
        //新建小红点
        if (badgeView1) {
            [badgeView1 removeFromSuperview];
        }
        badgeView1 = [[UIView alloc]init];
        badgeView1.layer.cornerRadius = 4;//圆形
        badgeView1.backgroundColor = [UIColor redColor];//颜色：红色
        CGRect tabFrame = cell.frame;
        
        //确定小红点的位置
        float percentX = 80;
        CGFloat x = ceilf(percentX);
        CGFloat y = ceilf(0.1 * tabFrame.size.height+18);
        badgeView1.frame = CGRectMake(x, y, 8, 8);//圆形大小为10
        [cell addSubview:badgeView1];
        badgeView.hidden = NO;
    }
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了 tableView的第 %ld 个cell", (long)indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *actionName = _classSourceArr[indexPath.row];
    NSString *VCName = _dataSourceArr[indexPath.row];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:VCName forKey:actionName];
    if (_menuActionBlock) {
        _menuActionBlock(dic);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}


@end
