//
//  AutoHeightTextView.m
//  ceshi2
//
//  Created by xiehewanbang on 2018/7/6.
//  Copyright © 2018年 xiehewanbang. All rights reserved.
//

#import "AutoHeightTextView.h"

@interface AutoHeightTextView ()<UITextViewDelegate>



@property (nonatomic,assign) CGFloat  minHeight;

@property (nonatomic,assign) CGFloat  constwidth;

@property (nonatomic,assign) NSInteger layoutTimes;


@end


@implementation AutoHeightTextView

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.delegate = self;
    [self initData];
    self.layoutTimes = 0;
}

- (instancetype)initWithMinHeight:(CGFloat)minHeight andConstWidth:(CGFloat)constwidth  andOrigin:(CGPoint)origin
{
    self = [super initWithFrame:CGRectMake(origin.x, origin.y, constwidth, minHeight)];
    if (self) {
        [self initData];
    }
    return self;
}



-(void)initData
{
    [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    self.maxNumber = 0;
    self.layoutTimes = 0;
}

-(void)layoutSubviews
{
    if(self.layoutTimes ==0){
        self.constwidth = self.frame.size.width;
        self.minHeight = self.frame.size.height;
    }
    self.layoutTimes ++;
}



// 接收值的变化
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    //直接赋值
    [self changeSize];
}

-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"text"];
}

-(void)textViewDidChange:(UITextView *)textView
{
    if(self.maxNumber!=0){
        if ([textView.text length] > self.maxNumber) {
            textView.text = [textView.text substringWithRange:NSMakeRange(0, self.maxNumber)];
            [textView.undoManager removeAllActions];
            [textView becomeFirstResponder];
            return;
        }
    }
    [self changeSize];

}

-(void)changeSize
{
    CGSize sizeThatFit=[self sizeThatFits:CGSizeMake(self.constwidth, 0)];//高度没有意义（可以不设）
    CGFloat height = 0;
    if(sizeThatFit.height>self.minHeight ){
        height = sizeThatFit.height;
    }else{
        height =self.minHeight;
    }
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,self.constwidth,height);
    [self changeHeight:self.frame.size.height];
}


-(void)changeHeight:(CGFloat)height
{
    [self.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *constraint, NSUInteger idx, BOOL *stop)
     {
         if ((constraint.firstItem == self)&&(constraint.firstAttribute == NSLayoutAttributeHeight))
         {
             constraint.constant = height;
         }
     }];
}



@end
