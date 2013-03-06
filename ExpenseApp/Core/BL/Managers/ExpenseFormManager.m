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

public void send (int employeeId, string signature, string remarks, bool notification, List<Expense> expenses)
{
//	form.date = DateTime.Now;
//	form.employeeId = employeeId;
//	form.signature = signature;
//	form.remarks = remarks;
//	form.notification = notification;
//	form.expenses = expenses;
//	sendForm();
}

private void sendForm ()
{
	try {
		svc.saveExpense (token, form);
	} catch (Exception ex) {
		throw new ExpenseException("Error while save expense form.", ex);
	}
}

public List<SavedExpenseForm> getExpenseForms (string token)
{
	try {
		return svc.getExpenseForms (token);
	} catch (Exception ex) {
		throw new ExpenseException("Error while getting expense forms from API.", ex);
	}
}

public string getFormPDF (int formId, string filename)
{
	try {
		return svc.getExpenseFormPDF (token, formId, filename);
	} catch (Exception ex) {
		throw new ExpenseException("Error while getting expense form PDF", ex);
	}
}

@end
