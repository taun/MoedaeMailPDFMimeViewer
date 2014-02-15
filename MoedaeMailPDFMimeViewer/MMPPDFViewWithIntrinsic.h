//
//  MMPPDFViewWithIntrinsic.h
//  MoedaeMailMimeApplicationPDFViewer
//
//  Created by Taun Chapman on 02/15/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import <Quartz/Quartz.h>
#import <QuartzCore/QuartzCore.h>

/*
 SubClass to help PDFView play nice with Autolayout.
 
 Sets the intrinsicContentSize height to the frame height.
 
 Leaves the width as NSViewNoInstrinsicMetric
 */
@interface MMPPDFViewWithIntrinsic : PDFView

-(void) viewFrameChanged: (NSView*) view;

-(void) viewBoundsChanged: (NSView*) view;

@end
