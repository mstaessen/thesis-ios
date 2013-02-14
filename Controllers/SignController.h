//
//  SignController.h
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDrawView.h"

@interface SignController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *swNotifications;
@property (weak, nonatomic) IBOutlet UITextField *txtRemarks;
@property (weak, nonatomic) IBOutlet UIDrawView *signatureView;

- (IBAction)send:(UIBarButtonItem *)sender;

@end
