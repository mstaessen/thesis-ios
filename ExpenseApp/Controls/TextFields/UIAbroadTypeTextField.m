//
//  UIAbroadTypeTextField.m
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "UIAbroadTypeTextField.h"
#import "AbroadTypePicker.h"

@interface UIAbroadTypeTextField ()
@property (nonatomic, retain, readwrite) AbroadTypePicker *typePicker;
@end

@implementation UIAbroadTypeTextField

@synthesize type = _type;

- (void) setType:(int) type
{
	_type = type;
	[_typePicker setType:type];
}

-(id) initWithCoder:(NSCoder *)aDecoder{
	if ((self = [super initWithCoder:aDecoder]))
	{
		self.delegate = self;
		
		// Initialization code
		_typePicker = [[AbroadTypePicker alloc] init:self];
		
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
		
		self.inputView = _typePicker;
		self.inputAccessoryView = dateToolbar;
	}
	
	return self;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    [_typePicker setType:_type];
}

- (void)didSelectType:(int)type withName:(NSString *)name
{
	self.text = name;
	_type = type;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	textField.text = _typePicker.typeName;
	_type = _typePicker.type;
	
	[textField resignFirstResponder];
    return TRUE;
}

- (IBAction)onDoneButtonClicked: (id) sender {
	self.text = _typePicker.typeName;
	_type = _typePicker.type;
	[self resignFirstResponder];
}

@end
