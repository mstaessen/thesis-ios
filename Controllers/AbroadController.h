//
//  AbroadController.h
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDateTextField.h"
#import "UIProjectCodeTextField.h"
#import "UIAbroadTypeTextField.h"
#import "UICurrencyTextField.h"

@interface AbroadController : UITableViewController
@property (weak, nonatomic) IBOutlet UIDateTextField *txtDate;
@property (weak, nonatomic) IBOutlet UIProjectCodeTextField *txtProjectCode;
@property (weak, nonatomic) IBOutlet UIAbroadTypeTextField *txtType;
@property (weak, nonatomic) IBOutlet UITextField *txtAmount;
@property (weak, nonatomic) IBOutlet UILabel *lblAmountEuro;
@property (weak, nonatomic) IBOutlet UICurrencyTextField *txtCurrency;
@property (weak, nonatomic) IBOutlet UITextField *txtRemarks;
@property (weak, nonatomic) IBOutlet UIImageView *imgEvidence;

- (IBAction)chooseEvidence:(UIButton *)sender;
- (IBAction)add:(UIButton *)sender;

@end
