//
//  UIUnitTextField.m
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "UIUnitTextField.h"
#import "UnitPicker.h"

@interface UIUnitTextField ()
@property (nonatomic, retain, readwrite) UnitPicker *unitPicker;
@end

@implementation UIUnitTextField

@synthesize unit = _unit;

- (void) setUnit:(int) unit
{
	_unit = unit;
	[_unitPicker setUnit:unit];
}

-(id) initWithCoder:(NSCoder *)aDecoder{
	if ((self = [super initWithCoder:aDecoder]))
	{
		self.delegate = self;
		
		// Initialization code
		_unitPicker = [[UnitPicker alloc] init:self];
		
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
		
		self.inputView = _unitPicker;
		self.inputAccessoryView = dateToolbar;
	}
	
	return self;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    [_unitPicker setUnit:_unit];
}

- (void)didSelectUnit:(int)unit withName:(NSString *)name
{
	self.text = name;
	_unit = unit;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	textField.text = _unitPicker.unitName;
	_unit = _unitPicker.unit;
	
	[textField resignFirstResponder];
    return TRUE;
}

- (IBAction)onDoneButtonClicked: (id) sender {
	self.text = _unitPicker.unitName;
	_unit = _unitPicker.unit;
	[self resignFirstResponder];
}

@end
