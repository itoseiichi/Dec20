//
//  Model.h
//  Dec20
//
//  Created by Hachi on 12/14/12.
//  Copyright (c) 2012 Hachi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject{
	NSArray *tree;
}

-(NSString *)name:(NSIndexPath *)indexPath;
-(NSUInteger)numberOfRows:(NSIndexPath *)indexPath;
-(NSString *)text:(NSIndexPath *)indexPath row:(NSUInteger)row;
@end
