//
//  MonthPicker.m
//  ExpenseApp
//
//  Created by Bert Outtier on 4/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "DomesticTypePicker.h"

@interface DomesticTypePicker ()
@property (nonatomic, retain, readwrite) NSDictionary *types;
@end

@implementation DomesticTypePicker

@synthesize domesticTypePickerDelegate = _domesticTypePickerDelegate;
@synthesize type = _type;
@synthesize typeName = _typeName;

- (id)init:(id<DomesticTypePickerDelegate>)delegateObject
{
	self = [super init];
    if (self) {
        // Initialization code
		self.delegate = self;
		self.domesticTypePickerDelegate = delegateObject;
		self.showsSelectionIndicator = YES;
		
		_types = [[NSDictionary alloc] initWithObjectsAndKeys:
				  @"Hotel", @"1", @"Lunch", @"2", @"Diner", @"3", @"Ticket", @"4", @"Restaurant", @"5", @"Other...", @"6", nil];
		
		_type = [[[_types allKeys] objectAtIndex:0] intValue]; // Assumes 'message' is not empty
		_typeName = [_types objectForKey:[[_types allKeys] objectAtIndex:0]];
		[[self domesticTypePickerDelegate] didSelectType:_type withName:_typeName];
    }
    return self;
}

- (void) setType:(int) type
{
	_type = type;
	NSArray *keys = [_types allKeys];
	int index = [keys indexOfObject:[NSString stringWithFormat:@"%d", type]];
	_typeName = [_types objectForKey:[NSString stringWithFormat:@"%d", _type]];
	[self selectRow:index inComponent:0 animated:YES];
	[[self domesticTypePickerDelegate] didSelectType:_type withName:_typeName];
}

#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [_types count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	NSArray *values = [_types allValues];
	return [values objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	NSArray *keys = [_types allKeys];
	_type = [[keys objectAtIndex:row] intValue];
	_typeName = [_types objectForKey:[keys objectAtIndex:row]];
	[[self domesticTypePickerDelegate] didSelectType:_type withName:_typeName];
}

@end
