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
	return [[NSArray alloc] initWithObjects:
			@"G20", @"G30", @"G40",
			@"G60", @"G70", nil];
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

- (Expense *) getExpense:(NSManagedObjectID *) Id
{
	NSError* error;
	Expense *expense = (Expense *)[context existingObjectWithID:Id error:&error];
	
	if(expense){
		return expense;
	} else {
		NSLog(@"Error getting expense: %@, %@", error, [error userInfo]);
		abort();
	}
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
    	NSLog(@"Error deleting - error:%@",error);
    }
}

@end
