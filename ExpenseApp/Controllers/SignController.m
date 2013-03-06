//
//  SignController.m
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "SignController.h"
#import "MyCustomNavigationController.h"
#import "NSData+Base64.h"

@interface SignController ()

@end

@implementation SignController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)send:(UIBarButtonItem *)sender {
	
	self.txtRemarks.text;
	self.swNotifications;
	NSString *base64EncodedImage = [UIImageJPEGRepresentation([self.signatureView getSignatureImage], 0.8) base64EncodedString];
	NSLog(@"remarks: %@ switch: %c image: %@", self.txtRemarks.text, self.swNotifications.isEnabled, base64EncodedImage);
}

- (IBAction)clear:(UIButton *)sender {
	NSLog(@"We clearen");
	[self.signatureView clearSignature];
}



@end
