//
//  Backend.m
//  ExpenseApp
//
//  Created by Bert Outtier on 5/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "Backend.h"
#import "Expense.h"
//#import "EmployeeManager.h"


@implementation Backend

#pragma mark - Backend initialization

static Backend *sharedObject;

+ (Backend *) sharedInstance
{
	if (sharedObject == nil) {
		sharedObject = [[super allocWithZone:NULL] init];
		[Backend sharedInstance].um = [[EmployeeManager alloc] init:[Backend sharedInstance]];
		[Backend sharedInstance].em = [[ExpenseManager alloc] init:[Backend sharedInstance]];
	}
	return sharedObject;
}

+ (void)setDelegate:(id<BackendDelegate>)delegateObject
{
	[Backend sharedInstance].backendDelegate = delegateObject;
}

+ (NSString *) getSomeData
{
    // Ensure we are using the shared instance
    Backend *shared = [Backend sharedInstance];
    return shared.someData;
}

#pragma mark - User manipulations

+ (void) login:(NSString*)email password:(NSString *) password
{
	[[Backend sharedInstance].um login:email password:password];
}

- (void) didLogIn:(Employee *)user
{
	[[Backend sharedInstance].backendDelegate didLogIn:user];
}

+ (void) logout
{
//	um.logout();
//	em.deleteAllExpenses();
	[[Backend sharedInstance].um logout];
}

- (void) didLogOut
{
	[[Backend sharedInstance].backendDelegate didLogOut];
}

+ (NSString*) getFirstName
{
	return [[Backend sharedInstance].um getFirstName];
}

+ (NSString*) getLastName
{
	return [[Backend sharedInstance].um getLastName];
}

+ (NSString*) getEmail
{
	return [[Backend sharedInstance].um getEmail];
}

+ (NSString*) getEmployeeNumber
{
	return [[Backend sharedInstance].um getEmployeeNumber];
}

+ (NSString*) getFullName
{
	return [[Backend sharedInstance].um getFullName];
}

+ (NSNumber*) getUnitId
{
	return [[Backend sharedInstance].um getUnitId];
}

+ (bool) isAuthenticated
{
	return [[Backend sharedInstance].um isAuthenticated];
}


#pragma mark - Expenses manipulations

+ (void) createDomesticExpense:(NSDate*)date projectCode:(NSString*)projectCode amount:(NSNumber*)amount remarks:(NSString*)remarks evidence:(NSString*)evidence expenseTypeId:(int)expenseTypeId
{
//	em.createDomesticExpense(date, projectCode, amount, remarks, evidence, "EUR", expenseTypeId);
	[[Backend sharedInstance].em createDomesticExpense:date projectCode:projectCode amount:amount remarks:remarks evidence:evidence currency:@"EUR" expenseTypeId:expenseTypeId];
}

+ (void) createAbroadExpense:(NSDate*)date projectCode:(NSString*)projectCode amount:(NSNumber*)amount remarks:(NSString*)remarks evidence:(NSString*)evidence currency:(NSString*)currency expenseTypeId:(int)expenseTypeId
{
	[[Backend sharedInstance].em createAbroadExpense:date projectCode:projectCode amount:amount remarks:remarks evidence:evidence currency:currency expenseTypeId:expenseTypeId];
}

+ (NSArray*) getExpenses {
	return [[Backend sharedInstance].em getExpenses];
}

+ (Expense*) getExpense:(NSManagedObjectID *)Id
{
	return [[Backend sharedInstance].em getExpense:Id];
}

+ (void) updateExpense:(Expense*) expense
{
	return [[Backend sharedInstance].em updateExpense:expense];
}

+ (void) deleteExpense:(Expense*) expense
{
	return [[Backend sharedInstance].em deleteExpense:expense];
}

#pragma mark - Form manipulations

+ (void) send:(NSString*)signature remarks:(NSString*)remarks notification:(bool)notification
{
//	efm = new ExpenseFormManager(um.getId(), signature, remarks, notification, em.getExpenses());
//	efm.token = um.getToken();
//	efm.send();
}

+ (NSString*) getFormPDF:(int)formId filename:(NSString*)filename
{
//	return efm.getFormPDF(formId, filename);
}

+ (NSArray*) getExpenseForms
{
//	return efm.getExpenseForms(um.getToken());
}

#pragma mark - Currency stuff

+ (NSNumber*) convertToEuro:(NSNumber*)amount toCurrency:(NSString*)currency
{
//	return curAPI.convertToEuro(amount, currency);
}

+ (NSDictionary*) getCurrencies
{
//	get {
//		List<string> cl = curAPI.getCurrencies();
//		Dictionary<int, string> result = new Dictionary<int, string>();
//		
//		for (int i = 0; i < cl.Count; i++)
//		{
//			result.Add(i+1, cl[i]);
//		}
//		
//		return result;
//	}
}

#pragma mark - Projects

+ (NSDictionary*) getProjectCodes
{
//	get {
//		if(_projectCodes.Count <= 0) {
//			List<string> projects = em.getProjectCodeSuggestion(""); // Get all projects
//			
//			for (int i = 0; i < projects.Count; i++)
//			{
//				_projectCodes.Add(i+1, projects[i]);
//			}
//		}
//
//		return _projectCodes;
//	}
}

@end
