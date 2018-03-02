//
//  UITextField+ZKInputLimit.m
//  ZKTextInputLimitDemo
//
//  Created by Zhou Kang on 2018/3/2.
//  Copyright © 2018年 Zhou Kang. All rights reserved.
//

#import "UITextField+ZKInputLimit.h"
#import <objc/runtime.h>

static void *kMaxLength_;

@implementation UITextField (ZKInputLimit)

- (void)setMaxLength:(NSUInteger)maxLength {
    objc_setAssociatedObject(self, &kMaxLength_, @(maxLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (!maxLength) {
        return;
    }
    [self addTarget:self action:@selector(handleTextEditingChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (NSUInteger)maxLength {
    NSNumber *lengthNum = objc_getAssociatedObject(self, &kMaxLength_);
    return [lengthNum unsignedIntegerValue];
}

- (void)handleTextEditingChanged:(UITextField *)textField {
    NSString *currentText = textField.text;
    NSUInteger maxLength = textField.maxLength;
    
    UITextRange *markedRange = [textField markedTextRange];
    if (!markedRange || !markedRange.start) {
        if (currentText.length > maxLength) {
            textField.text = [currentText substringToIndex:maxLength];
        }
    }
}

@end
