//
//  Backend.h
//  ExpenseApp
//
//  Created by Bert Outtier on 5/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmployeeManager.h"
#import "ExpenseManager.h"

@class Backend;
@protocol BackendDelegate <NSObject>
@optional
- (void)didLogIn:(Employee*)user;
- (void)didLogOut;
@required

@end

@interface Backend : NSObject <EmployeeManagerDelegate, ExpenseManagerDelegate>
{
	NSString *someData;
	id <BackendDelegate> backendDelegate;
}

@property (nonatomic, retain) NSString *someData;
@property (nonatomic, assign) id <BackendDelegate> backendDelegate;
@property (nonatomic, retain) EmployeeManager *um;
@property (nonatomic, retain) ExpenseManager *em;

+ (void) login:(NSString*)email password:(NSString *) password;
+ (void) logout;
+ (void) setDelegate:(id<BackendDelegate>)delegateObject;

+ (NSString*) getFirstName;
+ (NSString*) getLastName;
+ (NSString*) getEmail;
+ (NSString*) getEmployeeNumber;
+ (NSString*) getFullName;
+ (NSNumber*) getUnitId;
+ (bool) isAuthenticated;

#pragma mark - Expenses manipulations

+ (void) createDomesticExpense:(NSDate*)date projectCode:(NSString*)projectCode amount:(NSNumber*)amount remarks:(NSString*)remarks evidence:(NSString*)evidence expenseTypeId:(int)expenseTypeId;
+ (void) createAbroadExpense:(NSDate*)date projectCode:(NSString*)projectCode amount:(NSNumber*)amount remarks:(NSString*)remarks evidence:(NSString*)evidence currency:(NSString*)currency expenseTypeId:(int)expenseTypeId;
+ (NSArray*) getExpenses;
+ (Expense*) getExpense:(NSManagedObjectID *)Id;
+ (void) updateExpense:(Expense*) expense;
+ (void) deleteExpense:(Expense*) expense;

#pragma mark - Form manipulations

+ (void) send:(NSString*)signature remarks:(NSString*)remarks notification:(bool)notification;
+ (NSString*) getFormPDF:(int)formId filename:(NSString*)filename;
+ (NSArray*) getExpenseForms;

#pragma mark - Currency stuff

+ (NSNumber*) convertToEuro:(NSNumber*)amount toCurrency:(NSString*)currency;
+ (NSDictionary*) getCurrencies;

#pragma mark - Projects

+ (NSDictionary*) getProjectCodes;
@end
