//
//  CurrencyPicker.m
//  ExpenseApp
//
//  Created by Bert Outtier on 5/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "CurrencyPicker.h"

@interface CurrencyPicker ()
@property (nonatomic, retain, readwrite) NSArray *currencies;
@end

@implementation CurrencyPicker

@synthesize currencyPickerDelegate = _currencyPickerDelegate;
@synthesize currency = _currency;

- (id)init:(id<CurrencyPickerDelegate>)delegateObject
{
	self = [super init];
    if (self) {
        // Initialization code
		self.delegate = self;
		self.currencyPickerDelegate = delegateObject;
		self.showsSelectionIndicator = YES;
		
		_currencies = [[NSArray alloc] initWithObjects:@"EUR", @"USD", @"GBP", nil];
		
		_currency = [_currencies objectAtIndex:0];
		[[self currencyPickerDelegate] didSelectCurrency:_currency];
    }
    return self;
}

- (void) setCurrency:(NSString *) currency
{
	_currency = currency;
	int index = [_currencies indexOfObject:currency];
	[self selectRow:index inComponent:0 animated:YES];
	[[self currencyPickerDelegate] didSelectCurrency:_currency];
}

#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [_currencies count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [_currencies objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	_currency = [_currencies objectAtIndex:row];
	[[self currencyPickerDelegate] didSelectCurrency:_currency];
}

@end
