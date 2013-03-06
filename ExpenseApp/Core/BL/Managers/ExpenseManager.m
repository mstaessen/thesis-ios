//
//  ExpenseManager.m
//  ExpenseApp
//
//  Created by Bert Outtier on 6/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "ExpenseManager.h"
#import "AppDelegate.h"

@implementation ExpenseManager

@synthesize expenseManagerDelegate = _expenseManagerDelegate;
@synthesize context = _context;

- (id)init:(id<ExpenseManagerDelegate>)delegateObject
{
	self = [super init];
    if (self) {
        self.expenseManagerDelegate = delegateObject;
		AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
		context = [appDelegate managedObjectContext];
    }
    return self;
}

- (NSArray*) getProjectCodeSuggestion:(NSString*) searchTerm
{
//	try {
//		return svc.getProjectCodeSuggestion (searchTerm);
//	} catch (Exception ex) {
//		throw new ExpenseException ("Error while getting project codes for searchterm : " + searchTerm, ex);
//	}
}

- (void) createDomesticExpense:(NSDate*)date projectCode:(NSString*)projectCode amount:(NSNumber*)amount remarks:(NSString*)remarks evidence:(NSString*)evidence currency:(NSString*)currency expenseTypeId:(int)expenseTypeId
{
	[self createExpense:date projectCode:projectCode amount:amount remarks:remarks evidence:evidence currency:currency expenseTypeId:expenseTypeId expenseLocationId:1];
}

- (void) createAbroadExpense:(NSDate*)date projectCode:(NSString*)projectCode amount:(NSNumber*)amount remarks:(NSString*)remarks evidence:(NSString*)evidence currency:(NSString*)currency expenseTypeId:(int)expenseTypeId
{
	[self createExpense:date projectCode:projectCode amount:amount remarks:remarks evidence:evidence currency:currency expenseTypeId:expenseTypeId expenseLocationId:2];
}

- (void) createExpense:(NSDate*)date projectCode:(NSString*)projectCode amount:(NSNumber*)amount remarks:(NSString*)remarks evidence:(NSString*)evidence currency:(NSString*)currency expenseTypeId:(int)expenseTypeId expenseLocationId:(int)expenseLocationId
{
	NSError* error;

	Expense *expense = (Expense *)[NSEntityDescription insertNewObjectForEntityForName:@"Expense" inManagedObjectContext:context];
	[expense setDate:date];
	[expense setProjectCode:projectCode];
	[expense setAmount:amount];
	[expense setRemarks:remarks];
	[expense setEvidence:evidence];
	[expense setCurrency:currency];
	[expense setExpenseTypeId:[NSNumber numberWithInt:expenseTypeId]];
	[expense setExpenseLocationId:[NSNumber numberWithInt:expenseLocationId]];
	
	if (![context save:&error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
}

- (NSArray*) getExpenses
{
	NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Expense"];
	NSError *error = nil;
	NSArray *results = [context executeFetchRequest:request error:&error];
	if (error != nil) {
		NSLog(@"Error getting all expense: %@, %@", error, [error userInfo]);
		abort();
	}
	return results;
}

- (Expense *) getExpense:(int) id
{
//	NSFetchRequest *request = [[NSFetchRequest alloc] init];
//	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Expense" inManagedObjectContext:context];
//	[request setEntity:entity];
//	
//	// Specify that the request should return dictionaries.
//	[request setResultType:NSManagedObjectResultType];
//	
//	// Create an expression for the key path.
//	NSExpression *keyPathExpression = [NSExpression expressionForKeyPath:@"id"];
//	
//	// Create an expression to represent the minimum value at the key path 'creationDate'
//	NSExpression *minExpression = [NSExpression expressionForFunction:@"min:" arguments:[NSArray arrayWithObject:keyPathExpression]];
//	
//	// Create an expression description using the minExpression and returning a date.
//	NSExpressionDescription *expressionDescription = [[NSExpressionDescription alloc] init];
//	
//	// The name is the key that will be used in the dictionary for the return value.
//	[expressionDescription setName:@"minDate"];
//	[expressionDescription setExpression:minExpression];
//	[expressionDescription setExpressionResultType:NSDateAttributeType];
//	
//	// Set the request's properties to fetch just the property represented by the expressions.
//	[request setPropertiesToFetch:[NSArray arrayWithObject:expressionDescription]];
//	
//	// Execute the fetch.
//	NSError *error = nil;
//	NSArray *objects = [managedObjectContext executeFetchRequest:request error:&error];
//	if (objects == nil) {
//		// Handle the error.
//	}
//	else {
//		if ([objects count] > 0) {
//			NSLog(@"Minimum date: %@", [[objects objectAtIndex:0] valueForKey:@"minDate"]);
//		}
//	}
}

- (void) updateExpense:(Expense*) expense
{
	NSError* error;
	if (![context save:&error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
}

- (void) deleteExpense:(Expense*) expense
{
	NSError* error;
	[context deleteObject:expense];
	if (![context save:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	} else {
		expense = nil;
	}
}

- (void) deleteAllExpenses
{
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Expense" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
	
    NSError *error;
    NSArray *items = [context executeFetchRequest:fetchRequest error:&error];
	
    for (Expense* expense in items) {
    	[context deleteObject:expense];
    	NSLog(@"Deleted");
    }
    if (![context save:&error]) {
    	DLog(@"Error deleting - error:%@",error);
    }
}

@end
