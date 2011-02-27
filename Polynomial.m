//
//  Polynomial.m
//  Polynomial
//
//  Created by Charles Feduke on 2/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Polynomial.h"
#import <QuartzCore/QuartzCore.h>

#define HOPS (100)
#define RANDFLOAT() (random() % 128 / 128.0)

static CGRect funcRect = { -20, -20, 40, 40 };


@implementation Polynomial

-(id)init {
	[super init];
	
	color = CGColorCreateGenericRGB(RANDFLOAT(), RANDFLOAT(), RANDFLOAT(), 0.5);
	CFMakeCollectable(color);
	
	termCount = (random() % 3) + 2;
	terms = NSAllocateCollectable(termCount * sizeof(CGFloat), 0);
	
	int i;
	for (i = 0; i < termCount; i++) {
		terms[i] = 5.0 - (random() % 100)/10.0;
	}
	
	return self;
}

-(float)valueAt:(float)x {
	float result = 0;
	int i;
	for (i = 0; i < termCount; i++) {
		result = (result * x) + terms[i];
	}
	
	return result;
}

-(void)drawInRect:(CGRect)b inContext:(CGContextRef)ctx {
	NSLog(@"drawing");
	
	CGContextSaveGState(ctx);
	
	CGAffineTransform tf = CGAffineTransformMake(b.size.width / funcRect.size.width, 0, 0, b.size.height / funcRect.size.height, b.size.width / 2, b.size.height / 2);
	
	CGContextConcatCTM(ctx, tf);
	CGContextSetStrokeColorWithColor(ctx, color);
	CGContextSetLineWidth(ctx, 0.4);
	float distance = funcRect.size.width / HOPS;
	float currentX = funcRect.origin.x;
	BOOL first = YES;
	
	while (currentX <= funcRect.origin.x + funcRect.size.width) {
		float currentY = [self valueAt:currentX];
		if (first) {
			CGContextMoveToPoint(ctx, currentX, currentY);
			first = NO;
		} else {
			CGContextAddLineToPoint(ctx, currentX, currentY);
		}
		
		currentX += distance;
	}
	
	CGContextStrokePath(ctx);
	CGContextRestoreGState(ctx);
}

-(CGColorRef)color {
	return color;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
	CGRect cgb = [layer bounds];
	[self drawInRect:cgb inContext:ctx];
}

-(void)finalize {
	NSLog(@"finalizing %@", self);
	[super finalize];
}

@end
