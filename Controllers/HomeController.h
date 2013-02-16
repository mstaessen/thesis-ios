//
//  HomeController.h
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblWelcome;

- (IBAction)logout:(UIBarButtonItem *)sender;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end