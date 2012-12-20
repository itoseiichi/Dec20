//
//  America.m
//  Dec20
//
//  Created by Hachi on 12/14/12.
//  Copyright (c) 2012 Hachi. All rights reserved.
//

#import "America.h"

@implementation America

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
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	//seven red stripes
	CGContextBeginPath(c);
	for (int i = 0; i <= 12; i = i + 2){
		CGContextAddRect(c, CGRectMake(i * w /13, 0, w / 13, h));
	}
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
	CGContextFillPath(c);
	
	//blue union jack
	CGContextBeginPath(c);
	CGContextAddRect(c, CGRectMake(w * 6 / 13, 0, w * 7 / 13, h * 2 / 5));
	CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 1.0);
	CGContextFillPath(c);
	
	//50 stars
	CGFloat radius = h / 50;
	for (float m=1 ; m<=9 ; m=m+2){
		for (float n=1 ; n<=11 ; n=n+2){
			CGPoint center = CGPointMake((6+(m/10*7))*w/13 , (n/12)*h*2/5);
			for (int tt=0 ; tt<=10 ; tt=tt+2){
				CGFloat theta = tt*2*M_PI/5;
				CGFloat tx = center.x + radius * cosf(theta);
				CGFloat ty = center.y - radius * sinf(theta);
				if (tt==0){
					CGContextBeginPath(c);
					CGContextMoveToPoint(c,tx,ty);
				}else{
					CGContextAddLineToPoint(c,tx,ty);
				}
			}
			CGContextClosePath(c);
			CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
			CGContextFillPath(c);
		}
	}
	
	for (float m=2 ; m<=9 ; m=m+2){
		for (float n=2 ; n<=11 ; n=n+2){
			CGPoint center = CGPointMake((6+(m/10*7))*w/13 , (n/12)*h*2/5);
			for (int tt=0 ; tt<=10 ; tt=tt+2){
				CGFloat theta = tt*2*M_PI/5;
				CGFloat tx = center.x + radius * cosf(theta);
				CGFloat ty = center.y - radius * sinf(theta);
				if (tt==0){
					CGContextBeginPath(c);
					CGContextMoveToPoint(c,tx,ty);
				}else{
					CGContextAddLineToPoint(c,tx,ty);
				}
			}
			CGContextClosePath(c);
			CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
			CGContextFillPath(c);
		}
	}
	
	//Write Question
	UIFont *font00 = [UIFont boldSystemFontOfSize: 30.0];
    NSString *string00 = @"Next President is";
	CGSize size00 = [string00 sizeWithFont: font00];
	CGPoint point00 = CGPointMake((w - size00.width) / 2 , size00.height + 20);
	CGContextRef c_string00 = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(c_string00, 0, 1, 0, 1);
	[string00 drawAtPoint: point00 withFont: font00];
	
    //Photo&String
	UIImage *image1 = [UIImage imageNamed: @"obama_smiling.jpg"];
	UIImage *image2 = [UIImage imageNamed: @"romney_lose.jpg"];
	NSString *string1a = @"Obama";
	NSString *string2a= @"Romney";
	NSString *string1b = @"Democratic";
	NSString *string2b = @"Republican";
	
	//Position
	CGPoint point1a = CGPointMake((w - image1.size.width) / 2,
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
	
	//set string
	UIFont *fonta = [UIFont boldSystemFontOfSize: 18.0];
	UIFont *fontb = [UIFont boldSystemFontOfSize: 15.0];
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
