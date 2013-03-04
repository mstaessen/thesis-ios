//
//  UIDateTextField.m
//  ExpenseApp
//
//  Created by Bert Outtier on 16/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "UIDateTextField.h"

@interface UIDateTextField ()
@property (nonatomic, retain, readwrite) NSDate *currentDate;
@property (nonatomic, retain, readwrite) NSDateFormatter *dateFormatter;
@property (nonatomic, retain, readwrite) UIDatePicker *datePicker;
@end

@implementation UIDateTextField

-(id) initWithCoder:(NSCoder *)aDecoder{
	if ((self = [super initWithCoder:aDecoder]))
	{
		self.delegate = self;
		
		// Initialization code
		NSDate *today = [NSDate date];
		_currentDate = today;
		_datePicker = [[UIDatePicker alloc] init];
		_dateFormatter = [[NSDateFormatter alloc] init];
		_dateFormatter.DateStyle = NSDateFormatterLongStyle;
		
		// Set up the date picker
		_datePicker.datePickerMode = UIDatePickerModeDate;
		NSDateComponents *components = [[NSDateComponents alloc] init];
		components.month = -2;
		NSDate *twoMonthsEarlier = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:today options:0];
		_datePicker.MinimumDate = twoMonthsEarlier;
		_datePicker.MaximumDate = today;
		
		[_datePicker addTarget:self action:@selector(onDateChanged:) forControlEvents:UIControlEventValueChanged];
		
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
		
		self.inputView = _datePicker;
		self.inputAccessoryView = dateToolbar;
	}
	
	return self;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    [_datePicker setDate:_currentDate animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	textField.text = [_dateFormatter stringFromDate:[_datePicker date]];
	_currentDate = [_datePicker date];
	
	[textField resignFirstResponder];
    return TRUE;
}

- (IBAction)onDateChanged: (id) sender{
	self.text = [_dateFormatter stringFromDate:[(UIDatePicker*)sender date]];
	_currentDate = [(UIDatePicker*)sender date];
}

- (IBAction)onDoneButtonClicked: (id) sender {
	self.text = [_dateFormatter stringFromDate:[_datePicker date]];
	_currentDate = [_datePicker date];
	[self resignFirstResponder];
}

@end
