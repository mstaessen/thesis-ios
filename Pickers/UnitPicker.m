//
//  MonthPicker.m
//  ExpenseApp
//
//  Created by Bert Outtier on 4/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "UnitPicker.h"

@interface UnitPicker ()
@property (nonatomic, retain, readwrite) NSDictionary *units;
@end

@implementation UnitPicker

@synthesize unitPickerDelegate = _unitPickerDelegate;
@synthesize unit = _unit;
@synthesize unitName = _unitName;

- (id)init:(id<UnitPickerDelegate>)delegateObject
{
	self = [super init];
    if (self) {
        // Initialization code
		self.delegate = self;
		self.unitPickerDelegate = delegateObject;
		self.showsSelectionIndicator = YES;
		
		_units = [[NSDictionary alloc] initWithObjectsAndKeys:
							  @"G20", @"1", @"G21", @"2", @"G22", @"3", @"G23", @"4", @"G30", @"5", @"G31", @"6", @"G32", @"7", @"G33", @"8", @"G34", @"9", @"G35", @"10", nil];
		
		_unit = [[[_units allKeys] objectAtIndex:0] intValue]; // Assumes 'message' is not empty
		_unitName = [_units objectForKey:[[_units allKeys] objectAtIndex:0]];
		[[self unitPickerDelegate] didSelectUnit:_unit withName:_unitName];
    }
    return self;
}

- (void) setUnit:(int) unit
{
	_unit = unit;
	NSArray *keys = [_units allKeys];
	int index = [keys indexOfObject:[NSString stringWithFormat:@"%d", unit]];
	_unitName = [_units objectForKey:[NSString stringWithFormat:@"%d", _unit]];
	[self selectRow:index inComponent:0 animated:YES];
	[[self unitPickerDelegate] didSelectUnit:_unit withName:_unitName];
}

#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{	
	return [_units count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	NSArray *values = [_units allValues];
	return [values objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	NSArray *keys = [_units allKeys];
	_unit = [[keys objectAtIndex:row] intValue];
	_unitName = [_units objectForKey:[keys objectAtIndex:row]];
	[[self unitPickerDelegate] didSelectUnit:_unit withName:_unitName];
}

@end
