//
//  MainVC.m
//  AutoHeightTextDemo
//
//  Created by xiehewanbang on 2018/7/13.
//  Copyright © 2018年 xiehewanbang. All rights reserved.
//

#import "MainVC.h"
#import "FirstVC.h"
#import "SecondVC.h"

#define K_SCREEN_WIDTH                  ([[[UIDevice currentDevice] systemVersion] intValue] >= 7 ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].applicationFrame.size.width)
#define K_SCREEN_HEIGHT                 ([[[UIDevice currentDevice] systemVersion] intValue] >= 7 ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].applicationFrame.size.height)

@interface MainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *mTableView;

@property (nonatomic,strong)  NSArray  *  dataArray ;

@end

@implementation MainVC


-(NSArray *)dataArray
{
    if(!_dataArray){
        _dataArray = @[@"代码创建",@"Xib"];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ------------------------------- viewDidLoad----------------------------------



-(UITableView *)mTableView
{
    if(!_mTableView){
        _mTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, K_SCREEN_WIDTH, K_SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        [_mTableView setShowsVerticalScrollIndicator:NO];
        [_mTableView setShowsHorizontalScrollIndicator:NO];
        _mTableView.delegate = self;
        _mTableView.dataSource = self;
        _mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mTableView.backgroundColor = [UIColor clearColor];
    }
    return _mTableView;
}
#pragma mark ------------------------------- 关于TableView协议方法----------------------------------
/**
 secton 组数
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
/**
 row 行数
 */
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

/**
 cell
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"test";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text =[self.dataArray objectAtIndex:indexPath.row];
    return cell;
    
}
/**
 row height --行高度
 */
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
//header
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

//footer
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row ==0){
        [self.navigationController pushViewController:[FirstVC new] animated:YES];
    }else{
        [self.navigationController pushViewController:[SecondVC new] animated:YES];
    }
}


@end
