//
//  Polynomial.h
//  Polynomial
//
//  Created by Charles Feduke on 2/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Polynomial : NSObject {
	__strong CGFloat * terms;
	int termCount;
	__strong CGColorRef color;
}

-(float)valueAt:(float)x;
-(void)drawInRect:(CGRect)b inContext:(CGContextRef)ctx;
-(CGColorRef)color;

@end
