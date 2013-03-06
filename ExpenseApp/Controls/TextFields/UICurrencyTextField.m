//
//  UICurrencyTextField.m
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "UICurrencyTextField.h"
#import "CurrencyPicker.h"

@interface UICurrencyTextField ()
@property (nonatomic, retain, readwrite) CurrencyPicker *currencyPicker;
@end

@implementation UICurrencyTextField

@synthesize currency = _currency;

- (void) setCurrency:(NSString*) currency
{
	_currency = currency;
	[_currencyPicker setCurrency:currency];
}

-(id) initWithCoder:(NSCoder *)aDecoder{
	if ((self = [super initWithCoder:aDecoder]))
	{
		self.delegate = self;
		
		// Initialization code
		_currencyPicker = [[CurrencyPicker alloc] init:self];
		
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
		
		self.inputView = _currencyPicker;
		self.inputAccessoryView = dateToolbar;
	}
	
	return self;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    [_currencyPicker setCurrency:_currency];
}

- (void)didSelectCurrency:(NSString *)name
{
	self.text = name;
	_currency = name;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	textField.text = _currencyPicker.currency;
	_currency = _currencyPicker.currency;
	
	[textField resignFirstResponder];
    return TRUE;
}

- (IBAction)onDoneButtonClicked: (id) sender {
	self.text = _currencyPicker.currency;
	_currency = _currencyPicker.currency;
	[self resignFirstResponder];
}


@end
