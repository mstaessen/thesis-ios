//
//  UIDomesticTypeTextField.h
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DomesticTypePicker.h"

@interface UIDomesticTypeTextField : UITextField <DomesticTypePickerDelegate, UITextFieldDelegate>
@property (nonatomic) int type;
@end
