//
//  ViewController.m
//  ceshi2
//
//  Created by xiehewanbang on 2018/7/4.
//  Copyright © 2018年 xiehewanbang. All rights reserved.
//

#import "ViewController.h"
#import "UIViewExt.h"
#import "AutoHeightTextView.h"
#import "FirstVC.h"

@interface ViewController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet AutoHeightTextView *mTextView;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//
//    BOOL open =   [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://140.206.189.148:17000/netphonepay/unionPay?transNo=1800070914374013##0"]];
//    NSLog(@"%d",open);
    
//    self.mTextView.text = @"我爱中大奖啊放辣椒水的飞机啊是否考虑的就是浪费空间的苏里科夫就是六块腹肌啊了是否考虑的就是浪费空间的苏里科夫就是六块腹肌啊了122";
//    [self.mTextView scrollRangeToVisible: NSMakeRange(self.mTextView.text.length-1, 1)];
    [self presentViewController:[FirstVC new] animated:YES completion:nil];
}



@end
