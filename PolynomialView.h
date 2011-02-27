//
//  PolynomialView.h
//  Polynomial
//
//  Created by Charles Feduke on 2/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PolynomialView : NSView {
	NSMutableArray *polynomials;
	BOOL blasted;
}

-(IBAction)createNewPolynomial:(id)sender;
-(IBAction)deleteRandomPolynomial:(id)sender;
-(IBAction)blast:(id)sender;
-(NSPoint)randomOffViewPosition;

@end
