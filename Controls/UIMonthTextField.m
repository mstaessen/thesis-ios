//
//  UIMonthTextField.m
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "UIMonthTextField.h"
#import "MonthPicker.h"

@interface UIMonthTextField ()
@property (nonatomic, retain, readwrite) NSDate *currentDate;
@property (nonatomic, retain, readwrite) NSDateFormatter *dateFormatter;
@property (nonatomic, retain, readwrite) MonthPicker *monthPicker;
@end

@implementation UIMonthTextField

-(id) initWithCoder:(NSCoder *)aDecoder{
	if ((self = [super initWithCoder:aDecoder]))
	{
		self.delegate = self;
		
		// Initialization code
		NSDate *today = [NSDate date];
		_currentDate = today;
		_monthPicker = [[MonthPicker alloc] init:self];
		
		
		// Set up the date formatter
		_dateFormatter = [[NSDateFormatter alloc] init];
		[_dateFormatter setDateFormat:@"MMMM yyyy"];
		
		// Setup the dateToolbar
		UIToolbar *dateToolbar = [[UIToolbar alloc] init];
		dateToolbar.barStyle = UIBarStyleBlack;
		dateToolbar.Translucent = true;
		[dateToolbar sizeToFit];
		
		// Create a 'done' button for the dateToolbar
		UIBarButtonItem* dateDoneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButtonClicked:)];
		
		// Create flexible space
		UIBarButtonItem* dateFlex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
		
		// Add button and dateFlexible space to the dateToolbar
		[dateToolbar setItems:[NSArray arrayWithObjects:dateFlex, dateDoneButton, nil] animated:true];
		
		self.inputView = _monthPicker;
		self.inputAccessoryView = dateToolbar;
	}
	
	return self;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    [_monthPicker setDate:_currentDate];
}

- (void) MonthPickerDidSelectDate:(NSDate *)date {
	self.text = [_dateFormatter stringFromDate:date];
	_currentDate = date;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	textField.text = [_dateFormatter stringFromDate:[_monthPicker date]];
	_currentDate = [_monthPicker date];
	
	[textField resignFirstResponder];
    return TRUE;
}

- (IBAction)onDoneButtonClicked: (id) sender {
	self.text = [_dateFormatter stringFromDate:[_monthPicker date]];
	_currentDate = [_monthPicker date];
	[self resignFirstResponder];
}

@end
