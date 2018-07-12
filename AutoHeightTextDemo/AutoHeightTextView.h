//
//  AutoHeightTextView.h
//  ceshi2
//
//  Created by xiehewanbang on 2018/7/6.
//  Copyright © 2018年 xiehewanbang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoHeightTextView : UITextView
/**
最多输入字数
 */
@property (nonatomic,assign)  NSInteger     maxNumber ;

/**
初始化方法
 */
- (instancetype)initWithMinHeight:(CGFloat)minHeight andConstWidth:(CGFloat)constwidth  andOrigin:(CGPoint)origin;




@end
