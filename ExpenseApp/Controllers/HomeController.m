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
}


- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear: animated];

	if([Backend isAuthenticated])
	{
		_lblWelcome.text = [NSString stringWithFormat:@"Welcome %@!", [Backend getFullName]];
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
}

- (void)didLogOut
{
	[self performSegueWithIdentifier:@"toLoginForm" sender:self];
}

@end
