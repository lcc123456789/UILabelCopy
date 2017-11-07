//
//  CC_CopyLable.m
//  UILable_Copy
//
//  Created by mac on 17/1/4.
//  Copyright © 2017年 lcc. All rights reserved.
//

#import "CC_CopyLable.h"

@interface CC_CopyLable()
//系统粘贴板
@property (nonatomic, strong)UIPasteboard *pasteBoard;
@end

@implementation CC_CopyLable
+ (instancetype)cc_CopyLableWithType:(LabelType)type{
    CC_CopyLable *copyLabel = [[self alloc]init];
    copyLabel.type = type;
    return copyLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.numberOfLines = 0;
        self.pasteBoard = [UIPasteboard generalPasteboard];
        [self attachTapHandle];
    }
    return self;
}

- (void)attachTapHandle {
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
   
    [self addGestureRecognizer:longPress];
}

//响应事件
- (void)handleTap:(UITapGestureRecognizer *)sender {
    [self becomeFirstResponder]; //UILabel默认是不能响应事件的，所以要让它成为第一响应者
    UIMenuController *menuVC = [UIMenuController sharedMenuController];
    [menuVC setTargetRect:self.frame inView:self.superview]; //定位Menu
    [menuVC setMenuVisible:YES animated:YES]; //展示Menu
}

- (BOOL)canBecomeFirstResponder { //指定UICopyLabel可以成为第一响应者 切忌不要把这个方法不小心写错了哟， 不要写成 becomeFirstResponder
    return YES;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender { //指定该UICopyLabel可以响应的方法
    if (action == @selector(copy:) && (self.type & LabelTypeCopy)) {
        return YES;
    }
    if (action == @selector(paste:) && (self.type & LabelTypePaste)) {
        return YES;
    }
    if (action == @selector(delete:) && (self.type & LabelTypeDelete)) {
        return YES;
    }
    if (action == @selector(selectAll:) && (self.type & LabelTypeSelectAll)) {
        return YES;
    }
    if (action == @selector(cut:) && (self.type & LabelTypeCut)) {
        return YES;
    }
    return NO;//隐藏系统默认选项
}

- (void)paste:(id)sender {
   
    self.text = self.pasteBoard.string;
    NSLog(@"粘贴的内容%@", self.pasteBoard.string);
    
    //self.backgroundColor = self.pasteBoard.color;
    
}

- (void)copy:(id)sender {
        self.pasteBoard.string = self.text;
        NSLog(@"复制:%@",self.pasteBoard.string);
   // self.pasteBoard.color = self.backgroundColor;
}

-(void)cut:(id)sender {
    self.pasteBoard.string = self.text;
    self.text = @"";
    NSLog(@"剪切");
}

- (void)delete:(id)sender {
    self.text = nil;
    self.pasteBoard = nil;
}

- (void)selectAll:(id)sender {
    UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
    pasteBoard.string = self.text;
    self.textColor = [UIColor blueColor];
    NSLog(@"全选的数据%@", pasteBoard.string);
}

@end
