//
//  TableViewController.h
//  Dec20
//
//  Created by Hachi on 12/14/12.
//  Copyright (c) 2012 Hachi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;
@class America;
@class Japan;
@class SouthKorea;
@class NorthKorea;

@interface TableViewController : UITableViewController{
	Model *model;
	NSIndexPath *indexPath;
}

-(id)initWithStyle:(UITableViewStyle)style
		model:(Model *)mm
		indexPath:(NSIndexPath *)pp;

@end
