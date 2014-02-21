//
//  MMPPDFViewWithIntrinsic.m
//  MoedaeMailMimeApplicationPDFViewer
//
//  Created by Taun Chapman on 02/15/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import "MMPPDFViewWithIntrinsic.h"

@implementation MMPPDFViewWithIntrinsic

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	
    // Drawing code here.
}

-(NSSize) intrinsicContentSize {
    CGFloat docHeight = self.documentView.bounds.size.height;
    CGFloat height = self.frame.size.height;
    NSSize newSize = NSMakeSize(NSViewNoInstrinsicMetric, fmaxf(height, docHeight+100.0));
    return newSize;
}

-(void) viewFrameChanged:(NSView *)view {
    [self invalidateIntrinsicContentSize];
}

-(void) viewBoundsChanged:(NSView *)view {
    //    [self invalidateIntrinsicContentSize];
}

@end
