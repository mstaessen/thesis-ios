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
@end
