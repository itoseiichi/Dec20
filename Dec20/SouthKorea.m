//
//  SouthKorea.m
//  Dec20
//
//  Created by Hachi on 12/14/12.
//  Copyright (c) 2012 Hachi. All rights reserved.
//

#import "SouthKorea.h"

@implementation SouthKorea

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	
	//SouthKorean Flag
	UIImage *image0 = [UIImage imageNamed:@"S_Korea_Flag.jpg"];
	CGPoint point0 = CGPointMake(0,0);
	[image0 drawAtPoint: point0];
	
	//Write Question
	UIFont *font00 = [UIFont boldSystemFontOfSize: 30.0];
    NSString *string00 = @"Next President is";
	CGSize size00 = [string00 sizeWithFont: font00];
	CGPoint point00 = CGPointMake((w - size00.width) / 2 , size00.height + 20);
	CGContextRef c_string00 = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(c_string00, 0, 1, 0, 1);
	[string00 drawAtPoint: point00 withFont: font00];
	
    //Photo&String
	UIImage *image1 = [UIImage imageNamed: @"pak.jpg"];
	UIImage *image2 = [UIImage imageNamed: @"mun.jpg"];
	NSString *string1a = @"Park Geun-hye";
	NSString *string2a = @"Moon Jae-in";
	NSString *string1b = @"Saenuri";
	NSString *string2b = @"Democratic";
	
	//Position
	CGPoint point1a = CGPointMake((w- image1.size.width) / 2,
								  h - image1.size.height - image2.size.height - 40);
	CGPoint point2a = CGPointMake((w - image2.size.width) / 2,
								  h - image2.size.height - 20);
	CGPoint point1b = CGPointMake((w - image1.size.width) / 2,
								  h - image2.size.height - 60);
	CGPoint point2b = CGPointMake((w - image2.size.width) / 2,
								  h - 40);
	//set Photo
	[image1 drawAtPoint: point1a];
	[image2 drawAtPoint: point2a];
	
	//set String
	UIFont *fonta = [UIFont boldSystemFontOfSize: 14.0];
	UIFont *fontb = [UIFont boldSystemFontOfSize: 14.0];
	CGContextRef c_string0 = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(c_string0, 0, 1, 0, 1);
	[string1a drawAtPoint: point1a withFont: fonta];
	[string2a drawAtPoint: point2a withFont: fonta];
	CGContextSetRGBFillColor(c_string0, 1, 0, 1, 1);
	[string1b drawAtPoint: point1b withFont: fontb];
	[string2b drawAtPoint: point2b withFont: fontb];

	//set Next
	CGContextRef cc = UIGraphicsGetCurrentContext();
	
	CGFloat rr = image1.size.width /2;
	CGRect point1z =CGRectMake(point1a.x,point1a.y,2*rr,2*rr);
	CGContextBeginPath(cc);
	CGContextAddEllipseInRect(cc , point1z);
	CGContextClosePath(cc);
	CGContextSetRGBStrokeColor(cc, 0.0 , 1.0 , 1.0 , 1.0);
	CGContextSetLineWidth(cc , 3.0);
	CGContextStrokePath(cc);
	
	CGContextBeginPath(cc);
	CGContextMoveToPoint(cc , point2a.x , point2a.y);
	CGContextAddLineToPoint(cc , point2a.x + image2.size.width , point2a.y + image2.size.height);
	CGContextMoveToPoint(cc , point2a.x , point2a.y + image2.size.height);
	CGContextAddLineToPoint(cc , point2a.x + image2.size.width , point2a.y);
	CGContextClosePath(cc);
	CGContextSetRGBStrokeColor(cc, 1.0 , 1.0 , 0.0 , 1.0);
	CGContextSetLineWidth(cc , 3.0);
	CGContextStrokePath(cc);

}


@end

