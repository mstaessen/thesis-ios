//
//  EmployeeManager.h
//  ExpenseApp
//
//  Created by Bert Outtier on 5/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

@class EmployeeManager;
@protocol EmployeeManagerDelegate <NSObject>
@optional
@required
- (void)didLogIn:(Employee*)user;
- (void)didLogOut;
@end

@interface EmployeeManager : NSObject
{
	@private
	id <EmployeeManagerDelegate> employeeManagerDelegate;
	NSManagedObjectContext *context;
	Employee *user;
}

@property (nonatomic, assign) Employee* user;
@property (nonatomic, assign) NSManagedObjectContext *context;
@property (nonatomic, assign) id <EmployeeManagerDelegate> employeeManagerDelegate;


- (id)init:(id<EmployeeManagerDelegate>)delegateObject;
- (void) login:(NSString*)email password:(NSString*)password;
- (void) logout;
@end
