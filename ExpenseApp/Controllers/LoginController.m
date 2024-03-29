//
//  LoginController.m
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "LoginController.h"
#import "Employee.h"
#import "AppDelegate.h"
#import "Backend.h"

@interface LoginController ()

@end

@implementation LoginController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (IBAction)login:(UIButton *)sender {
	
	NSLog(@"email: %@ password: %@", _txtEmail.text, _txtPassword.text);
	
	[Backend setDelegate:self];
	[Backend login:_txtEmail.text password:_txtPassword.text];
}

- (void)didLogIn:(Employee *)user
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
