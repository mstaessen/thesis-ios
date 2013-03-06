//
//  DomesticController.m
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "DomesticController.h"
#import "Backend.h"
#import "NSData+Base64.h"

@interface DomesticController ()
@property (nonatomic, retain, readwrite) UIPopoverController* popover;
@property (nonatomic, retain, readwrite) UIImage *image;
@end

@implementation DomesticController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (IBAction)chooseEvidence:(UIButton *)sender {
	UIActionSheet *actionSheet;
	if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        actionSheet = [[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Choose photo", nil];
    } else {
		actionSheet = [[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take photo",@"Choose photo", nil];
	}
	actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
	
	[actionSheet showFromRect:self.imgEvidence.frame inView:self.parentViewController.view animated:YES];
}

- (IBAction)add:(UIButton *)sender {
	NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
	[f setNumberStyle:NSNumberFormatterDecimalStyle];
	NSNumber * amount = [f numberFromString:self.txtAmount.text];
	
	NSString *base64EncodedImage = [UIImageJPEGRepresentation(_image, 0.8) base64EncodedString];
	
	[Backend createDomesticExpense:self.txtDate.currentDate projectCode:self.txtProjectCode.project amount:amount remarks:self.txtRemarks.text evidence:base64EncodedImage expenseTypeId:self.txtType.type];
}

#pragma mark -
#pragma mark OverlayViewControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    _image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [self.imgEvidence setImage:_image];
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark ActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:  (NSInteger)buttonIndex {
	UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
	imagePicker.delegate = self;
	imagePicker.allowsEditing = YES;
	
	if(buttonIndex == 0) {
		if ([UIImagePickerController  isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
			imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
		}
		else {
			imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		}
	}
	else if(buttonIndex == 1) {
		if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
			imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		}
		else {
			return;
		}
	}
	else {
		return;
	}
	
	[self displayImagePicker:imagePicker];
}

- (void)displayImagePicker:(UIImagePickerController *)imagePicker {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		// present from popover
		self.popover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
		
		[self.popover presentPopoverFromRect:self.imgEvidence.frame//popOverRect
									  inView:self.view
					permittedArrowDirections:UIPopoverArrowDirectionLeft
									animated:YES];
	} else  {
		[self presentViewController:imagePicker animated:YES completion:nil];
		
	}
}

@end
