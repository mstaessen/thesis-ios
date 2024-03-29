//
//  DomesticController.h
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDateTextField.h"
#import "UIProjectCodeTextField.h"
#import "UIDomesticTypeTextField.h"

@interface DomesticController : UITableViewController <UIImagePickerControllerDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIDateTextField *txtDate;
@property (weak, nonatomic) IBOutlet UIProjectCodeTextField *txtProjectCode;
@property (weak, nonatomic) IBOutlet UIDomesticTypeTextField *txtType;
@property (weak, nonatomic) IBOutlet UITextField *txtAmount;
@property (weak, nonatomic) IBOutlet UITextField *txtRemarks;
@property (weak, nonatomic) IBOutlet UIImageView *imgEvidence;

- (IBAction)chooseEvidence:(UIButton *)sender;
- (IBAction)add:(UIButton *)sender;

@end
