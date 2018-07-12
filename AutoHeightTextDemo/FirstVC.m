//
//  FirstVC.m
//  ceshi2
//
//  Created by xiehewanbang on 2018/7/12.
//  Copyright © 2018年 xiehewanbang. All rights reserved.
//

#import "FirstVC.h"
#import "AutoHeightTextView.h"

@interface FirstVC ()

@property (nonatomic,strong)  AutoHeightTextView  *  mTextView ;

@end

@implementation FirstVC

-(AutoHeightTextView *)mTextView
{
    if(!_mTextView){
        _mTextView = [[AutoHeightTextView alloc]initWithMinHeight:50 andConstWidth:300 andOrigin:CGPointMake(0, 50)];
        _mTextView.backgroundColor = [UIColor greenColor];
    }
    return _mTextView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mTextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
