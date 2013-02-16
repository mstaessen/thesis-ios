//
//  SavedExpenseForm.h
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ExpenseForm.h"


@interface SavedExpenseForm : ExpenseForm

@property (nonatomic, retain) NSNumber * statusId;
@property (nonatomic, retain) NSNumber * id;

@end
