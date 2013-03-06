//
//  EmployeeManager.m
//  ExpenseApp
//
//  Created by Bert Outtier on 5/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "EmployeeManager.h"
#import "Employee.h"
#import "AppDelegate.h"

@implementation EmployeeManager

@synthesize employeeManagerDelegate = _employeeManagerDelegate;
@synthesize user = _user;
@synthesize context = _context;

- (id)init:(id<EmployeeManagerDelegate>)delegateObject
{
	self = [super init];
    if (self) {
        self.employeeManagerDelegate = delegateObject;
		AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
		context = [appDelegate managedObjectContext];
		[self fetchUser];
    }
    return self;
}

- (void) fetchUser
{
	NSError* error;
	
	NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
	[fetchRequest setFetchLimit:1];
	user = [[context executeFetchRequest:fetchRequest error:&error] lastObject];
}

#pragma mark - Login methods

- (void)login:(NSString *)email password:(NSString *)password
{
	NSLog(@"email: %@ password: %@", email, password);
	
	//Login post request
	NSString *post = [NSString stringWithFormat:@"email=%@&password=%@", email, password];
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
							   }
							   else
							   {
								   NSString* token = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
								   
								   if ([token length] > 0) {
									   NSLog(@"token: %@", token);
									   [self getUserInfo:token];
								   } else {
									   NSLog(@"Error, no data");
								   }
							   }
							   
						   }
	 ];
}

- (void) getUserInfo:(NSString*)token
{
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
								   abort();
							   }
							   else
							   {
								   NSString* jsonInfo = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
								   
								   if ([jsonInfo length] > 0) {
									   NSLog(@"token: %@", jsonInfo);
									   [self parseResponse:data token:token];
								   } else {
									   NSLog(@"Error, no data");
									   abort();
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
	
	
	/*
     We instantiate an instance of User using our custom init method.
     */
	if(!user)
	{
		user = (Employee*)[NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
	}	
	
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
	
	[[self employeeManagerDelegate] didLogIn:user];	
}

#pragma mark - Logout methods

- (void)logout
{	
	NSError* error;
	
	if(user)
	{
		[context deleteObject:user];
		if (![context save:&error]) {
			/*
			 Replace this implementation with code to handle the error appropriately.
			 
			 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
			 */
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
			abort();
		} else {
			user = nil;
			[self.employeeManagerDelegate didLogOut];
		}
	} else {
		NSLog(@"No user logged in");
		abort();
	}
}

#pragma mark - Getters

- (NSString*) getFirstName
{
	return user.firstName;
}

- (NSString*) getLastName
{
	return user.lastName;
}

- (NSString*) getEmail
{
	return user.email;
}

- (NSString*) getEmployeeNumber
{
	return user.employeeNumber;
}

- (NSString*) getFullName
{
	return [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
}

- (NSNumber*) getUnitId
{
	return user.unitId;
}

- (bool) isAuthenticated
{
	if(user)
		return YES;
	else
		return NO;
}

@end
