//
//  ExpenseForm.h
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Employee;

@interface ExpenseForm : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * signature;
@property (nonatomic, retain) NSNumber * notification;
@property (nonatomic, retain) NSString * remarks;
@property (nonatomic, retain) NSNumber * employeeId;
@property (nonatomic, retain) Employee *expenses;

@end
