//
//  UIDateTextField.h
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDateTextField : UITextField <UITextFieldDelegate>
@property (nonatomic, retain, readwrite) NSDate *currentDate;
@end
