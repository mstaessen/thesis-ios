//
//  ExpenseForm.h
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Expense;

@interface ExpenseForm : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * signature;
@property (nonatomic, retain) NSNumber * notification;
@property (nonatomic, retain) NSString * remarks;
@property (nonatomic, retain) NSNumber * employeeId;
@property (nonatomic, retain) NSSet *expenses;
@end

@interface ExpenseForm (CoreDataGeneratedAccessors)

- (void)addExpensesObject:(Expense *)value;
- (void)removeExpensesObject:(Expense *)value;
- (void)addExpenses:(NSSet *)values;
- (void)removeExpenses:(NSSet *)values;

@end
