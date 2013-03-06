//
//  HomeController.m
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeController.h"
#import <CoreData/NSFetchRequest.h>
#import "Employee.h"

@interface HomeController ()

@end

NSManagedObjectContext *context;

@implementation HomeController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	context = [appDelegate managedObjectContext];
}


- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear: animated];
	
	NSError* error;
	
	NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
	[fetchRequest setFetchLimit:1];
	Employee *user = [[context executeFetchRequest:fetchRequest error:&error] lastObject];
	NSLog(@"firstname: %@", [user valueForKey:@"firstName"]);
	
	if(user)
	{
		_lblWelcome.text = [NSString stringWithFormat:@"Welcome %@ %@!", [user valueForKey:@"firstName"], [user valueForKey:@"lastName"]];
	}
	else{
		[self performSegueWithIdentifier:@"toLoginForm" sender:self];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logout:(UIBarButtonItem *)sender {
	
	NSLog(@"Pushed the logout button.");
	
	[Backend setDelegate:self];
	[Backend logout];
	
//	NSLog(@"Pushed the logout button.");
//	
//	NSError* error;
//	
//	NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
//	[fetchRequest setFetchLimit:1];
//	Employee *user = [[context executeFetchRequest:fetchRequest error:&error] lastObject];
//	NSLog(@"firstname: %@", [user valueForKey:@"firstName"]);
//	
//	if(user)
//	{
//		[context deleteObject:user];
//		if (![context save:&error]) {
//			/*
//			 Replace this implementation with code to handle the error appropriately.
//			 
//			 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
//			 */
//			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//			abort();
//		} else {
//			[self performSegueWithIdentifier:@"toLoginForm" sender:self];
//		}
//	}
}

- (void)didLogOut
{
	[self performSegueWithIdentifier:@"toLoginForm" sender:self];
}

@end
