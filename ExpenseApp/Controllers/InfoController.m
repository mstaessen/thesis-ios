//
//  InfoController.m
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "InfoController.h"
#import "AppDelegate.h"
#import <CoreData/NSFetchRequest.h>
#import "Backend.h"

@interface InfoController ()

@end

NSManagedObjectContext *context;

@implementation InfoController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	if([Backend isAuthenticated])
	{
		_lblFirstName.text = [Backend getFirstName];
		_lblLastName.text = [Backend getLastName];
		_txtEmail.text = [Backend getEmail];
		_txtEmployeeNumber.text = [NSString stringWithFormat:@"%@", [Backend getEmployeeNumber]];
		NSLog(@"unit id: %@", [Backend getUnitId]);
		_txtUnit.unit = [[Backend getUnitId] integerValue];
	}
	else{
		NSLog(@"There should be a user logged in");
		abort();
	}
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view delegate


@end
