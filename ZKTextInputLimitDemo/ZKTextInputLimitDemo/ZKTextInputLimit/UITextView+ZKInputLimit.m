//
//  UITextView+ZKInputLimit.m
//  ZKTextInputLimitDemo
//
//  Created by Zhou Kang on 2018/3/2.
//  Copyright © 2018年 Zhou Kang. All rights reserved.
//

#import "UITextView+ZKInputLimit.h"
#import <objc/runtime.h>

static void *kMaxLength_;

@implementation UITextView (ZKInputLimit)

- (void)setMaxLength:(NSUInteger)maxLength {
    objc_setAssociatedObject(self, &kMaxLength_, @(maxLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (maxLength) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextDidChange:) name:UITextViewTextDidChangeNotification object:self];
    }
}

- (NSUInteger)maxLength {
    return [objc_getAssociatedObject(self, &kMaxLength_) unsignedIntegerValue];
}

- (void)handleTextDidChange:(NSNotification *)noti {
    UITextView *textView = noti.object;
    NSString *currentText = textView.text;
    NSUInteger maxLength = textView.maxLength;
    
    UITextRange *markedRange = [textView markedTextRange];
    if (!markedRange || !markedRange.start) {
        if (currentText.length > maxLength) {
            textView.text = [currentText substringToIndex:maxLength];
        }
    }
}

@end
