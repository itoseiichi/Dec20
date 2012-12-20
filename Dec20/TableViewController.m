//
//  TableViewController.m
//  Dec20
//
//  Created by Hachi on 12/14/12.
//  Copyright (c) 2012 Hachi. All rights reserved.
//

#import "TableViewController.h"
#import "Model.h"
#import "America.h"
#import "Japan.h"
#import "SouthKorea.h"
#import "NorthKorea.h"


@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style model:(Model *)mm indexPath:(NSIndexPath *)pp{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
		model = mm;
		indexPath = [pp copy];
		self.title = [model name:indexPath];
		self.navigationItem.backBarButtonItem.title = self.title;
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - View lifecycle


- (void) viewDidLoad{
	[super viewDidLoad];
	
	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;
	
	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void) viewDidUnload{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void) viewWillAppear: (BOOL) animated{
	[super viewWillAppear: animated];
}


- (void) viewDidAppear: (BOOL) animated{
	[super viewDidAppear: animated];
}


- (void) viewWillDisappear: (BOOL) animated{
	[super viewWillDisappear: animated];
}


- (void) viewDidDisappear: (BOOL) animated{
	[super viewDidDisappear: animated];
}


- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation{
	// Return YES for supported orientations
	//return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}


#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    return [model numberOfRows:indexPath];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
		 					cellForRowAtIndexPath:(NSIndexPath *)pp{
    static NSString *CellIdentifier = @"Tree";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil){
		cell = [[UITableViewCell alloc]
				initWithStyle: UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];
	}
    
    // Configure the cell...
    cell.textLabel.text = [model text:indexPath row:pp.row];
	if ([model numberOfRows:[indexPath indexPathByAddingIndex:pp.row]] > 0){
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}else{
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
    return cell;
}


#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)pp{
    // Navigation logic may go here. Create and push another view controller.
	NSIndexPath *newIndexPath = [indexPath indexPathByAddingIndex:pp.row];
	
	if ([model numberOfRows:newIndexPath] > 0){
		TableViewController *tableViewController =
				[[TableViewController alloc] initWithStyle:UITableViewStylePlain
													 model:model indexPath:newIndexPath];
		[self.navigationController pushViewController:tableViewController animated:YES];
	}
	else{
		NSString *name = [model name:newIndexPath];
		NSString *string = [name stringByReplacingOccurrencesOfString:@" " withString:@"_"];
		UIViewController *viewController = [[UIViewController alloc]
											initWithNibName:nil bundle:nil];
		if (name == @"Elect (November 6th)"){
			UIScreen *ss = [UIScreen mainScreen];
			CGRect ff = [ss applicationFrame];
			viewController.view = [[America alloc] initWithFrame:ff];
		}else if (name == @"Elect (December 16th)"){
			UIScreen *ss = [UIScreen mainScreen];
			CGRect ff = [ss applicationFrame];
			viewController.view = [[Japan alloc] initWithFrame:ff];
		}else if (name == @"Elect (December 19th)"){
			UIScreen *ss = [UIScreen mainScreen];
			CGRect ff = [ss applicationFrame];
			viewController.view = [[SouthKorea alloc] initWithFrame:ff];
		}else if (name == @"No Election"){
			UIScreen *ss = [UIScreen mainScreen];
			CGRect ff = [ss applicationFrame];
			viewController.view = [[NorthKorea alloc] initWithFrame:ff];
		}else{
			string = [@"http://en.m.wikipedia.org/wiki/" stringByAppendingString:string];
			NSURL *url = [NSURL URLWithString:string];
			NSData *data = [NSData dataWithContentsOfURL:url];
			UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
			webView.scalesPageToFit = YES;
			[webView loadData:data MIMEType:@"text/html"
		 	textEncodingName:@"NSUTF8StringEncoding" baseURL:url];
			viewController.view = webView;
		}
		
		viewController.title = name;
		[self.navigationController pushViewController:viewController animated:YES];
	
		}
}

@end
