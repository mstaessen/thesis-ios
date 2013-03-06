//
//  ExpenseManager.h
//  ExpenseApp
//
//  Created by Bert Outtier on 6/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Expense.h"

@class ExpenseManager;
@protocol ExpenseManagerDelegate <NSObject>
@optional
@required

@end

@interface ExpenseManager : NSObject
{
@private
	id <ExpenseManagerDelegate> expenseManagerDelegate;
	NSManagedObjectContext *context;
}

@property (nonatomic, assign) NSManagedObjectContext *context;
@property (nonatomic, assign) id <ExpenseManagerDelegate> expenseManagerDelegate;


- (id)init:(id<ExpenseManagerDelegate>)delegateObject;
- (NSArray*) getProjectCodeSuggestion:(NSString*) searchTerm;
- (void) createDomesticExpense:(NSDate*)date projectCode:(NSString*)projectCode amount:(NSNumber*)amount remarks:(NSString*)remarks evidence:(NSString*)evidence currency:(NSString*)currency expenseTypeId:(int)expenseTypeId;
- (void) createAbroadExpense:(NSDate*)date projectCode:(NSString*)projectCode amount:(NSNumber*)amount remarks:(NSString*)remarks evidence:(NSString*)evidence currency:(NSString*)currency expenseTypeId:(int)expenseTypeId;
- (void) createExpense:(NSDate*)date projectCode:(NSString*)projectCode amount:(NSNumber*)amount remarks:(NSString*)remarks evidence:(NSString*)evidence currency:(NSString*)currency expenseTypeId:(int)expenseTypeId expenseLocationId:(int)expenseLocationId;
- (NSArray*) getExpenses;
- (Expense *) getExpense:(NSManagedObjectID *) id;
- (void) updateExpense:(Expense*) expense;
- (void) deleteExpense:(Expense*) expense;
- (void) deleteAllExpenses;
@end
