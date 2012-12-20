//
//  Model.m
//  Dec20
//
//  Created by Hachi on 12/14/12.
//  Copyright (c) 2012 Hachi. All rights reserved.
//

#import "Model.h"

@implementation Model

-(id)init{
	self = [super init];
	if (self){
		tree = [NSArray arrayWithObjects:@"World",
					[NSArray arrayWithObjects:@"2012 Election",
				 		[NSArray arrayWithObjects:@"America",
						 	[NSArray arrayWithObjects:@"Barack Obama",nil],
							[NSArray arrayWithObjects:@"Mitt Romney",nil],
							[NSArray arrayWithObjects:@"Elect (November 6th)",nil],
						 	nil],
						[NSArray arrayWithObjects: 	@"Japan",
						 	[NSArray arrayWithObjects:@"Abe Shinzo",nil],
						 	[NSArray arrayWithObjects:@"Noda Yoshihiko",nil],
							[NSArray arrayWithObjects:@"Ishihara Shintaro",nil],
						 	[NSArray arrayWithObjects:@"Elect (December 16th)",nil],
							nil],
						[NSArray arrayWithObjects:@"South Korea",
						 	[NSArray arrayWithObjects:@"Park Geun-hye",nil],
						 	[NSArray arrayWithObjects:@"Moon Jae-in",nil],
							[NSArray arrayWithObjects:@"Elect (December 19th)",nil],
						 	nil],
						[NSArray arrayWithObjects:@"North Korea",
							[NSArray arrayWithObjects:@"Kim Jong-il",nil],
						 	[NSArray arrayWithObjects:@"Kim Jong-un",nil],
						 	[NSArray arrayWithObjects:@"No Election",nil],
							nil],
						nil],
					nil];
	}
	return self;
}


//Return the tree to which the indexPath leads.
-(NSArray *)tree:(NSIndexPath *)indexPath{
	NSArray *aa = tree;
	for (NSUInteger pp = 0 ; pp < indexPath.length ; ++pp){
		NSUInteger ii = [indexPath indexAtPosition:pp];
		aa = [aa objectAtIndex:ii+1];
	}
	return aa;
}


//Return the name of the tree number to which the indexPath leads.
-(NSString *)name:(NSIndexPath *)indexPath{
	NSArray *aa = [self tree:indexPath];
	return [aa objectAtIndex:0];
}


//Return the number of subtrees of the tree to which the indexPath leads.
-(NSUInteger)numberOfRows:(NSIndexPath *)indexPath{
	NSArray *aa = [self tree:indexPath];
	return aa.count - 1;
}


//Return the line of txt that should go in the specified row
//of the tree to which the indexPath leads.
-(NSString *)text:(NSIndexPath *)indexPath row:(NSUInteger)row{
	indexPath = [indexPath indexPathByAddingIndex:row];
	return [self name:indexPath];
}


@end
