//
//  HomeController.m
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()

@end

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
	_lblWelcome.text = @"Dit is een test";
	
}


- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear: animated];
	
//	try {
//		if(Backend.isAuthenticated()) {
//			lblWelcome.Text = "Welcome " + Backend.getFullName () + "!";
//		} else {
			[self performSegueWithIdentifier:@"toLoginForm" sender:self];
//		}
//	} catch (Exception ex) {
//		new UIAlertView("Error", ex.Message, null, "ok", null).Show();
//	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logout:(UIBarButtonItem *)sender {
	NSLog(@"Pushed the logout button.");
}
@end
