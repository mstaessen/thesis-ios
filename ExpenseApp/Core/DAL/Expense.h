//
//  Expense.h
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Expense : NSManagedObject

@property (nonatomic, retain) NSNumber * expenseTypeId;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * projectCode;
@property (nonatomic, retain) NSNumber * amount;
@property (nonatomic, retain) NSString * remarks;
@property (nonatomic, retain) NSString * evidence;
@property (nonatomic, retain) NSString * currency;
@property (nonatomic, retain) NSNumber * expenseLocationId;

@end
