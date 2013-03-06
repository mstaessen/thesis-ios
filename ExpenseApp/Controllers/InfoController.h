//
//  InfoController.h
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIMonthTextField.h"
#import "UIUnitTextField.h"

@interface InfoController : UITableViewController
@property (weak, nonatomic) IBOutlet UIMonthTextField *txtDate;
@property (weak, nonatomic) IBOutlet UILabel *lblFirstName;
@property (weak, nonatomic) IBOutlet UILabel *lblLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UIUnitTextField *txtUnit;
@property (weak, nonatomic) IBOutlet UITextField *txtEmployeeNumber;

@end
