//
//  MMPMApplicationPDF.m
//  MoedaeMailMimeApplicationPDFViewer
//
//  Created by Taun Chapman on 02/15/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import "MMPMApplicationPDF.h"
#import "MMPPDFViewWithIntrinsic.h"

@implementation MMPMApplicationPDF

+(NSSet*) contentTypes {
    return [NSSet setWithObjects:@"APPLICATION/PDF", nil];
}

-(void) loadData {
    NSData* nodeData = self.node.decoded;

    if (nodeData) {
        PDFDocument* document = [[PDFDocument alloc] initWithData: self.node.decoded];
        [(PDFView*)self.mimeView setDocument: document];
    } else {
#pragma message "ToDo: use NSURL to load a default PDF document as a placeholder if nodeData == nil"
        PDFDocument* document = [[PDFDocument alloc] initWithData: [NSData data]];
        [(PDFView*)self.mimeView setDocument: document];
    }
//    [((MMPMApplicationPDFMimeView*)self.mimeView).thumbnailView setPDFView: ((MMPMApplicationPDFMimeView*)self.mimeView).pdfView];
}

-(void) createSubviews {
    NSSize subStructureSize = self.frame.size;
    NSRect nodeRect = NSMakeRect(0, 0, subStructureSize.width, subStructureSize.height);

    PDFView* nodeView = [[MMPPDFViewWithIntrinsic alloc] initWithFrame: NSMakeRect(0, 0, subStructureSize.width, subStructureSize.height)];
    [nodeView setAutoScales: YES];
    [nodeView setAutoresizingMask: NSViewWidthSizable | NSViewHeightSizable];
    [nodeView setFrame: nodeRect];
    [nodeView setDisplayMode: kPDFDisplaySinglePage];
    [nodeView setDisplayBox: kPDFDisplayBoxArtBox];

    NSScrollView* scroller = [[((NSView*)nodeView) subviews] objectAtIndex: 0]; //setAutohidesScrollers
    [scroller setHasHorizontalScroller: YES];
    [scroller setHasVerticalScroller: YES];
    [scroller setAutohidesScrollers: NO];
    
    self.mimeView = nodeView;
    
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc addObserver: self.mimeView selector: @selector(viewFrameChanged:) name: NSViewFrameDidChangeNotification object: self.mimeView];

    [self loadData];

    [super createSubviews];
}

-(void) dealloc {
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver: self.mimeView];
}

@end
