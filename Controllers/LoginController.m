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

- (void) getUserInfo:(NSString*)token
{
	
//	NSData* responseData;
	
	//Login post request
	NSString *post = [NSString stringWithFormat:@"token=%@", token];
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://kulcapexpenseapp.appspot.com/resources/userService/getEmployee"]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
						   completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
							   if (error)
							   {
								   NSLog(@"Error,%@", [error localizedDescription]);
								   // Show alert
								   UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
																					 message:[error localizedDescription]
																					delegate:nil
																		   cancelButtonTitle:@"OK"
																		   otherButtonTitles:nil];
								   [message show];
							   }
							   else
							   {
								   NSString* jsonInfo = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
								   
								   if ([jsonInfo length] > 0) {
									   NSLog(@"token: %@", jsonInfo);
									   [self parseResponse:data token:token];
								   } else {
									   NSLog(@"Error, no data");
									   UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
																						 message:@"Could not get user info"
																						delegate:nil
																			   cancelButtonTitle:@"OK"
																			   otherButtonTitles:nil];
									   [message show];
								   }
							   }
							   
						   }
	 ];
}

- (void) parseResponse:(NSData*) responseData token:(NSString*)token
{
	NSError* error;
    NSDictionary* json = [NSJSONSerialization
						  JSONObjectWithData:responseData //1
						  
						  options:kNilOptions
						  error:&error];
	
//    NSLog(@"id: %@, unitId: %@, firstName: %@", [json objectForKey:@"id"], [json objectForKey:@"unitId"], [json objectForKey:@"firstName"]); //3
	
	AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	NSManagedObjectContext *context = [appDelegate managedObjectContext];
	/*
     We instantiate an instance of User using our custom init method.
     */
	Employee *user = (Employee*)[NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
	
    /*
     We set the value of the primary key field to what the user has typed in the usernameField text field.
     [newUser sm_primaryKeyField] will return the userPrimaryKeyField value from the referenced SMClient instance.
     */
	[user setToken:token];
	[user setUserId:[NSNumber numberWithInt:[[json objectForKey:@"id"] intValue]]];
	[user setFirstName:(NSString*)[json objectForKey:@"firstName"]];
	[user setLastName:(NSString*)[json objectForKey:@"lastName"]];
	[user setEmail:(NSString*)[json objectForKey:@"email"]];
	[user setEmployeeNumber:[NSNumber numberWithInt:[[json objectForKey:@"employeeNumber"] intValue]]];
	[user setPassword:(NSString*)[json objectForKey:@"password"]];
	[user setUnitId:[NSNumber numberWithInt:[[json objectForKey:@"unitId"] intValue]]];
	
	if (![context save:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
	
	NSLog(@"user: %@", user);
	
	[self dismissViewControllerAnimated:YES completion:nil];
	
}

#pragma mark - Table view delegate

- (IBAction)login:(UIButton *)sender {
	NSLog(@"email: %@ password: %@", _txtEmail.text, _txtPassword.text);
	
	//Login post request
	NSString *post = [NSString stringWithFormat:@"email=%@&password=%@", _txtEmail.text, _txtPassword.text];
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://kulcapexpenseapp.appspot.com/resources/userService/login"]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
						   completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
							   if (error)
							   {
								   NSLog(@"Error,%@", [error localizedDescription]);
								   // Show alert
								   UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
																					 message:[error localizedDescription]
																					delegate:nil
																		   cancelButtonTitle:@"OK"
																		   otherButtonTitles:nil];
								   [message show];
							   }
							   else
							   {
								   NSString* token = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
								   
								   if ([token length] > 0) {
									   NSLog(@"token: %@", token);
									   [self getUserInfo: token];
								   } else {
									   NSLog(@"Error, no data");
									   UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
																						 message:@"No response from webserver"
																						delegate:nil
																			   cancelButtonTitle:@"OK"
																			   otherButtonTitles:nil];
									   [message show];
								   }
							   }
							   
						   }
	];
}

@end
