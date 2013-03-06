//
//  UICurrencyTextField.h
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrencyPicker.h"

@interface UICurrencyTextField : UITextField<CurrencyPickerDelegate, UITextFieldDelegate>
@property (nonatomic, strong) NSString* currency;
@end
