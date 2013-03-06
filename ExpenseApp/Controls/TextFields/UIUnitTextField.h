//
//  UIUnitTextField.h
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnitPicker.h"

@interface UIUnitTextField : UITextField <UnitPickerDelegate, UITextFieldDelegate>
@property (nonatomic) int unit;
@end
