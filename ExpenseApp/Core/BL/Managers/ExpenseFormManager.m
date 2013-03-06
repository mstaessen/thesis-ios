//
//  ExpenseFormManager.m
//  ExpenseApp
//
//  Created by Bert Outtier on 6/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "ExpenseFormManager.h"

@implementation ExpenseFormManager

- (void) initWithEmployeeid:(int)id signature:(NSString*)signature remarks:(NSString*)remarks notification:(bool)notification expenses:(NSArray*) expenses
{
	
}

- (void) setToken:(NSString*)token
{
//	this.token = token;
}

- (void) send
{
//	form.date = DateTime.Now;
//	sendForm();
}

- (void) send:(NSString*)signature remarks:(NSString*)remarks notifications:(bool)notifications expenses:(NSArray*)expenses
{
//	form.date = DateTime.Now;
//	form.signature = signature;
//	form.remarks = remarks;
//	form.expenses = expenses;
//	sendForm();
}

- (void) send:(int) employeeId signature:(NSString*)signature remarks:(NSString*)remarks notifications:(bool)notification expenses:(NSArray*)expenses
{
//	form.date = DateTime.Now;
//	form.employeeId = employeeId;
//	form.signature = signature;
//	form.remarks = remarks;
//	form.notification = notification;
//	form.expenses = expenses;
//	sendForm();
}

- (void) sendForm
{
//	try {
//		svc.saveExpense (token, form);
//	} catch (Exception ex) {
//		throw new ExpenseException("Error while save expense form.", ex);
//	}
}

- (NSArray*) getExpenseForms:token
{
//	try {
//		return svc.getExpenseForms (token);
//	} catch (Exception ex) {
//		throw new ExpenseException("Error while getting expense forms from API.", ex);
//	}
}

- (NSString*) getFormPDF:(int) formId filename:(NSString*) filename
{
//	try {
//		return svc.getExpenseFormPDF (token, formId, filename);
//	} catch (Exception ex) {
//		throw new ExpenseException("Error while getting expense form PDF", ex);
//	}
}

@end
