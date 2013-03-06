//
//  UIProjectCodeTextField.m
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "UIProjectCodeTextField.h"
#import "ProjectPicker.h"

@interface UIProjectCodeTextField ()
@property (nonatomic, retain, readwrite) ProjectPicker *projectPicker;
@end

@implementation UIProjectCodeTextField

@synthesize project = _project;

- (void) setProject:(NSString*) project
{
	_project = project;
	[_projectPicker setProject:project];
}

-(id) initWithCoder:(NSCoder *)aDecoder{
	if ((self = [super initWithCoder:aDecoder]))
	{
		self.delegate = self;
		
		// Initialization code
		_projectPicker = [[ProjectPicker alloc] init:self];
		
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
		
		self.inputView = _projectPicker;
		self.inputAccessoryView = dateToolbar;
	}
	
	return self;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    [_projectPicker setProject:_project];
}

- (void)didSelectProject:(NSString *)name
{
	self.text = name;
	_project = name;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	textField.text = _projectPicker.project;
	_project = _projectPicker.project;
	
	[textField resignFirstResponder];
    return TRUE;
}

- (IBAction)onDoneButtonClicked: (id) sender {
	self.text = _projectPicker.project;
	_project = _projectPicker.project;
	[self resignFirstResponder];
}

@end
