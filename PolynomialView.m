//
//  PolynomialView.m
//  Polynomial
//
//  Created by Charles Feduke on 2/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PolynomialView.h"
#import "Polynomial.h"
#import <QuartzCore/QuartzCore.h>


@implementation PolynomialView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        polynomials = [[NSMutableArray alloc] init];
    }
    return self;
}

-(IBAction)createNewPolynomial:(id)sender {
	Polynomial *p = [[Polynomial alloc] init];
	[polynomials addObject:p];
	[self setNeedsDisplay:YES];
}

-(IBAction)deleteRandomPolynomial:(id)sender {
	if ([polynomials count] == 0)
	{
		NSBeep();
		return;
	}
	
	int i = random() % [polynomials count];
	[polynomials removeObjectAtIndex:i];
	[self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
	NSRect bounds = [self bounds];
	[[NSColor whiteColor] set];
	[NSBezierPath fillRect:bounds];
	CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
	
	CGRect cgBounds = *(CGRect *)&bounds;
	
	for (Polynomial *p in polynomials) {
		[p drawInRect:cgBounds inContext:ctx];
	}
}

@end
