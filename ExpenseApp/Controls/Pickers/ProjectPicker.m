//
//  ProjectPicker.m
//  ExpenseApp
//
//  Created by Bert Outtier on 5/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "ProjectPicker.h"

@interface ProjectPicker ()
@property (nonatomic, retain, readwrite) NSArray *projects;
@end

@implementation ProjectPicker

@synthesize projectPickerDelegate = _projectPickerDelegate;
@synthesize project = _project;

- (id)init:(id<ProjectPickerDelegate>)delegateObject
{
	self = [super init];
    if (self) {
        // Initialization code
		self.delegate = self;
		self.projectPickerDelegate = delegateObject;
		self.showsSelectionIndicator = YES;
		
		_projects = [[NSArray alloc] initWithObjects:@"G20sfgasj", @"G35klsdfghk", @"G40skdghls", nil];
		
		_project = [_projects objectAtIndex:0];
		[[self projectPickerDelegate] didSelectProject:_project];
    }
    return self;
}

- (void) setCurrency:(NSString *) currency
{
	_project = currency;
	int index = [_projects indexOfObject:currency];
	[self selectRow:index inComponent:0 animated:YES];
	[[self projectPickerDelegate] didSelectProject:_project];
}

#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [_projects count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [_projects objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	_project = [_projects objectAtIndex:row];
	[[self projectPickerDelegate] didSelectProject:_project];
}

@end
