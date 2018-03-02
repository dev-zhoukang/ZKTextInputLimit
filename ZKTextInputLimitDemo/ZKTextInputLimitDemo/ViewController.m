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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _maxLengthLabel.text = @(_maxLengthStepper.value).stringValue;
    _textField.maxLength = _maxLengthStepper.value;
}

- (IBAction)stepperAction:(UIStepper *)sender {
    _textField.text = @"";
    _maxLengthLabel.text = @(sender.value).stringValue;
    _textField.maxLength = sender.value;
}

@end
