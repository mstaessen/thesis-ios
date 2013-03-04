//
//  MonthPicker.m
//  ExpenseApp
//
//  Created by Bert Outtier on 4/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "MonthPicker.h"

@interface MonthPicker ()
@property (nonatomic, retain, readwrite) NSArray *months;
@property (nonatomic, retain, readwrite) NSArray *years;
@property (readwrite) int currentYear;
@property (readwrite) int currentMonth;
@end

@implementation MonthPicker

@synthesize monthPickerDelegate = _monthPickerDelegate;
@synthesize date = _date;

- (id)init:(id<MonthPickerDelegate>)delegateObject
{
	self = [super init];
    if (self) {
        // Initialization code
		self.delegate = self;
		self.monthPickerDelegate = delegateObject;
		self.showsSelectionIndicator = YES;
		
		NSDateFormatter *df = [NSDateFormatter new];
		// change locale if the standard is not what you want
		_months = [df standaloneMonthSymbols];
		_years = [[NSArray alloc] initWithObjects:
				  @"2009", @"2010", @"2011",
				  @"2012", @"2013", nil];
		_currentYear = [[_years objectAtIndex:0] intValue];
		_currentMonth = 1;
		NSCalendar *calendar = [NSCalendar currentCalendar];
		NSDateComponents *components = [[NSDateComponents alloc] init];
		[components setDay:1];
		[components setMonth:_currentMonth];
		[components setYear:_currentYear];
		self.date = [calendar dateFromComponents:components];
		[[self monthPickerDelegate] MonthPickerDidSelectDate:self.date];
    }
    return self;
}

- (void)setDate:(NSDate*)newDate {
	//THIS is where you do the the setting!
	_date = newDate;
	
	NSCalendar* calendar = [NSCalendar currentCalendar];
	NSDateComponents* compoNents = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit fromDate:newDate]; // Get necessary date components
	
	_currentMonth = [compoNents month];
	_currentYear = [compoNents year];
	
	[[self monthPickerDelegate] MonthPickerDidSelectDate:_date];
	
	[self selectRow:(_currentMonth - 1) inComponent:0 animated:YES];
	[self selectRow:[_years indexOfObject:[NSString stringWithFormat:@"%d", _currentYear]] inComponent:1 animated:YES];
}


#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{

	switch (component) {
		case 0:
			return [_months count];
		case 1:
			return [_years count];
	}
	return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	switch (component) {
		case 0:
			return [_months objectAtIndex:row];
		case 1:
			return [_years objectAtIndex:row];
	}
	return @"Error";
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // When a value is selected in picker viewer, take its value and assign it to the text view
    //NSLog(@"Picker view row selected");
	switch (component) {
		case 0:
			_currentMonth = row + 1;
			break;
		case 1:
			_currentYear = [[_years objectAtIndex:row] intValue];
			break;
	}
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [[NSDateComponents alloc] init];
	[components setDay:1];
	[components setMonth:_currentMonth];
	[components setYear:_currentYear];
	self.date = [calendar dateFromComponents:components];
	[[self monthPickerDelegate] MonthPickerDidSelectDate:self.date];
}

@end
