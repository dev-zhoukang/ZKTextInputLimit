//
//  ViewController.m
//  ZKTextInputLimitDemo
//
//  Created by Zhou Kang on 2018/3/2.
//  Copyright © 2018年 Zhou Kang. All rights reserved.
//

#import "ViewController.h"
#import "ZKTextInputLimit.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *maxLengthLabel;
@property (weak, nonatomic) IBOutlet UIStepper *maxLengthStepper;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _maxLengthLabel.text = @(_maxLengthStepper.value).stringValue;
    _textField.maxLength = _maxLengthStepper.value;
    _textView.maxLength = _maxLengthStepper.value;
}

- (IBAction)stepperAction:(UIStepper *)sender {
    _textField.text = @"";
    _maxLengthLabel.text = @(sender.value).stringValue;
    _textField.maxLength = sender.value;
    _textView.maxLength = sender.value;
}

@end
