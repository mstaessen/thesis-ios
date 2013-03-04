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
#import "Employee.h"

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
	
	AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	context = [appDelegate managedObjectContext];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	NSError* error;
	
	NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
	[fetchRequest setFetchLimit:1];
	Employee *user = [[context executeFetchRequest:fetchRequest error:&error] lastObject];
	NSLog(@"firstname: %@", [user valueForKey:@"firstName"]);
	
	if(user)
	{
		_lblFirstName.text = [user firstName];
		_lblLastName.text = [user lastName];
		_txtEmail.text = [user email];
		_txtEmployeeNumber.text = [NSString stringWithFormat:@"%@", [user employeeNumber]];
	}
	else{
		NSLog(@"There should be a user logged in %@, %@", error, [error userInfo]);
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
