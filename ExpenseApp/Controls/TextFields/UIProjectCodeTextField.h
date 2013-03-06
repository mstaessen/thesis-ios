//
//  UIProjectCodeTextField.h
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectPicker.h"

@interface UIProjectCodeTextField : UITextField<ProjectPickerDelegate, UITextFieldDelegate>
@property (nonatomic, strong) NSString* project;
@end
