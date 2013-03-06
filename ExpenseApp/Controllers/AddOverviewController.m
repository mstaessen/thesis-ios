//
//  AddOverviewController.m
//  ExpenseApp
//
//  Created by Bert Outtier on 14/02/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import "AddOverviewController.h"
#import "Backend.h"
#import "NSData+Base64.h"

@interface AddOverviewController ()
@property (nonatomic, retain, readwrite) NSArray *expenses;
@end

@implementation AddOverviewController

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
	_expenses = [Backend getExpenses];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
	return [_expenses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	Expense* expense = [_expenses objectAtIndex:indexPath.row];
	
    static NSString *CellIdentifier = @"ExpenseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    UIImageView* evidenceImageView = (UIImageView *)[cell viewWithTag:100];

	NSData* imageData = [NSData dataFromBase64String:expense.evidence];
	UIImage* image = [[UIImage alloc] initWithData:imageData];
	
	evidenceImageView.image = image;
	
	UILabel* lblDate = (UILabel*)[cell viewWithTag:101];
	NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	NSString *dateString = [dateFormatter stringFromDate:expense.date];
	lblDate.Text = dateString;
	
	UILabel* lblAmount = (UILabel*)[cell viewWithTag:102];

	if (![expense.currency isEqualToString:@"EUR"]) {
		lblAmount.text = [NSString stringWithFormat:@"%@ %@", expense.amount, expense.currency];
		
//		try{
//			lblAmount.Text = expense.amount.ToString() + " " + expense.currency + " (" + Backend.convertToEuro(expense.amount, expense.currency) + " €)";
//		}catch (Exception ex) {
//			lblAmount.Text = expense.amount.ToString() + " " + expense.currency;
//		}
	} else {
		lblAmount.text = [NSString stringWithFormat:@"%@ €", expense.amount];
	}
	
	UILabel* lblType = (UILabel*)[cell viewWithTag:103];
	lblType.text = [NSString stringWithFormat:@"type: %@", expense.expenseTypeId];
	
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
		[Backend deleteExpense:[_expenses objectAtIndex:indexPath.row]];
		_expenses = [Backend getExpenses];
		[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
