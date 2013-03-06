//
//  Backend.h
//  ExpenseApp
//
//  Created by Bert Outtier on 5/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmployeeManager.h"

@class Backend;
@protocol BackendDelegate <NSObject>
@optional
- (void)didLogIn:(Employee*)user;
- (void)didLogOut;
@required

@end

@interface Backend : NSObject <EmployeeManagerDelegate>
{
	NSString *someData;
	id <BackendDelegate> backendDelegate;
	EmployeeManager* um;
}

@property (nonatomic, retain) NSString *someData;
@property (nonatomic, assign) id <BackendDelegate> backendDelegate;
@property (nonatomic, retain) EmployeeManager *um;

+ (void) login:(NSString*)email password:(NSString *) password;
+ (void) logout;
+ (void) setDelegate:(id<BackendDelegate>)delegateObject;
@end
