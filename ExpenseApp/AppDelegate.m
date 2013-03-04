//
//  AppDelegate.m
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "AppDelegate.h"
#import "HomeController.h"
#import "Expense.h"

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{	
	
	
	// Override point for customization after application launch.
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
	    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
	    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
	    splitViewController.delegate = (id)navigationController.topViewController;
	    
	    UINavigationController *masterNavigationController = splitViewController.viewControllers[0];
	    HomeController *controller = (HomeController *)masterNavigationController.topViewController;
	    controller.managedObjectContext = self.managedObjectContext;
	} else {
	    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
	    HomeController *controller = (HomeController *)navigationController.topViewController;
	    controller.managedObjectContext = self.managedObjectContext;
	}
	
	
	// Initialize RestKit
    NSURL *baseURL = [NSURL URLWithString:@"http://kulcapexpenseapp.appspot.com/resources"];
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:baseURL];
	
    // Enable Activity Indicator Spinner
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
	
//    // Initialize managed object store
//    NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
//    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
//    objectManager.managedObjectStore = managedObjectStore;
	
	//Login post request
//	NSString *post = @"email=bert.outtier@student.kuleuven.be&password=test123";
//	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//	NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
//	 
//	NSError *requestError;
//	NSURLResponse *urlResponse = nil;
//	
//	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://kulcapexpenseapp.appspot.com/resources/userService/login"]];
//	[request setHTTPMethod:@"POST"];
//	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//	[request setHTTPBody:postData];
//	
//	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
//	NSString *token = [NSString stringWithUTF8String:[data bytes]];
//	
//	if (urlResponse == nil) {
//		if (requestError != nil) {
//			NSLog(@"ERROR : %@", requestError);
//		}
//	}
//	else {
//		NSLog(@"Success: %@", token);
//	}
	
	
	// Project code request
	 
	 
    // Setup our object mappings
    /**
     Mapping by entity. Here we are configuring a mapping by targetting a Core Data entity with a specific
     name. This allows us to map back Twitter user objects directly onto NSManagedObject instances --
     there is no backing model class!
     */
//    RKEntityMapping *userMapping = [RKEntityMapping mappingForEntityForName:@"Employee" inManagedObjectStore:managedObjectStore];
//    userMapping.identificationAttributes = @[ @"userId" ];
//    [userMapping addAttributeMappingsFromDictionary:@{ @"id": @"userId" }];
//    // If source and destination key path are the same, we can simply add a string to the array
//    [userMapping addAttributeMappingsFromArray:@[ @"email" ]];
//	[userMapping addAttributeMappingsFromArray:@[ @"employeeNumber" ]];
//	[userMapping addAttributeMappingsFromArray:@[ @"firstName" ]];
//	[userMapping addAttributeMappingsFromArray:@[ @"lastName" ]];
//	[userMapping addAttributeMappingsFromArray:@[ @"password" ]];
//	[userMapping addAttributeMappingsFromArray:@[ @"unitId" ]];
//	
//	RKEntityMapping *expenseMapping = [RKEntityMapping mappingForEntityForName:@"Expense" inManagedObjectStore:managedObjectStore];
//	[expenseMapping addAttributeMappingsFromArray:@[ @"date" ]];
//	[expenseMapping addAttributeMappingsFromArray:@[ @"amount" ]];
//	[expenseMapping addAttributeMappingsFromArray:@[ @"currency" ]];
//	[expenseMapping addAttributeMappingsFromArray:@[ @"evidence" ]];
//	[expenseMapping addAttributeMappingsFromArray:@[ @"expenseLocationId" ]];
//	[expenseMapping addAttributeMappingsFromArray:@[ @"expenseTypeId" ]];
//	[expenseMapping addAttributeMappingsFromArray:@[ @"projectCode" ]];
//	[expenseMapping addAttributeMappingsFromArray:@[ @"remarks" ]];
//	
//	RKEntityMapping *expenseFormMapping = [RKEntityMapping mappingForEntityForName:@"ExpenseForm" inManagedObjectStore:managedObjectStore];
//	[expenseFormMapping addAttributeMappingsFromArray:@[ @"date" ]];
//	[expenseFormMapping addAttributeMappingsFromArray:@[ @"employeeId" ]];
//	[expenseFormMapping addAttributeMappingsFromArray:@[ @"notification" ]];
//	[expenseFormMapping addAttributeMappingsFromArray:@[ @"remarks" ]];
//	[expenseFormMapping addAttributeMappingsFromArray:@[ @"signature" ]];
//	[expenseFormMapping addAttributeMappingsFromArray:@[ @"expenses" ]];
//	
//	RKEntityMapping *savedExpenseFormMapping = [RKEntityMapping mappingForEntityForName:@"ExpenseForm" inManagedObjectStore:managedObjectStore];
//	savedExpenseFormMapping.identificationAttributes = @[ @"id" ];
//	[expenseFormMapping addAttributeMappingsFromArray:@[ @"id" ]];
//	[expenseFormMapping addAttributeMappingsFromArray:@[ @"date" ]];
//	[expenseFormMapping addAttributeMappingsFromArray:@[ @"statusId" ]];
//	[expenseFormMapping addAttributeMappingsFromArray:@[ @"employeeId" ]];
//	[expenseFormMapping addAttributeMappingsFromArray:@[ @"notification" ]];
//	[expenseFormMapping addAttributeMappingsFromArray:@[ @"remarks" ]];
//	[expenseFormMapping addAttributeMappingsFromArray:@[ @"signature" ]];
//	[expenseFormMapping addAttributeMappingsFromArray:@[ @"expenses" ]];
//	
//    // Update date format so that we can parse Twitter dates properly
//	// 2013-02-14T13:44:00.488Z
//    // Wed Sep 29 15:31:08 +0000 2010
//    [RKObjectMapping addDefaultDateFormatterForString:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" inTimeZone:nil];
//	
//	// Serialize to JSON
//	[RKObjectManager sharedManager].requestSerializationMIMEType = RKMIMETypeJSON;
//	
//	
//    // Register our mappings with the provider
//	RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:userMapping pathPattern:nil keyPath:@"/userService/getEmployee" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
	
	
	
	
	
