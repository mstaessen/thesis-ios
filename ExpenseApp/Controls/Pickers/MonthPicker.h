//
//  MonthPicker.h
//  ExpenseApp
//
//  Created by Bert Outtier on 4/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MonthPicker;
@protocol MonthPickerDelegate <NSObject>
@optional
- (void)MonthPickerDidSelectDate:(NSDate *)date;
@required
@end

@interface MonthPicker : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
{
	id <MonthPickerDelegate> monthPickerDelegate;
}
@property (nonatomic, assign) id <MonthPickerDelegate> monthPickerDelegate;
@property (nonatomic, strong) NSDate *date;

- (id)init:(id<MonthPickerDelegate>)delegateObject;

@end