//    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:tweetMapping
//                                                                                       pathPattern:@"/status/user_timeline/:username"
//                                                                                           keyPath:nil
//                                                                                       statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
//    [objectManager addResponseDescriptor:responseDescriptor];
	
	
//	Expense *exp1 = [[Expense alloc] init];
//	exp1.currency = @"EUR";
//	exp1.amount = [NSDecimalNumber numberWithFloat:25.57];
//	exp1.evidence = @"a long string";
//	exp1.expenseLocationId = [NSNumber numberWithInteger:1];
//	exp1.expenseTypeId = [NSNumber numberWithInteger:1];
//	exp1.projectCode = @"G20ennogiets";
//	exp1.remarks = @"een remark";
	
	
	
	
	
	
//
//    // Uncomment this to use XML, comment it to use JSON
//    //  objectManager.acceptMIMEType = RKMIMETypeXML;
//    //  [objectManager.mappingProvider setMapping:statusMapping forKeyPath:@"statuses.status"];
//    
//    // Database seeding is configured as a copied target of the main application. There are only two differences
//    // between the main application target and the 'Generate Seed Database' target:
//    //  1) RESTKIT_GENERATE_SEED_DB is defined in the 'Preprocessor Macros' section of the build setting for the target
//    //      This is what triggers the conditional compilation to cause the seed database to be built
//    //  2) Source JSON files are added to the 'Generate Seed Database' target to be copied into the bundle. This is required
//    //      so that the object seeder can find the files when run in the simulator.
//#ifdef RESTKIT_GENERATE_SEED_DB
//    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelInfo);
//    RKLogConfigureByName("RestKit/CoreData", RKLogLevelTrace);
//    
//    NSError *error;
//    NSString *seedStorePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"RKSeedDatabase.sqlite"];
//    RKManagedObjectImporter *importer = [[RKManagedObjectImporter alloc] initWithManagedObjectModel:managedObjectModel storePath:seedStorePath];
//    [importer importObjectsFromItemAtPath:[[NSBundle mainBundle] pathForResource:@"restkit" ofType:@"json"]
//                              withMapping:tweetMapping
//                                  keyPath:nil
//                                    error:&error];
//    [importer importObjectsFromItemAtPath:[[NSBundle mainBundle] pathForResource:@"users" ofType:@"json"]
//                              withMapping:userMapping
//                                  keyPath:@"user"
//                                    error:&error];
//    BOOL success = [importer finishImporting:&error];
//    if (success) {
//        [importer logSeedingInfo];
//    } else {
//        RKLogError(@"Failed to finish import and save seed database due to error: %@", error);
//    }
//	
//    // Clear out the root view controller
//    [self.window setRootViewController:[UIViewController new]];
//#else
//    /**
//     Complete Core Data stack initialization
//     */
//    [managedObjectStore createPersistentStoreCoordinator];
//    NSString *storePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"RKTwitter.sqlite"];
//    NSString *seedPath = [[NSBundle mainBundle] pathForResource:@"RKSeedDatabase" ofType:@"sqlite"];
//    NSError *error;
//    NSPersistentStore *persistentStore = [managedObjectStore addSQLitePersistentStoreAtPath:storePath fromSeedDatabaseAtPath:seedPath withConfiguration:nil options:nil error:&error];
//    NSAssert(persistentStore, @"Failed to add persistent store with error: %@", error);
//    
//    // Create the managed object contexts
//    [managedObjectStore createManagedObjectContexts];
//    
//    // Configure a managed object cache to ensure we do not create duplicate objects
//    managedObjectStore.managedObjectCache = [[RKInMemoryManagedObjectCache alloc] initWithManagedObjectContext:managedObjectStore.persistentStoreManagedObjectContext];
//#endif
	
	
	
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Saves changes in the application's managed object context before the application terminates.
	[self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ExpenseApp" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ExpenseApp.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
